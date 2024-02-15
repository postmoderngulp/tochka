import 'package:Tochka_Sbora/Domain/Models/authModel/recovery_password_model.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecoveryPasswordModel(),
      child: const subRecoveryPassword(),
    );
  }
}

class subRecoveryPassword extends StatelessWidget {
  const subRecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 53.h,
            ),
            const backButton(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Восстановление пароля",
              style: TextStylee.title_text,
            ),
            SizedBox(
              height: 13.h,
            ),
            Text(
              "Пожалуйста, введите свой адрес электронной почты, чтобы запросить сброс пароля",
              style: TextStylee.bannerName_text,
            ),
            SizedBox(
              height: 36.h,
            ),
            const EmailField(),
            SizedBox(
              height: 40.h,
            ),
            const DropPassword()
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
        child: SvgPicture.asset(
          "assets/image/arrow-left.svg",
          width: 22.w,
          height: 22.h,
        ));
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 313.w,
        height: 56.h,
        child: CupertinoTextField(
          prefix: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
            child: SvgPicture.asset(
              "assets/image/Message.svg",
              width: 22.w,
              height: 22.h,
              colorFilter: ColorFilter.mode(colors.neutral300, BlendMode.srcIn),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 14.w),
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "abc@email.com",
          placeholderStyle: TextStylee.fieldStyle,
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class DropPassword extends StatelessWidget {
  const DropPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RecoveryPasswordModel>();
    return Center(
      child: SizedBox(
        width: 271.w,
        height: 58.h,
        child: ElevatedButton(
          onPressed: () => model.goToCreatePassword(context),
          style: Buttonstyle.main_button_style,
          child: Text(
            "Сбросить пароль",
            style: TextStylee.myDateWhite_text,
          ),
        ),
      ),
    );
  }
}
