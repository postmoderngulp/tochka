import 'package:flutter/material.dart';

class mainScreenModel extends ChangeNotifier {
  bool isLike = false;

  void setLike() {
    isLike = !isLike;
    notifyListeners();
  }
}
