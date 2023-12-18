import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/material.dart';

class RecoveryPasswordModel extends ChangeNotifier {
  void goToCreatePassword(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.newPasswordScreen);
  }
}
