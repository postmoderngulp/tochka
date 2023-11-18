import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../style/styles/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: subProfileScreen(),
      ),
    );
  }
}

class subProfileScreen extends StatelessWidget {
  const subProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 25.h,
          ),
          Center(
            child: Text(
              "Name Surname",
              style: TextStylee.homepage_text,
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/image/aboutMe.svg",
                width: 20.w,
                height: 20.h,
              ),
              label: Text(
                "Обо мне",
                style: TextStylee.main_text,
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "0",
                    style: TextStylee.main_text,
                  ),
                  Text(
                    "Подписки",
                    style: TextStylee.second_text,
                  )
                ],
              ),
              SizedBox(
                width: 50.w,
              ),
              Column(
                children: [
                  Text(
                    "0",
                    style: TextStylee.main_text,
                  ),
                  Text(
                    "Подписчики",
                    style: TextStylee.second_text,
                  )
                ],
              ),
              SizedBox(
                width: 50.w,
              ),
              Column(
                children: [
                  Text(
                    "5★",
                    style: TextStylee.main_text,
                  ),
                  Text(
                    "Мой рейтинг",
                    style: TextStylee.second_text,
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Мои увлечения",
                  style: TextStylee.homepage_text,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/image/add.svg",
                    width: 14.w,
                    height: 14.h,
                  ),
                  label: Text(
                    "Добавить",
                    style: TextStylee.second_text,
                  ),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Мои группы",
              style: TextStylee.homepage_text,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
