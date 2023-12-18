import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/material.dart';

class NewPasswordModel extends ChangeNotifier {
  void goToEntry(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.EntryScreen);
  }
}
