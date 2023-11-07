import 'package:flutter/material.dart';
import '../../Navigation/navigation.dart';

class MainAppBarModel {
  void goToProfileScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ProfilePaths);
  }
}
