import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Models/adminModel/main_screen_admin_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreenAdmin extends StatelessWidget {
  const MainScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
            create: (BuildContext context) => mainScreenAdminModel(),
            child: const MainScreenWidget()),
      ),
    );
  }
}

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.h,
          ),
          const searchField(),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  "Что нового",
                  style: TextStylee.homepage_text,
                ),
                const Spacer(),
                Text(
                  "Посмотреть все",
                  style: TextStylee.subSubTitletext,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          banner(),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  "Группы в вашем городе",
                  style: TextStylee.homepage_text,
                ),
                const Spacer(),
                Text(
                  "Посмотреть все",
                  style: TextStylee.subSubTitletext,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
          GroupBanner(),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}

class searchField extends StatelessWidget {
  const searchField({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenAdminModel>();
    return Center(
      child: SizedBox(
        width: 305.w,
        height: 40.h,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 12.h),
          prefix: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: SvgPicture.asset(
              "assets/image/search.svg",
              width: 14.w,
              height: 14.h,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Найти событие",
          placeholderStyle: TextStylee.second_text,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenAdminModel>();
    return SizedBox(
      height: 169.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: model.listEvent.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    model.goToInfoEvent(context, model.listEvent[index]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: BannerItem(
                    index: index,
                  ),
                ),
              )),
    );
  }
}

class BannerItem extends StatelessWidget {
  int index;
  BannerItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenAdminModel>();
    String title = utf8.decode(model.listEvent[index].title.runes.toList());
    String time =
        utf8.decode(model.listEvent[index].datetime_event.runes.toList());
    String addres = utf8.decode(model.listEvent[index].address.runes.toList());
    return Container(
      width: 167.w,
      height: 169.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 3, // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 9.w, right: 9.w, top: 10.h),
              child: Container(
                width: 150.w,
                height: 84.h,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/cf8d/3fa4/f6d794fff88e926131fb33ec72ab3380?Expires=1701648000&Signature=PWO~~Zzi7k-V5fXdPHbR7tAC0nCfro53TChNQJeXU8wu4zkC6ncdlQdjLZ326xt6Vfc-DNa7SZwOJ2-HJnIm8MVU1ge7gA-xZJ-wLH~vVg4ttWUtbZW6vUzAyPnB00L~yIlR8v6x6zdm~CnaT-IcsP8nu7Vi-rUfsJoCgO2thd6TN~KluAnS1XdYV6BWecJTqKro4LgTb0FmsAfvXt0ph6jFMNk91wBIiFdN1jnJffC5Tc9eoQPa~gqNqixDn4Jrdtep1GY1ybYIrmfdFyF3JDZ1BUfSaClzmPm0dmG9LB5~2xz6NpyM6Un04DS1clXuAv~cVf6-VKzKm-fLaMNMSg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.h, right: 7.w),
                    child: SvgPicture.asset(
                      "assets/image/likeIcon.svg",
                      width: 25.w,
                      height: 25.h,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w),
              child: Text(
                title,
                style: TextStylee.bannerDate_text,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w),
              child: Column(
                children: [
                  Row(children: [
                    SvgPicture.asset(
                      "assets/image/calendar.svg",
                      width: 12.w,
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      time,
                      style: TextStylee.Subsecond_text,
                    )
                  ]),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(children: [
                    SvgPicture.asset(
                      "assets/image/location.svg",
                      width: 12.w,
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      addres,
                      style: TextStylee.Subsecond_text,
                    )
                  ]),
                ],
              ),
            )
          ]),
    );
  }
}

class GroupBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              child: const GroupBannerItem(),
            ));
  }
}

class GroupBannerItem extends StatelessWidget {
  const GroupBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenAdminModel>();
    return Container(
      width: 325.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 3, // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 17.w, top: 13.h, bottom: 13.h),
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/1ef3/7e2f/daab14210224e0e2d86ed0c053441833?Expires=1701648000&Signature=HX9SID0F6Fpy~TL1~sMIsCH2jXeALW3dNtNCG947TwTQfFC1rPmZxg5p5JD5gDBkRaBecUo4yXE5Lx~308BVss0XW8EiZHsf7-verUaKCCS6qKG0ZtjASsQVJk7w12k~r-tsxqTJhMGpgWbtPER9Bu0b4~5fmRwU-PtJSZy1J74GIz2umaDd-YPuVX7AEGK0q9UJJsTPCdZW-dFdSQKc15HyHobJxPY3jfhj3zecS4G1UqiuVeSDU19~-gmRPGaQcIXNe5LHreOS46INc~2hkC5VSu5d2J1d3Z2YnTa2d3YqvnLv~Ywj3Dy4BJSpF~JlfpaMEu8BfmWhBvohapPkPw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Любительские фотосъемки",
                  style: TextStylee.main_text,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "13 участников",
                  style: TextStylee.second_text,
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => model.setDone(),
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: model.isDone
                  ? SvgPicture.asset(
                      "assets/image/activeCourse.svg",
                      width: 24.w,
                      height: 24.h,
                    )
                  : SvgPicture.asset(
                      "assets/image/inactiveCourse.svg",
                      width: 24.w,
                      height: 24.h,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
