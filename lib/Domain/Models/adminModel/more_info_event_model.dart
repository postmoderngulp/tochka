import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class moreInfoEventAdminModel extends ChangeNotifier {
  String isSubscribe = "";

  moreInfoEventAdminModel() {
    _setup();
  }

  void _setup() async {
    const storage = FlutterSecureStorage();
    isSubscribe = (await storage.read(key: isSubscribe))!;
    notifyListeners();
  }

  void subScribe(int id) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "access");
    await storage.write(key: isSubscribe, value: "true");
    api.SubscribeEvent(id, token!);
    notifyListeners();
    isSubscribe = (await storage.read(key: isSubscribe))!;
    notifyListeners();
  }

  void unSubScribe(int id) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    await storage.write(key: isSubscribe, value: "false");
    final token = await storage.read(key: "access");
    api.unSubscribeEvent(id, token!);
    isSubscribe = (await storage.read(key: isSubscribe))!;
    notifyListeners();
  }
}
