import 'package:Tochka_Sbora/Domain/Models/sign_up.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../style/styles/text_style.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Provider(
          create: (context) => signUpModel(), child: const subSignUp()),
    ));
  }
}

class subSignUp extends StatelessWidget {
  const subSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 250.h,
          ),
          Text(
            "Как вы хотите ",
            style: TextStylee.title_text,
          ),
          Text(
            "зарегистрироваться?",
            style: TextStylee.title_text,
          ),
          SizedBox(
            height: 100.h,
          ),
          const commonButton(),
          SizedBox(
            height: 20.h,
          ),
          const adminButton(),
        ],
      ),
    );
  }
}

class commonButton extends StatelessWidget {
  const commonButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<signUpModel>();
    return SizedBox(
      width: 180.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () => model.goToUserSignUp(context),
        style: Buttonstyle.main_button_style,
        child: Text(
          "Пользователь",
          style: TextStylee.white_text,
        ),
      ),
    );
  }
}

class adminButton extends StatelessWidget {
  const adminButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<signUpModel>();
    return SizedBox(
      width: 180.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () => model.goToAdminSignUp(context),
        style: Buttonstyle.baseMain_button_style,
        child: Text(
          "Администратор",
          style: TextStylee.main_text,
        ),
      ),
    );
  }
}
