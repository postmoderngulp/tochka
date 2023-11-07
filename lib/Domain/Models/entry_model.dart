import 'package:flutter/material.dart';
import '../../Navigation/navigation.dart';

class EntryModel {
  void goToMainScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.MainfromEntrScreen);
  }
}
