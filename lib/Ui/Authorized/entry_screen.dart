import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import '../../Domain/Models/entry_model.dart';
import '../../style/styles/button_style.dart';
import '../../style/styles/text_style.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Provider(
          create: (context) => EntryModel(), child: const subEntryScreen()),
    ));
  }
}

class subEntryScreen extends StatelessWidget {
  const subEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<EntryModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 230.h),
          Text(
            "Вход",
            style: TextStylee.title_text,
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: SizedBox(
              width: 300.w,
              height: 45.h,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.TextColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: "E-mail",
                  hintStyle: TextStylee.second_text,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: SizedBox(
              width: 300.w,
              height: 45.h,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.TextColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: "Пароль",
                  hintStyle: TextStylee.second_text,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Center(
            child: SizedBox(
              width: 120.w,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () => model.goToMainScreen(context),
                style: Buttonstyle.main_button_style,
                child: Text(
                  "Войти",
                  style: TextStylee.myDateWhite_text,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Проблемы со входом?",
                    style: TextStylee.second_text,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
