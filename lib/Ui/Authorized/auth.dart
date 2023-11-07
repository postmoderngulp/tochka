import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Domain/Models/auth_model.dart';

class Authorized extends StatelessWidget {
  const Authorized({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Provider(
            create: (context) => AuthModel(), child: const subAuthorized()),
      ),
    );
  }
}

class subAuthorized extends StatelessWidget {
  const subAuthorized({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/Background.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
            ),
            Image.asset(
              "assets/image/splash.png",
              width: 200.w,
              height: 200.h,
            ),
            SizedBox(height: 90.h),
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => model.goToEntry(context),
                style: Buttonstyle.base_button_style,
                child: Text(
                  "Войти",
                  style: TextStylee.main_text,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => model.goToRegistr(context),
                style: Buttonstyle.trans_button_style,
                child: Text(
                  "Регистрация",
                  style: TextStylee.white_text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
