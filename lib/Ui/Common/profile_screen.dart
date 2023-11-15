import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/permanentEl/profile_app_bar.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/styles/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(1.w, 75.h), child: const ProfileAppBar()),
        body: const subProfileScreen(),
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
          const HobbyList(),
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
          const nameGroup(),
        ],
      ),
    );
  }
}

class nameGroup extends StatelessWidget {
  const nameGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return const itemNameGroup();
        });
  }
}

class itemNameGroup extends StatelessWidget {
  const itemNameGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage("assets/image/NoAvatarBanner.png"),
      ),
      title: Text(
        "Name group",
        style: TextStylee.bannerGroup_text,
      ),
      subtitle: Text(
        "15 участников",
        style: TextStylee.bannerGroup_text,
      ),
      trailing: Icon(
        Icons.arrow_back_ios,
        color: colors.MainColor,
        size: 20.w,
      ),
    );
  }
}

class HobbyList extends StatelessWidget {
  const HobbyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: SizedBox(height: 35.h, child: GroupHobbyBanner()),
            ));
  }
}

class GroupHobbyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const GroupHobbyBanneritem(),
            ));
  }
}

class GroupHobbyBanneritem extends StatelessWidget {
  const GroupHobbyBanneritem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 160.w,
        height: 35.h,
        child: ElevatedButton(
          onPressed: () {},
          style: Buttonstyle.edu_button_style,
          child: Text(
            "Учеба",
            style: TextStylee.white_text,
          ),
        ),
      ),
    ]);
  }
}
