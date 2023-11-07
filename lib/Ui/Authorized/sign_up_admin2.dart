import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import '../../Domain/Models/sign_up_admin2_model.dart';
import '../../style/styles/text_style.dart';

class SignUpAdmin2 extends StatelessWidget {
  const SignUpAdmin2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Provider(
            create: (context) => SignUpAdmin2Model(),
            child: const subSignUpAdmin2()),
      ),
    );
  }
}

class subSignUpAdmin2 extends StatelessWidget {
  const subSignUpAdmin2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 125.h,
          ),
          Text(
            "Введите код",
            style: TextStylee.title_text,
          ),
          Text(
            "администратора",
            style: TextStylee.title_text,
          ),
          SizedBox(
            height: 50.h,
          ),
          const inputConfirmCode(),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Код выдается другим администратором",
            style: TextStylee.second_text,
          ),
          Text(
            "для подтверждения регистрации",
            style: TextStylee.second_text,
          ),
          SizedBox(
            height: 220.h,
          ),
          const continueButton(),
        ],
      ),
    );
  }
}

class inputConfirmCode extends StatelessWidget {
  const inputConfirmCode({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SignUpAdmin2Model>();
    return SizedBox(
      width: 210.w,
      height: 100.h,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(0)),
          hintStyle: TextStylee.second_text,
        ),
      ),
    );
  }
}

class continueButton extends StatelessWidget {
  const continueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SignUpAdmin2Model>();
    return SizedBox(
      width: 180.w,
      height: 45.h,
      child: ElevatedButton(
        onPressed: () => model.ShowDialog(context),
        style: Buttonstyle.baseMain_button_style,
        child: Text(
          "Продолжить",
          style: TextStylee.main_text,
        ),
      ),
    );
  }
}
