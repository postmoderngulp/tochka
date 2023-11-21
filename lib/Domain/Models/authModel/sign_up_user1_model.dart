import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../Navigation/navigation.dart';

class SignUpUser1Model {
  String firstName = "";
  String lastName = "";
  String password = "";
  String nickName = "";
  String email = "";
  String about = "";
  String dob = "";
  String sex = "";

  void goToSignUpUser2(
      BuildContext context,
      String firstName,
      String username,
      String lastName,
      String email,
      String about,
      String dob,
      String sex,
      String password) {
    final arg = test(
        firstName: firstName,
        username: username,
        lastName: lastName,
        email: email,
        about: about,
        dob: dob,
        sex: sex,
        password: password);
    Navigator.of(context)
        .pushNamed(NavigationRoutes.ChooseRegistrUser2Paths, arguments: arg);
  }

  void goToSignUpAdmin(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrAdm1Paths);
  }
}
