// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Domain/demoEntity/interesting.dart';

class ProfileState {
  String aboutMe;
  List<Interesting> listInteresting = [
    Interesting(
        picture: Image.asset('assets/image/programming.png'),
        label: 'Программирование'),
  ];
  bool isDone;
  List<event> listMyEvent;
  String path;
  String name;
  String surname;
  String email;
  ProfileState({
    required this.aboutMe,
    required this.listInteresting,
    required this.isDone,
    required this.listMyEvent,
    required this.path,
    required this.name,
    required this.surname,
    required this.email,
  });

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;

    return other.aboutMe == aboutMe &&
        listEquals(other.listInteresting, listInteresting) &&
        other.isDone == isDone &&
        listEquals(other.listMyEvent, listMyEvent) &&
        other.path == path &&
        other.name == name &&
        other.surname == surname &&
        other.email == email;
  }

  @override
  int get hashCode {
    return aboutMe.hashCode ^
        listInteresting.hashCode ^
        isDone.hashCode ^
        listMyEvent.hashCode ^
        path.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        email.hashCode;
  }

  ProfileState copyWith({
    String? aboutMe,
    List<Interesting>? listInteresting,
    bool? isDone,
    List<event>? listMyEvent,
    String? path,
    String? name,
    String? surname,
    String? email,
  }) {
    return ProfileState(
      aboutMe: aboutMe ?? this.aboutMe,
      listInteresting: listInteresting ?? this.listInteresting,
      isDone: isDone ?? this.isDone,
      listMyEvent: listMyEvent ?? this.listMyEvent,
      path: path ?? this.path,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'ProfileState(aboutMe: $aboutMe, listInteresting: $listInteresting, isDone: $isDone, listMyEvent: $listMyEvent, path: $path, name: $name, surname: $surname, email: $email)';
  }
}

abstract class ProfileEvents {}

class IsDoneEvents implements ProfileEvents {}

class GetEvents implements ProfileEvents {}

class SetNameEvents implements ProfileEvents {
  String name;
  SetNameEvents({
    required this.name,
  });
}

class SetPathEvents implements ProfileEvents {
  String path;
  SetPathEvents({
    required this.path,
  });
}

class SetSurnameEvents implements ProfileEvents {
  String surname;
  SetSurnameEvents({
    required this.surname,
  });
}

class SetEmailEvents implements ProfileEvents {
  String email;
  SetEmailEvents({
    required this.email,
  });
}

class profileBloc {
  ProfileState _state = ProfileState(
      aboutMe: '',
      isDone: false,
      listMyEvent: [],
      path: "",
      name: "",
      surname: "",
      email: "",
      listInteresting: [
        Interesting(
            picture: Image.asset('assets/image/programming.png'),
            label: 'Программирование'),
      ]);

  final _eventController = StreamController<ProfileEvents>.broadcast();
  late final Stream<ProfileState> _stream;

  Stream<ProfileState> get stream => _stream;
  ProfileState get state => _state;

  void disPatch(ProfileEvents event) {
    _eventController.add(event);
  }

  profileBloc() {
    _stream = _eventController.stream
        .asyncExpand<ProfileState>(_mapEventsToStream)
        .asyncExpand(_updateState)
        .asBroadcastStream();
    _stream.listen((event) {});
    disPatch(GetEvents());
  }

  Stream<ProfileState> _updateState(ProfileState state) async* {
    if (_state == state) return;
    _state = state;
    yield state;
  }

  Stream<ProfileState> _mapEventsToStream(ProfileEvents event) async* {
    if (event is IsDoneEvents) {
      yield ProfileState(
          isDone: !_state.isDone,
          listMyEvent: _state.listMyEvent,
          path: _state.path,
          name: _state.name,
          surname: _state.surname,
          email: _state.email,
          aboutMe: _state.aboutMe,
          listInteresting: _state.listInteresting);
    } else if (event is GetEvents) {
      final api = Api();
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: "access");
      int id = 0;
      final Token = token?.split(".")[1];
      List<int> res = base64.decode(base64.normalize(Token!));
      final decodeVal = utf8.decode(res);

      const start = "\"user_id\":";
      const end = "}";
      final startIndex = decodeVal.indexOf(start);
      final endIndex = decodeVal.indexOf(end, startIndex + start.length);
      final Id = decodeVal.substring(startIndex + start.length, endIndex);

      final listProfile = await api.getAllProfile();
      listProfile.forEach((element) {
        if (element.user_id == int.parse(Id)) id = element.id!;
      });

      final listMyEvent = await api.getMyEvent(token!);
      final Profile = await api.getConcretProfile(id);

      yield ProfileState(
          isDone: _state.isDone,
          listMyEvent: listMyEvent,
          path: Profile.avatar_path,
          name: Profile.first_name,
          surname: Profile.last_name,
          email: Profile.email,
          listInteresting: [
            Interesting(
                picture: Image.asset('assets/image/programming.png'),
                label: 'Программирование'),
          ],
          aboutMe: _state.aboutMe);
    } else if (event is SetEmailEvents) {
    } else if (event is SetNameEvents) {
    } else if (event is SetPathEvents) {
    } else if (event is SetSurnameEvents) {}
  }
}
