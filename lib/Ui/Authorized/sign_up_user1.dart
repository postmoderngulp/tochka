import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
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
        physics: const BouncingScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
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
                "Привет!",
                style: TextStylee.main_title_text,
              ),
              Text(
                "Расскажи о себе:",
                style: TextStylee.TitleSora,
              ),
              SizedBox(
                height: 41.h,
              ),
              Column(
                children: [
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
                  const timePicker(),
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
                height: 69.h,
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.border, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Имя*",
          hintStyle: TextStylee.fieldStyle,
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.border, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Фамилия*",
          hintStyle: TextStylee.fieldStyle,
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.border, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "E-mail*",
          hintStyle: TextStylee.fieldStyle,
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.border, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Расскажите о вас",
          hintStyle: TextStylee.fieldStyle,
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
        obscureText: true,
        onChanged: (value) => model.password = value,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.border, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Пароль*",
          hintStyle: TextStylee.fieldStyle,
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.border, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.border, width: 1),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: "Nickname",
          hintStyle: TextStylee.fieldStyle,
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
        width: 300.w,
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
          style: Buttonstyle.main_button_style,
          child: Text(
            "Продолжить",
            style: TextStylee.myDateWhite_text,
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
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                ),
                isExpanded: true,
                hint: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'Пол',
                    style: TextStylee.fieldStyle,
                  ),
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

class timePicker extends StatefulWidget {
  const timePicker({super.key});

  @override
  State<timePicker> createState() => _timePickerState();
}

class _timePickerState extends State<timePicker> {
  DateTime _selectDate = DateTime.now();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        locale: const Locale('ru'),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: colors.AccentColor, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black,
              ),
              primaryColor: colors.MainColor,
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: _selectDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2070));
    if (picked != _selectDate) {
      setState(() {
        _selectDate = picked!;
      });
    }
    print(picked!.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser1Model>();
    String month = '';
    switch (_selectDate.month) {
      case 1:
        month = 'Января';
        break;
      case 2:
        month = 'Февраля';
        break;
      case 3:
        month = 'Марта';
        break;
      case 4:
        month = 'Апреля';
        break;
      case 5:
        month = 'Мая';
        break;
      case 6:
        month = 'Июня';
        break;
      case 7:
        month = 'Июля';
        break;
      case 8:
        month = 'Августа';
        break;
      case 9:
        month = 'Сентября';
        break;
      case 10:
        month = 'Октября';
        break;
      case 11:
        month = 'Ноября';
        break;
      case 12:
        month = 'Декабря';
    }
    return SizedBox(
        width: 350.w,
        height: 45.h,
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor:
                  const MaterialStatePropertyAll(Colors.transparent),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 1, color: colors.border)))),
          onPressed: () {
            _pickDate(context);
            DateFormat formatter = DateFormat('yyyy-MM-dd');
            String formattedDate = formatter.format(_selectDate.toLocal());
            model.dob = formattedDate.toString();
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Дата рождения:${_selectDate.day.toString()} $month",
              style: TextStylee.fieldStyle,
            ),
          ),
        ));
  }
}
