import 'package:flutter/cupertino.dart';
import '../../Navigation/navigation.dart';

class SignUpUser2Model {
  void goToRegistrUser2(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.EntryScreen);
  }
}
