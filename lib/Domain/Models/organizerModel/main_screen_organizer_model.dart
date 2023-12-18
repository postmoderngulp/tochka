import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Navigation/Navigation.dart';
import 'package:flutter/material.dart';

class mainScreenOrganizerModel extends ChangeNotifier {
  bool isDone = false;
  List<event> listEvent = [];

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
