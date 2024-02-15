import 'package:Tochka_Sbora/Domain/Models/authModel/new_password.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:provider/provider.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewPasswordModel(),
      child: const subNewPassword(),
    );
  }
}

class subNewPassword extends StatelessWidget {
  const subNewPassword({super.key});

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
              "Новый пароль",
              style: TextStylee.title_text,
            ),
            SizedBox(
              height: 33.h,
            ),
            const PasswordField(),
            SizedBox(
              height: 20.h,
            ),
            const RepeatPasswordField(),
            SizedBox(
              height: 39.h,
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

class DropPassword extends StatelessWidget {
  const DropPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<NewPasswordModel>();
    return Center(
      child: SizedBox(
        width: 271.w,
        height: 58.h,
        child: ElevatedButton(
          onPressed: () => model.goToEntry(context),
          style: Buttonstyle.main_button_style,
          child: Text(
            "Сбросить пароль",
            style: TextStylee.fieldStyle,
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

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
              "assets/image/Lock.svg",
              width: 22.w,
              height: 22.h,
              colorFilter: ColorFilter.mode(colors.neutral300, BlendMode.srcIn),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 14.w),
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Пароль",
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

class RepeatPasswordField extends StatelessWidget {
  const RepeatPasswordField({super.key});

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
              "assets/image/Lock.svg",
              width: 22.w,
              height: 22.h,
              colorFilter: ColorFilter.mode(colors.neutral300, BlendMode.srcIn),
            ),
          ),
          obscureText: true,
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 14.w),
          style: TextStylee.fieldStyle,
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Повторите пароль",
          placeholderStyle: TextStylee.second_text,
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
