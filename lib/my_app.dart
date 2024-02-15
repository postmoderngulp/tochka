import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localization/flutter_localization.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    NavigateService navigateService = NavigateService();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        localizationsDelegates: localization.localizationsDelegates,
        supportedLocales: const [Locale('ru')],
        theme: ThemeData(
            colorScheme: ColorScheme.light(primary: colors.MainColor)),
        debugShowCheckedModeBanner: false,
        initialRoute: navigateService.initialRoute,
        routes: navigateService.routes,
      ),
    );
  }
}
