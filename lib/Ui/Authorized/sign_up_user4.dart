import 'package:Tochka_Sbora/Domain/Models/authModel/sign_up_user4_model.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignUpUser4 extends StatelessWidget {
  const SignUpUser4({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpUser4Model(),
      child: const SubSignUpUser4(),
    );
  }
}

class SubSignUpUser4 extends StatelessWidget {
  const SubSignUpUser4({super.key});

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return Container(
      color: Colors.white,
      child: SafeArea(
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
                  ],
                ),
              ),
              SizedBox(
                height: 95.h,
              ),
              Text(
                'Подтвердите свой адрес электронной почты перейдя по ссылкке отправленной по адресу $email',
                textAlign: TextAlign.center,
                style: TextStylee.TitleSora,
              ),
              const Spacer(),
              const finishRegister(),
              SizedBox(
                height: 95.h,
              )
            ],
          ),
        ),
      )),
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

class finishRegister extends StatelessWidget {
  const finishRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SignUpUser4Model>();
    return Center(
      child: SizedBox(
        width: 300.w,
        height: 46.h,
        child: ElevatedButton(
          onPressed: () => model.goToConfirmEmail(context),
          style: Buttonstyle.main_button_style,
          child: Text(
            "Завершить регистрацию",
            style: TextStylee.myDateWhite_text,
          ),
        ),
      ),
    );
  }
}
