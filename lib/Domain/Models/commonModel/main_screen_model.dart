import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Navigation/Navigation.dart';
import 'package:flutter/material.dart';

class mainScreenModel extends ChangeNotifier {
  bool isDone = false;
  List<event> listEvent = [];

  mainScreenModel() {
    _setup();
  }

  void goToMoreInfoUser(BuildContext context, event event) {
    Navigator.of(context)
        .pushNamed(NavigationRoutes.MoreInfoEventUser, arguments: event);
  }

  void _setup() async {
    final api = Api();
    listEvent = await api.getAllEvent();
    notifyListeners();
  }

  void setDone() {
    isDone = !isDone;
    notifyListeners();
  }
}
