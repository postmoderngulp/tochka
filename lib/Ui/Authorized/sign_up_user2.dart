import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import '../../Domain/Models/sign_up_user2_model.dart';
import '../../style/styles/text_style.dart';

class SignUpUser2 extends StatelessWidget {
  const SignUpUser2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Provider(
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
    final model = context.read<SignUpUser2Model>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140.h,
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
            height: 40.h,
          ),
          Column(
            children: [
              SizedBox(
                width: 350.w,
                height: 45.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: colors.TextColor, width: 1),
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: "Найти увлечение...",
                    hintStyle: TextStylee.second_text,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 160.w,
                        height: 45.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.edu_button_style,
                          child: Text(
                            "Учеба",
                            style: TextStylee.hobby_text,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 160.w,
                        height: 45.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.sport_button_style,
                          child: Text(
                            "Спорт",
                            style: TextStylee.hobby_text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 160.w,
                        height: 45.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.language_button_style,
                          child: Text(
                            "Ин Языки",
                            style: TextStylee.hobby_text,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 160.w,
                        height: 45.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.business_button_style,
                          child: Text(
                            "Бизнес",
                            style: TextStylee.hobby_text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 160.w,
                        height: 45.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.communicate_button_style,
                          child: Text(
                            "Общение",
                            style: TextStylee.hobby_text,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 160.w,
                        height: 45.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.self_button_style,
                          child: Text(
                            "Саморазвитие",
                            style: TextStylee.hobby_text,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  SizedBox(
                    width: 160.w,
                    height: 45.h,
                    child: ElevatedButton(
                      onPressed: () => model.goToRegistrUser2(context),
                      style: Buttonstyle.baseMain_button_style,
                      child: Text(
                        "Продолжить",
                        style: TextStylee.main_text,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
