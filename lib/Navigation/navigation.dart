import 'package:Tochka_Sbora/Ui/Authorized/sign_up_user2.dart';
import 'package:Tochka_Sbora/Ui/Common/main_screen.dart';
import 'package:Tochka_Sbora/Ui/Common/main_screen_common.dart';
import 'package:Tochka_Sbora/Ui/Common/profile_screen.dart';
import 'package:flutter/material.dart';
import '../Ui/Authorized/entry_screen.dart';
import '../Ui/Authorized/sign_up_admin1.dart';
import '../Ui/Authorized/sign_up_admin2.dart';
import '../Ui/Authorized/sign_up_user1.dart';

abstract class NavigationRoutes {
  static String EntryScreen = 'auth/Entry';
  static String MainfromEntrScreen = 'auth/Entry/mainScreen';
  static String ChooseRegistrAdm1Paths = 'auth/admin1';
  static String ChooseRegistrAdm2Paths = 'auth/admin1/admin2';
  static String ChooseRegistrUser1Paths = 'auth/user1';
  static String ChooseRegistrUser2Paths = 'auth/user1/user2';
  static String MainScreen = 'auth/user1/user2/mainScreen';
  static String chooseLocation = 'auth/user1/user2/mainScreen/location';
  static String ProfilePaths = 'auth/user1/user2/ProfilePaths';
  static String NotificationScreen = 'auth/user1/user2/notificScreen';
}

class NavigateService {
  String initialRoute = NavigationRoutes.EntryScreen;

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoutes.EntryScreen: (context) => const EntryScreen(),
    NavigationRoutes.MainfromEntrScreen: (context) => mainSreenCompany(),
    NavigationRoutes.ProfilePaths: (context) => const ProfileScreen(),
    NavigationRoutes.ChooseRegistrUser1Paths: (context) => const signUpUser1(),
    NavigationRoutes.ChooseRegistrUser2Paths: (context) => const SignUpUser2(),
    NavigationRoutes.ChooseRegistrAdm1Paths: (context) => const SignUpAdmin1(),
    NavigationRoutes.ChooseRegistrAdm2Paths: (context) => const SignUpAdmin2(),
    NavigationRoutes.MainScreen: (context) => const MainScreen(),
  };
}
