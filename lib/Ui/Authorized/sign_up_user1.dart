import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Domain/Models/authModel/sign_up_user1_model.dart';
import '../../style/styles/button_style.dart';
import '../../style/styles/text_style.dart';
import 'package:provider/provider.dart';

class signUpUser1 extends StatelessWidget {
  const signUpUser1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Provider(
            create: (context) => SignUpUser1Model(),
            child: const subSignUpUser1()),
      ),
    );
  }
}

class subSignUpUser1 extends StatelessWidget {
  const subSignUpUser1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Text(
                "Привет!",
                style: TextStylee.main_title_text,
              ),
              Text(
                "Расскажи о себе:",
                style: TextStylee.title_text,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  // ignore: prefer_const_constructors
                  nicknameField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const nameField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const surnameField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const dobField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const sexField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const aboutField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const emailField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const passwordField(),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "*- данные обязательны для заполнения",
                style: TextStylee.second_text,
              ),
              SizedBox(
                height: 90.h,
              ),
              const continueButton(),
              SizedBox(
                height: 61.h,
              ),
              const linkAdmin()
            ]),
      ),
    );
  }
}

class linkAdmin extends StatelessWidget {
  const linkAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SignUpUser1Model>();
    return Center(
      child: TextButton(
        onPressed: () => model.goToSignUpAdmin(context),
        child: Text(
          "Зарегистрироваться как администратор",
          style: TextStylee.second_text,
        ),
      ),
    );
  }
}

class nameField extends StatelessWidget {
  const nameField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    return SizedBox(
      width: 350.w,
      height: 45.h,
      child: TextFormField(
        onChanged: (value) => model.firstName = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Имя*",
          hintStyle: TextStylee.second_text,
        ),
      ),
    );
  }
}

class surnameField extends StatelessWidget {
  const surnameField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    return SizedBox(
      width: 350.w,
      height: 45.h,
      child: TextFormField(
        onChanged: (value) => model.lastName = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Фамилия*",
          hintStyle: TextStylee.second_text,
        ),
      ),
    );
  }
}

class emailField extends StatelessWidget {
  const emailField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    return SizedBox(
      width: 350.w,
      height: 45.h,
      child: TextFormField(
        onChanged: (value) => model.email = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "E-mail*",
          hintStyle: TextStylee.second_text,
        ),
      ),
    );
  }
}

class dobField extends StatelessWidget {
  const dobField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    return SizedBox(
      width: 350.w,
      height: 45.h,
      child: TextFormField(
        onChanged: (value) => model.dob = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Дата рождения",
          hintStyle: TextStylee.second_text,
        ),
      ),
    );
  }
}

class aboutField extends StatelessWidget {
  const aboutField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    return SizedBox(
      width: 350.w,
      height: 45.h,
      child: TextFormField(
        onChanged: (value) => model.about = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Расскажите о вас",
          hintStyle: TextStylee.second_text,
        ),
      ),
    );
  }
}

class passwordField extends StatelessWidget {
  const passwordField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    return SizedBox(
      width: 350.w,
      height: 45.h,
      child: TextFormField(
        onChanged: (value) => model.password = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Пароль*",
          hintStyle: TextStylee.second_text,
        ),
      ),
    );
  }
}

class nicknameField extends StatelessWidget {
  const nicknameField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    return SizedBox(
      width: 350.w,
      height: 45.h,
      child: TextFormField(
        onChanged: (value) => model.nickName = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.TextColor, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Nickname",
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
    final model = context.watch<SignUpUser1Model>();
    return Center(
      child: SizedBox(
        width: 175.w,
        height: 46.h,
        child: ElevatedButton(
          onPressed: () => model.goToSignUpUser2(
            context,
            model.firstName,
            model.nickName,
            model.lastName,
            model.email,
            model.about,
            model.dob,
            model.sex,
            model.password,
          ),
          style: Buttonstyle.baseMain_button_style,
          child: Text(
            "Продолжить",
            style: TextStylee.main_text,
          ),
        ),
      ),
    );
  }
}

class sexField extends StatelessWidget {
  const sexField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    List<String> sexList = ["Мужской", "Женский"];
    final dropValue = ValueNotifier('');
    return SizedBox(
      width: 335.w,
      height: 50.h,
      child: Material(
        child: ValueListenableBuilder(
            valueListenable: dropValue,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                ),
                isExpanded: true,
                hint: Text(
                  'Пол',
                  style: TextStylee.second_text,
                ),
                icon: const Icon(Icons.keyboard_arrow_down_sharp),
                value: (value.isEmpty) ? null : value,
                onChanged: (choice) {
                  dropValue.value = choice.toString();
                  choice == 'Мужской'
                      ? model.sex = "male"
                      : model.sex = "female";
                },
                items: sexList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }
}
