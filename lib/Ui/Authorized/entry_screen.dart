import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Domain/Models/authModel/entry_bloc.dart';
import '../../style/styles/button_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../style/styles/text_style.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Provider(
          create: (context) => EntryBloc(), child: const subEntryScreen()),
    ));
  }
}

class subEntryScreen extends StatelessWidget {
  const subEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EntryBloc>();
    return StreamBuilder<EntryState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 75.h),
                Center(
                  child: SvgPicture.asset(
                    "assets/image/logo.svg",
                    width: 55.5.w,
                    height: 55.5.h,
                  ),
                ),
                SizedBox(height: 20.5.h),
                Center(
                  child: SvgPicture.asset(
                    "assets/image/logo_text.svg",
                    width: 176.w,
                    height: 23.h,
                  ),
                ),
                SizedBox(height: 62.04.h),
                Text(
                  "Вход",
                  style: TextStylee.title_text,
                ),
                SizedBox(
                  height: 22.h,
                ),
                Center(
                  child: SizedBox(
                    width: 313.w,
                    height: 55.h,
                    child: CupertinoTextField(
                      prefix: Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, top: 12.h, bottom: 12.h),
                        child: SvgPicture.asset(
                          "assets/image/Message.svg",
                          width: 22.w,
                          height: 22.h,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 14.w),
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      onChanged: (value) =>
                          bloc.dispatch(NicknameEvents(name: value)),
                      placeholder: "Электронная почта",
                      placeholderStyle: TextStylee.fieldStyle,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 19.5.h),
                Center(
                  child: SizedBox(
                    width: 313.w,
                    height: 55.h,
                    child: CupertinoTextField(
                      prefix: Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, top: 12.h, bottom: 12.h),
                        child: SvgPicture.asset(
                          "assets/image/Lock.svg",
                          width: 22.w,
                          height: 22.h,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 14.w),
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      onChanged: (value) =>
                          bloc.dispatch(PasswordEvents(password: value)),
                      placeholder: "Пароль",
                      placeholderStyle: TextStylee.fieldStyle,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.5.h,
                ),
                GestureDetector(
                  onTap: () =>
                      bloc.dispatch(GoToRecoveryEvents(context: context)),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Забыли пароль?",
                      style: TextStylee.littleStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                ),
                Center(
                  child: SizedBox(
                    width: 271.w,
                    height: 58.h,
                    child: ElevatedButton(
                      onPressed: () => bloc.dispatch(SignInEvents(
                          name: snapshot.requireData.nickName,
                          password: snapshot.requireData.password,
                          context: context)),
                      style: Buttonstyle.main_button_style,
                      child: Text(
                        "Войти",
                        style: TextStylee.buttonTxtStyle,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: TextButton(
                      onPressed: () =>
                          bloc.dispatch(GoToRegistrEvents(context: context)),
                      child: GestureDetector(
                        onTap: () =>
                            bloc.dispatch(GoToRegistrEvents(context: context)),
                        child: RichText(
                            text: TextSpan(
                                text: 'Еще нет аккаунта?',
                                style: TextStylee.littleBlackTxt,
                                children: [
                              const TextSpan(text: '  '),
                              TextSpan(
                                text: 'Зарегистрироваться',
                                style: TextStylee.littleMainTxt,
                              ),
                            ])),
                      )),
                ),
                SizedBox(
                  height: 43.h,
                )
              ],
            ),
          );
        });
  }
}
