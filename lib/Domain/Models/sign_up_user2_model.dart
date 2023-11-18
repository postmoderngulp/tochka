import 'package:flutter/cupertino.dart';
import '../../Navigation/navigation.dart';

class SignUpUser2Model extends ChangeNotifier {
  int val = -1;
  List<String> listHobby = [
    "Изучение языков",
    "Кулинария",
    "Бизнес",
    "Спорт",
    "Программирование"
  ];

  void goToRegistrUser2(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.EntryScreen);
  }

  void setVal(int index) {
    val = index;
    notifyListeners();
  }
}
