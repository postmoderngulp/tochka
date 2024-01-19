import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/material.dart';

class SignUpUser3Model extends ChangeNotifier {
  void goToEntry(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(NavigationRoutes.EntryScreen, (r) => false);
  }
}
