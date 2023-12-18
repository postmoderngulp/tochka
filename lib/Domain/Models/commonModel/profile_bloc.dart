// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';

class ProfileState {
  bool isDone;
  List<event> listMyEvent;
  String path;
  String name;
  String surname;
  String email;
  ProfileState({
    required this.isDone,
    required this.listMyEvent,
    required this.path,
    required this.name,
    required this.surname,
    required this.email,
  });

  ProfileState copyWith({
    bool? isDone,
    List<event>? listMyEvent,
    String? path,
    String? name,
    String? surname,
    String? email,
  }) {
    return ProfileState(
      isDone: isDone ?? this.isDone,
      listMyEvent: listMyEvent ?? this.listMyEvent,
      path: path ?? this.path,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;

    return other.isDone == isDone &&
        listEquals(other.listMyEvent, listMyEvent) &&
        other.path == path &&
        other.name == name &&
        other.surname == surname &&
        other.email == email;
  }

  @override
  int get hashCode {
    return isDone.hashCode ^
        listMyEvent.hashCode ^
        path.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        email.hashCode;
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
      isDone: false,
      listMyEvent: [],
      path: "",
      name: "",
      surname: "",
      email: "");

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
          email: _state.email);
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
          email: Profile.email);
    } else if (event is SetEmailEvents) {
    } else if (event is SetNameEvents) {
    } else if (event is SetPathEvents) {
    } else if (event is SetSurnameEvents) {}
  }
}
