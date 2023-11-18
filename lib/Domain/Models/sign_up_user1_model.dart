import 'package:flutter/cupertino.dart';
import '../../Navigation/navigation.dart';

class SignUpUser1Model {
  void goToSignUpUser2(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrUser2Paths);
  }

  void goToSignUpAdmin(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrAdm1Paths);
  }
}
