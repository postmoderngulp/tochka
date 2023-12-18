import 'package:Tochka_Sbora/Domain/Models/authModel/sign_up_user3_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import '../../style/styles/text_style.dart';

class SignUpUser3 extends StatelessWidget {
  const SignUpUser3({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpUser3Model(),
      child: const subSignUpUser3(),
    );
  }
}

class subSignUpUser3 extends StatelessWidget {
  const subSignUpUser3({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser3Model>();
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            const backButton(),
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/image/first_progress.svg",
                    width: 94.w,
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  SvgPicture.asset(
                    "assets/image/first_progress.svg",
                    width: 94.w,
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  SvgPicture.asset(
                    "assets/image/neutral_progress.svg",
                    width: 94.w,
                    height: 3.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Загрузите фотографию",
              style: TextStylee.main_title_text,
            ),
            SizedBox(
              height: 76.h,
            ),
            Center(
              child: SvgPicture.asset(
                "assets/image/noImage.svg",
                width: 146.w,
                height: 146.h,
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 300.w,
                height: 46.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: Buttonstyle.main_button_style,
                  child: Text(
                    "Загрузить",
                    style: TextStylee.myDateWhite_text,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            GestureDetector(
              onTap: () => model.goToEntry(context),
              child: Center(
                child: Text(
                  "Пропустить",
                  style: TextStylee.Localsecond_text,
                ),
              ),
            ),
            SizedBox(
              height: 53.h,
            ),
          ],
        ),
      ),
    ));
  }
}

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: SvgPicture.asset("assets/image/backButton.svg"));
  }
}
