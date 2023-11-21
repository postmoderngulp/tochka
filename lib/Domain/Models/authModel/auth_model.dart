import 'package:flutter/material.dart';
import '../../../Navigation/navigation.dart';

class AuthModel {
  void goToEntry(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.EntryScreen);
  }
}
