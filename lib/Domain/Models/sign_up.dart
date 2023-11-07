import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/material.dart';

class signUpModel {
  void goToAdminSignUp(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrAdm1Paths);
  }

  void goToUserSignUp(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrUser1Paths);
  }
}
