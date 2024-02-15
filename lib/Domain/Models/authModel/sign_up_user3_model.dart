import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/material.dart';

class SignUpUser3Model extends ChangeNotifier {
  void goToConfirmEmail(BuildContext context, String email) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(NavigationRoutes.EntryScreen, (r) => false);
  }
}
