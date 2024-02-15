import 'dart:convert';
import 'package:Tochka_Sbora/Domain/Entity/test.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Domain/Models/authModel/sign_up_user2_model.dart';
import '../../style/styles/text_style.dart';

class SignUpUser2 extends StatelessWidget {
  const SignUpUser2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
            create: (context) => SignUpUser2Model(),
            child: const subSignUpUser2()),
      ),
    );
  }
}

class subSignUpUser2 extends StatelessWidget {
  const subSignUpUser2({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser2Model>();
    final args = ModalRoute.of(context)!.settings.arguments as test;
    final dropValue = ValueNotifier('');
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                    "assets/image/active_progress.svg",
                    width: 70.w,
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/image/active_progress.svg",
                    width: 70.w,
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/image/neutral_progress.svg",
                    width: 70.w,
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/image/neutral_progress.svg",
                    width: 70.w,
                    height: 3.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Выбери свои",
              style: TextStylee.title_text,
            ),
            Text(
              "увлечения",
              style: TextStylee.title_text,
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              "На основе ваших интересов мы подберем наиболее подходящие мероприятия и группы",
              style: TextStylee.subTitleSora,
            ),
            SizedBox(
              height: 30.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                    children: List.generate(
                  model.listHobby.length,
                  (index) => item(index: index),
                )),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: SizedBox(
                    width: 300.w,
                    height: 46.h,
                    child: ElevatedButton(
                      onPressed: () => model.createUser(
                          args.firstName,
                          args.username,
                          args.lastName,
                          args.email,
                          args.about,
                          args.dob,
                          args.sex,
                          args.password,
                          context),
                      style: Buttonstyle.main_button_style,
                      child: Text(
                        "Продолжить",
                        style: TextStylee.myDateWhite_text,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
          ],
        ),
      ),
    );
  }
}

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: SvgPicture.asset(
          "assets/image/arrow-left.svg",
          width: 22.w,
          height: 22.h,
        ));
  }
}

class item extends StatelessWidget {
  int index;
  item({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser2Model>();
    String title = utf8.decode(model.listHobby[index].label.runes.toList());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
      child: SizedBox(
        height: 40.h,
        child: ElevatedButton(
          onPressed: () => model.listHobby[index].isDone
              ? model.disarrangeVal(index)
              : model.setVal(index),
          style: model.listHobby[index].isDone
              ? Buttonstyle.self_button_style
              : Buttonstyle.inActive_self_button_style,
          child: Text(
            title,
            style: model.listHobby[index].isDone
                ? TextStylee.hobby_text
                : TextStylee.inactive_hobby_text,
          ),
        ),
      ),
    );
  }
}
