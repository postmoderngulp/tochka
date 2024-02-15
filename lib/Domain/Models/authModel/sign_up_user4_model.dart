import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/cupertino.dart';

class SignUpUser4Model extends ChangeNotifier {
  void goToConfirmEmail(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(NavigationRoutes.EntryScreen, (r) => false);
  }
}
