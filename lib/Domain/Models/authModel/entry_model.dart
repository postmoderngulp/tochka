import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../Navigation/navigation.dart';

class EntryModel {
  String nickName = "";
  String password = "";

  void goToMainScreenUser(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.MainScreenUser);
  }

  void goEnter(String userName, String Password, BuildContext context) async {
    final api = Api();
    final token = await api.getToken(userName, Password);
    const storage = FlutterSecureStorage();
    await storage.write(key: "refresh", value: token.refresh);
    await storage.write(key: "access", value: token.access);
    final val = await storage.read(
      key: "isOrganizer",
    );
    goToMainScreenAdmin(context);
  }

  void goToMainScreenAdmin(
    BuildContext context,
  ) async {
    Navigator.of(context).pushNamed(NavigationRoutes.MainScreenAdmin);
  }

  void goToRegistr(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrUser1Paths);
  }
}
