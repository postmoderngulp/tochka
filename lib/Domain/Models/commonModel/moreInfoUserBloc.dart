import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';

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

class GetEvents implements MoreInfoScreenEvents {
  @override
  int id = -1;
  event Event;
  GetEvents({
    required this.Event,
  });
}

class Setup implements MoreInfoScreenEvents {
  @override
  int id = -1;
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

  MoreInfoScreenBloc(event Event) {
    _stream = _eventController.stream
        .asyncExpand<MoreInfoScreenState>(_mapEventsToStream)
        .asyncExpand(_updateState)
        .asBroadcastStream();
    _stream.listen((event) {});
    disPatch(GetEvents(Event: Event));
    disPatch(Setup());
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
    } else if (event is GetEvents) {
      final api = Api();
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: "access");
      final listEvent = await api.getMyEvent(token!);
      final val = listEvent.contains(event.Event);
      await storage.write(key: "isSubscribe", value: val.toString());
      print(val);
    } else if (event is Setup) {
      const storage = FlutterSecureStorage();
      final isSubscribe = await storage.read(key: "isSubscribe");
      bool val = isSubscribe == 'true' ? true : false;
      yield MoreInfoScreenState(
        isSubscribe: val,
      );
    }
  }
}
