import 'package:flutter/material.dart';

class createEventModel extends ChangeNotifier {
  List<String> listHobby = [
    "Изучение языков",
    "Кулинария",
    "Бизнес",
    "Спорт",
    "Программирование"
  ];

  void createEvent(BuildContext context) {
    Navigator.of(context).pop();
  }
}
