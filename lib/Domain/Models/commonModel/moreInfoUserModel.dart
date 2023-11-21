import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class moreInfoEventUserModel extends ChangeNotifier {
  bool isSubscribe = false;

  void subScribe(int id) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "access");
    api.SubscribeEvent(id, token!);
    notifyListeners();
    isSubscribe = true;
    notifyListeners();
  }

  void unSubScribe(int id) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "access");
    api.unSubscribeEvent(id, token!);
    notifyListeners();
    isSubscribe = false;
    notifyListeners();
  }
}
