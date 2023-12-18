// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:Tochka_Sbora/Domain/Api/api.dart';

import '../../../Navigation/navigation.dart';

class EntryState {
  String nickName;
  String password;
  EntryState({
    required this.nickName,
    required this.password,
  });

  EntryState copyWith({
    String? nickName,
    String? password,
  }) {
    return EntryState(
      nickName: nickName ?? this.nickName,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(covariant EntryState other) {
    if (identical(this, other)) return true;

    return other.nickName == nickName && other.password == password;
  }

  @override
  int get hashCode => nickName.hashCode ^ password.hashCode;
}

abstract class EntryScreenEvents {}

class NicknameEvents implements EntryScreenEvents {
  String name;
  NicknameEvents({
    required this.name,
  });
}

class GoToRecoveryEvents implements EntryScreenEvents {
  BuildContext context;
  GoToRecoveryEvents({
    required this.context,
  });
}

class PasswordEvents implements EntryScreenEvents {
  String password;
  PasswordEvents({
    required this.password,
  });
}

class GoToRegistrEvents implements EntryScreenEvents {
  BuildContext context;
  GoToRegistrEvents({
    required this.context,
  });
}

class SignInEvents implements EntryScreenEvents {
  String name;
  String password;
  BuildContext context;
  SignInEvents({
    required this.name,
    required this.password,
    required this.context,
  });
}

class EntryBloc {
  EntryState _state = EntryState(nickName: "", password: "");

  final _eventController = StreamController<EntryScreenEvents>.broadcast();
  late final Stream<EntryState> _stream;

  Stream<EntryState> get stream => _stream;
  EntryState get state => _state;

  void dispatch(EntryScreenEvents event) {
    _eventController.add(event);
  }

  EntryBloc() {
    _stream = _eventController.stream
        .asyncExpand<EntryState>(_mapEventsToStream)
        .asyncExpand(_updateState)
        .asBroadcastStream();
  }

  Stream<EntryState> _updateState(EntryState state) async* {
    if (_state == state) return;
    _state = state;
    yield state;
  }

  Stream<EntryState> _mapEventsToStream(EntryScreenEvents event) async* {
    if (event is NicknameEvents) {
      yield EntryState(nickName: event.name, password: _state.password);
    } else if (event is PasswordEvents) {
      yield EntryState(nickName: _state.nickName, password: event.password);
    } else if (event is SignInEvents) {
      Navigator.of(event.context).pushNamed(NavigationRoutes.MainScreenAdmin);
      final api = Api();
      final token = await api.getToken(event.name, event.password);
      const storage = FlutterSecureStorage();
      await storage.write(key: "refresh", value: token.refresh);
      await storage.write(key: "access", value: token.access);

      int id = 0;
      String Token = token.access.split(".")[1];
      List<int> res = base64.decode(base64.normalize(Token));
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
      final Profile = await api.getConcretProfile(id);
      Profile.is_organizer
          ? Navigator.of(event.context)
              .pushNamed(NavigationRoutes.MainScreenAdmin)
          : Navigator.of(event.context)
              .pushNamed(NavigationRoutes.MainScreenUser);
    } else if (event is GoToRegistrEvents) {
      Navigator.of(event.context)
          .pushNamed(NavigationRoutes.ChooseRegistrUser1Paths);
    } else if (event is GoToRecoveryEvents) {
      Navigator.of(event.context).pushNamed(NavigationRoutes.recoveryScreen);
    }
  }
}
