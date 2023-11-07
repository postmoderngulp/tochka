import 'package:flutter/material.dart';
import '../../Navigation/navigation.dart';

class AuthModel {
  void goToRegistr(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrPaths);
  }

  void goToEntry(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.EntryScreen);
  }
}
