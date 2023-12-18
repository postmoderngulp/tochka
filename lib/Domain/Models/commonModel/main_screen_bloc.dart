// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Navigation/Navigation.dart';

class MainScreenState {
  bool isDone;
  List<event> listEvent;

  MainScreenState({
    required this.isDone,
    required this.listEvent,
  });

  @override
  bool operator ==(covariant MainScreenState other) {
    if (identical(this, other)) return true;

    return other.isDone == isDone && listEquals(other.listEvent, listEvent);
  }

  @override
  int get hashCode => isDone.hashCode ^ listEvent.hashCode;

  MainScreenState copyWith({
    bool? isDone,
    List<event>? listEvent,
  }) {
    return MainScreenState(
      isDone: isDone ?? this.isDone,
      listEvent: listEvent ?? this.listEvent,
    );
  }
}

abstract class MainScreenEvents {}

class IsDoneEvents implements MainScreenEvents {}

class GetEvents implements MainScreenEvents {}

class GoToMoreInfoEvents implements MainScreenEvents {
  event Event;
  BuildContext context;
  GoToMoreInfoEvents({
    required this.Event,
    required this.context,
  });
}

class MainScreenBloc {
  MainScreenState _state = MainScreenState(isDone: false, listEvent: []);

  final _eventController = StreamController<MainScreenEvents>.broadcast();
  late final Stream<MainScreenState> _stream;

  MainScreenState get state => _state;
  Stream<MainScreenState> get stream => _stream;

  void disPatch(MainScreenEvents event) {
    _eventController.add(event);
  }

  MainScreenBloc() {
    _stream = _eventController.stream
        .asyncExpand<MainScreenState>(_mapEventsToStream)
        .asyncExpand(_updateState)
        .asBroadcastStream();
    _stream.listen((event) {});
    disPatch(GetEvents());
  }

  Stream<MainScreenState> _updateState(MainScreenState state) async* {
    if (_state == state) return;
    _state = state;
    yield state;
  }

  Stream<MainScreenState> _mapEventsToStream(MainScreenEvents event) async* {
    if (event is IsDoneEvents) {
      yield MainScreenState(isDone: true, listEvent: _state.listEvent);
    } else if (event is GetEvents) {
      final api = Api();
      final listEvent = await api.getAllEvent();
      yield MainScreenState(isDone: false, listEvent: listEvent);
    } else if (event is GoToMoreInfoEvents) {
      Navigator.of(event.context).pushNamed(NavigationRoutes.MoreInfoEventUser,
          arguments: event.Event);
    }
  }
}
