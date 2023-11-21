import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileAdminModel extends ChangeNotifier {
  bool isDone = false;
  List<event> listMyEvent = [];
  String path = "";
  String Name = "";
  String Surname = "";
  String email = "";

  ProfileAdminModel() {
    _setup();
  }

  void _setup() async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "access");
    int id = 0;
    final Token = token?.split(".")[1];
    List<int> res = base64.decode(base64.normalize(Token!));
    final decodeVal = utf8.decode(res);
    final listToken = decodeVal.split(":");

    const start = "\"user_id\":";
    const end = "}";
    final startIndex = decodeVal.indexOf(start);
    final endIndex = decodeVal.indexOf(end, startIndex + start.length);
    final Id = decodeVal.substring(startIndex + start.length, endIndex);

    final listProfile = await api.getAllProfile();
    listProfile.forEach((element) {
      if (element.user_id == int.parse(Id)) id = element.id!;
    });

    listMyEvent = await api.getMyEvent(token!);
    final Profile = await api.getConcretProfile(id);
    path = Profile.avatar_path;
    Name = Profile.first_name;
    Surname = Profile.last_name;
    email = Profile.email;
    notifyListeners();
  }

  void setDone() {
    isDone = !isDone;
    notifyListeners();
  }

  void goToCreateEvent(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.createEvent);
  }
}
