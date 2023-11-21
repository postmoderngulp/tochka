import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileUserModel extends ChangeNotifier {
  bool isDone = false;
  List<event> listMyEvent = [];
  String path = "";
  String Name = "";
  String Surname = "";
  String email = "";

  ProfileUserModel() {
    _setup();
  }

  void _setup() async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "access");
    final id = await storage.read(key: "id");
    listMyEvent = await api.getMyEvent(token!);
    final Profile = await api.getConcretProfile(3);
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
}
