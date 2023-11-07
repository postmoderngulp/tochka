import 'package:flutter/material.dart';
import '../../style/permanentEl/admin_alert.dart';

class SignUpAdmin2Model {
  void ShowDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AdminAlert());
  }
}
