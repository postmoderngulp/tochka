import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:Tochka_Sbora/Domain/Api/api.dart';

class MoreInfoScreenState {
  bool isSubscribe;
  MoreInfoScreenState({
    required this.isSubscribe,
  });

  MoreInfoScreenState copyWith({
    bool? isSubscribe,
  }) {
    return MoreInfoScreenState(
      isSubscribe: isSubscribe ?? this.isSubscribe,
    );
  }

  @override
  bool operator ==(covariant MoreInfoScreenState other) {
    if (identical(this, other)) return true;

    return other.isSubscribe == isSubscribe;
  }

  @override
  int get hashCode => isSubscribe.hashCode;
}

abstract class MoreInfoScreenEvents {
  int id;
  MoreInfoScreenEvents({
    required this.id,
  });
}

class SubscribeEvent implements MoreInfoScreenEvents {
  @override
  int id;
  SubscribeEvent({
    required this.id,
  });
}

class UnSubscribeEvent implements MoreInfoScreenEvents {
  @override
  int id;
  UnSubscribeEvent({
    required this.id,
  });
}

class MoreInfoScreenBloc {
  MoreInfoScreenState _state = MoreInfoScreenState(
    isSubscribe: false,
  );

  final _eventController = StreamController<MoreInfoScreenEvents>.broadcast();
  late final Stream<MoreInfoScreenState> _stream;

  MoreInfoScreenState get state => _state;
  Stream<MoreInfoScreenState> get stream => _stream;

  void disPatch(MoreInfoScreenEvents event) {
    _eventController.add(event);
  }

  MoreInfoScreenBloc() {
    _stream = _eventController.stream
        .asyncExpand<MoreInfoScreenState>(_mapEventsToStream)
        .asyncExpand(_updateState)
        .asBroadcastStream();
  }

  Stream<MoreInfoScreenState> _updateState(MoreInfoScreenState state) async* {
    if (_state == state) return;
    _state = state;
    yield state;
  }

  Stream<MoreInfoScreenState> _mapEventsToStream(
      MoreInfoScreenEvents event) async* {
    if (event is SubscribeEvent) {
      final api = Api();
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: "access");
      api.SubscribeEvent(event.id, token!);
      yield MoreInfoScreenState(
        isSubscribe: true,
      );
    } else if (event is UnSubscribeEvent) {
      final api = Api();
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: "access");
      api.unSubscribeEvent(event.id, token!);
      yield MoreInfoScreenState(
        isSubscribe: false,
      );
    }
  }
}
