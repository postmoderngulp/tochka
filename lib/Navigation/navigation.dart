import 'package:Tochka_Sbora/Ui/Authorized/new_password.dart';
import 'package:Tochka_Sbora/Ui/Authorized/recoveryPassword.dart';
import 'package:Tochka_Sbora/Ui/Authorized/sign_up_user2.dart';
import 'package:Tochka_Sbora/Ui/Authorized/sign_up_user3.dart';
import 'package:Tochka_Sbora/Ui/Common/main_screen.dart';
import 'package:Tochka_Sbora/Ui/Common/main_screen_common.dart';
import 'package:Tochka_Sbora/Ui/Common/more_info_event_user.dart';
import 'package:Tochka_Sbora/Ui/Organizer/createEvent.dart';
import 'package:Tochka_Sbora/Ui/Organizer/main_screen_organizer.dart';
import 'package:Tochka_Sbora/Ui/Organizer/members.dart';
import 'package:Tochka_Sbora/Ui/Organizer/moreInfoEvent.dart';
import 'package:flutter/cupertino.dart';
import '../Ui/Authorized/entry_screen.dart';
import '../Ui/Authorized/sign_up_admin1.dart';
import '../Ui/Authorized/sign_up_admin2.dart';
import '../Ui/Authorized/sign_up_user1.dart';

abstract class NavigationRoutes {
  static String EntryScreen = 'auth/Entry';
  static String recoveryScreen = 'auth/Entry/Recovery';
  static String newPasswordScreen = 'auth/Entry/Recovery/newPassword';

  static String MainScreenUser = 'auth/Entry/mainScreenUser';
  static String MoreInfoEventUser =
      'auth/Entry/mainScreenAdmin/MoreInfoEventUser';

  static String MainScreenAdmin = 'auth/Entry/mainScreenAdmin';
  static String MoreInfoEventAdmin =
      'auth/Entry/mainScreenAdmin/moreInfoEventAdmin';
  static String MembersAdmin =
      'auth/Entry/mainScreenAdmin/moreInfoEventAdmin/MembersAdmin';
  static String createEvent = 'auth/Entry/mainScreenAdmin/createEvent';

  static String ChooseRegistrAdm1Paths = 'auth/admin1';
  static String ChooseRegistrAdm2Paths = 'auth/admin1/admin2';

  static String ChooseRegistrUser1Paths = 'auth/user1';
  static String ChooseRegistrUser2Paths = 'auth/user1/user2';
  static String ChooseRegistrUser3Paths = 'auth/user1/user2/user3';

  static String MainScreen = 'auth/user1/user2/user3/mainScreenUser';
  static String chooseLocation =
      'auth/user1/user2/user3/mainScreenUser/location';
}

class NavigateService {
  String initialRoute = NavigationRoutes.EntryScreen;

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoutes.EntryScreen: (context) => const EntryScreen(),
    NavigationRoutes.MainScreenUser: (context) => mainSreenCommon(),
    NavigationRoutes.MainScreenAdmin: (context) => mainSreenOrganizer(),
    NavigationRoutes.ChooseRegistrUser1Paths: (context) => const signUpUser1(),
    NavigationRoutes.ChooseRegistrUser2Paths: (context) => const SignUpUser2(),
    NavigationRoutes.ChooseRegistrUser3Paths: (context) => const SignUpUser3(),
    NavigationRoutes.ChooseRegistrAdm1Paths: (context) => const SignUpAdmin1(),
    NavigationRoutes.ChooseRegistrAdm2Paths: (context) => const SignUpAdmin2(),
    NavigationRoutes.MainScreen: (context) => const MainScreen(),
    NavigationRoutes.createEvent: (context) => const createEvent(),
    NavigationRoutes.MoreInfoEventAdmin: (context) =>
        const moreInfoEventOrganizer(),
    NavigationRoutes.MoreInfoEventUser: (context) => const moreInfoEventUser(),
    NavigationRoutes.MembersAdmin: (context) => const Members(),
    NavigationRoutes.recoveryScreen: (context) => const RecoveryPassword(),
    NavigationRoutes.newPasswordScreen: (context) => const NewPassword(),
  };
}
