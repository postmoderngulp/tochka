import 'package:flutter/material.dart';
import '../../Navigation/navigation.dart';

class EntryModel {
  void goToMainScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.MainfromEntrScreen);
  }

  void goToRegistr(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrUser1Paths);
  }
}
