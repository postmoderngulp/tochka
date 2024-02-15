import 'package:flutter/material.dart';

class FilterCommmonModel extends ChangeNotifier {
  int chooseVal = -1;

  final listTimes = [
    "Сегодня",
    "Завтра",
    "На этой неделе",
  ];

  void setVal(int index) {
    chooseVal = index;
    notifyListeners();
  }
}
