import 'package:flutter/material.dart';
import '../../../Navigation/Navigation.dart';

class SignUpAdmin1Model {
  void goToRegistrAdmin2(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrAdm2Paths);
  }

  void goToSignUpUser(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrUser1Paths);
  }
}
