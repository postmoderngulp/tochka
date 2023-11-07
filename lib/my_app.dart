import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NavigateService navigateService = NavigateService();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: navigateService.initialRoute,
        routes: navigateService.routes,
      ),
    );
  }
}
