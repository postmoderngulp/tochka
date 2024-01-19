import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Navigation/Navigation.dart';
import 'package:flutter/material.dart';

class mainScreenOrganizerModel extends ChangeNotifier {
  bool isDone = false;
  List<event> listEvent = [
    event(
        id: 1,
        title: 'бег',
        description: 'бегать',
        is_open: true,
        max_num_participants: 12,
        datetime_event: '2024-12-12',
        datetime_creation: '2024-11-12',
        organizer_id: 12,
        rate: 1,
        address: 'адресс',
        interests: [],
        participants: [])
  ];

  void setDone() {
    isDone = !isDone;
    notifyListeners();
  }

  mainScreenOrganizerModel() {
    _setup();
  }

  void _setup() async {
    final api = Api();
    listEvent = await api.getAllEvent();
    notifyListeners();
  }

  void goToInfoEvent(BuildContext context, event event) {
    Navigator.of(context)
        .pushNamed(NavigationRoutes.MoreInfoEventAdmin, arguments: event);
  }
}
