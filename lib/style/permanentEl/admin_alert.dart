import 'package:Tochka_Sbora/Navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/button_style.dart';
import '../styles/text_style.dart';

class AdminAlert extends StatefulWidget {
  @override
  State<AdminAlert> createState() => _AdminAlertState();
}

class _AdminAlertState extends State<AdminAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 250.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 1,
      title: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Text(
          "Отлично!",
          style: TextStylee.alert_title_text,
        ),
      )),
      content: Center(
        child: Column(
          children: [
            Text(
              "Регистрация завершена",
              style: TextStylee.subAlert_title_text,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Подтвердите адрес электронной почты",
              style: TextStylee.second_text,
            ),
            Text(
              "*****@gmail.com",
              style: TextStylee.second_text,
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: SizedBox(
                width: 150.w,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(NavigationRoutes.EntryScreen);
                  },
                  style: Buttonstyle.main_button_style,
                  child: Text(
                    "Хорошо",
                    style: TextStylee.white_text,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
