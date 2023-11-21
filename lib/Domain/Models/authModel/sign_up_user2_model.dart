import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/Entity/interest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../Navigation/navigation.dart';

class SignUpUser2Model extends ChangeNotifier {
  int val = -1;
  List<interest> listHobby = [];
  List<int> listMyInterest = [];

  SignUpUser2Model() {
    _getInteres();
  }

  void _getInteres() async {
    final api = Api();
    listHobby = await api.getAllInterests();
    notifyListeners();
  }

  void addInterest(int Val, BuildContext context) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "access");
    final id = await storage.read(key: "id");
    final Id = int.parse(id!);
    List<int> listId = [];
    listId.add(Val);
    api.patchConcretProfile(listId, Id, token!);
    goToEntry(context);
  }

  void createUser(
      String firstName,
      String username,
      String lastName,
      String email,
      String about,
      String dob,
      String sex,
      String password,
      BuildContext context) async {
    final api = Api();
    final id = await api.createUser(username, password);
    final profile = await api.createProfile(
        firstName, lastName, email, about, dob, sex, listMyInterest, id);
    const storage = FlutterSecureStorage();
    await storage.write(key: "id", value: profile.user_id.toString());
    await storage.write(
        key: "isOrganizer", value: profile.is_organizer.toString());
    goToEntry(context);
  }

  void goToEntry(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.EntryScreen);
  }

  void goToConfirm(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrAdm2Paths);
  }

  void setVal(int index) {
    val = index;
    listMyInterest.clear();
    listMyInterest.add(val + 1);
    notifyListeners();
  }
}