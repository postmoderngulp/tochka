import 'package:Tochka_Sbora/Domain/Api/api.dart';
import 'package:Tochka_Sbora/Domain/demoEntity/hobby.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../Navigation/navigation.dart';

class SignUpUser2Model extends ChangeNotifier {
  List<Hobbby> listHobby = [];
  List<int> listMyInterest = [];

  SignUpUser2Model() {
    _getInteres();
  }

  void _getInteres() async {
    final api = Api();
    final hobbies = await api.getAllInterests();
    for (int i = 0; i < hobbies.length; i++) {
      listHobby.add(Hobbby(label: hobbies[i].name, isDone: false));
    }
    notifyListeners();
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
    goToAddPhoto(context, email);
    final api = Api();
    final id = await api.createUser(username, password);
    final profile = await api.createProfile(
        firstName, lastName, email, about, dob, sex, listMyInterest, id);
    const storage = FlutterSecureStorage();
    await storage.write(key: "id", value: profile.user_id.toString());
    await storage.write(
        key: "isOrganizer", value: profile.is_organizer.toString());
    goToAddPhoto(context, email);
  }

  void goToAddPhoto(BuildContext context, String email) {
    Navigator.of(context)
        .pushNamed(NavigationRoutes.ChooseRegistrUser3Paths, arguments: email);
  }

  void goToConfirm(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationRoutes.ChooseRegistrAdm2Paths);
  }

  void setVal(int index) {
    listHobby[index].isDone = true;
    listMyInterest.add(index + 1);
    notifyListeners();
  }

  void disarrangeVal(int index) {
    listHobby[index].isDone = false;
    listMyInterest.removeWhere((element) => element == index + 1);
    notifyListeners();
  }
}
