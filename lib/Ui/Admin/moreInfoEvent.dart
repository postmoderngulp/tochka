import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Domain/Models/adminModel/more_info_event_model.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class moreInfoEventAdmin extends StatelessWidget {
  const moreInfoEventAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => moreInfoEventAdminModel(),
      child: const subMoreinfoEvent(),
    );
  }
}

class subMoreinfoEvent extends StatelessWidget {
  const subMoreinfoEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final Event = ModalRoute.of(context)!.settings.arguments as event;
    String title = utf8.decode(Event.title.runes.toList());
    String time = utf8.decode(Event.title.runes.toList());
    String address = utf8.decode(Event.title.runes.toList());
    String description = utf8.decode(Event.description.runes.toList());
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 25.h),
            child:
                const Align(alignment: Alignment.topLeft, child: backButton()),
          ),
          SizedBox(
            height: 33.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 67.w,
                  height: 67.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://s3-alpha-sig.figma.com/img/cf8d/3fa4/f6d794fff88e926131fb33ec72ab3380?Expires=1701648000&Signature=PWO~~Zzi7k-V5fXdPHbR7tAC0nCfro53TChNQJeXU8wu4zkC6ncdlQdjLZ326xt6Vfc-DNa7SZwOJ2-HJnIm8MVU1ge7gA-xZJ-wLH~vVg4ttWUtbZW6vUzAyPnB00L~yIlR8v6x6zdm~CnaT-IcsP8nu7Vi-rUfsJoCgO2thd6TN~KluAnS1XdYV6BWecJTqKro4LgTb0FmsAfvXt0ph6jFMNk91wBIiFdN1jnJffC5Tc9eoQPa~gqNqixDn4Jrdtep1GY1ybYIrmfdFyF3JDZ1BUfSaClzmPm0dmG9LB5~2xz6NpyM6Un04DS1clXuAv~cVf6-VKzKm-fLaMNMSg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 16.w,
                ),
                SizedBox(
                  width: 219.w,
                  child: Text(
                    title,
                    style: TextStylee.title_text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
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
                    address,
                    style: TextStylee.Subsecond_text,
                  )
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          Center(
            child: Container(
              width: 317.w,
              height: 140.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/cf8d/3fa4/f6d794fff88e926131fb33ec72ab3380?Expires=1701648000&Signature=PWO~~Zzi7k-V5fXdPHbR7tAC0nCfro53TChNQJeXU8wu4zkC6ncdlQdjLZ326xt6Vfc-DNa7SZwOJ2-HJnIm8MVU1ge7gA-xZJ-wLH~vVg4ttWUtbZW6vUzAyPnB00L~yIlR8v6x6zdm~CnaT-IcsP8nu7Vi-rUfsJoCgO2thd6TN~KluAnS1XdYV6BWecJTqKro4LgTb0FmsAfvXt0ph6jFMNk91wBIiFdN1jnJffC5Tc9eoQPa~gqNqixDn4Jrdtep1GY1ybYIrmfdFyF3JDZ1BUfSaClzmPm0dmG9LB5~2xz6NpyM6Un04DS1clXuAv~cVf6-VKzKm-fLaMNMSg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.w, top: 11.h),
                      child: SvgPicture.asset(
                        "assets/image/likeIcon.svg",
                        width: 27.w,
                        height: 27.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.w, bottom: 17.h),
                      child: SizedBox(
                        width: 70.w,
                        height: 24.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.yeloww_button_style,
                          child: Text(
                            "Я иду",
                            style: TextStylee.Subsecond_text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 29.w),
            child: Text(
              "Описание",
              style: TextStylee.title_text,
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Text(
              description,
              style: TextStylee.second_text,
            ),
          ),
          SizedBox(
            height: 101.h,
          ),
          joinButton(
            id: Event.id,
          )
        ],
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
          "assets/image/back.svg",
          width: 10.w,
          height: 17.h,
        ));
  }
}

class joinButton extends StatelessWidget {
  int id;
  joinButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<moreInfoEventAdminModel>();
    return Padding(
      padding: EdgeInsets.only(bottom: 38.h),
      child: Center(
        child: SizedBox(
          width: 252.w,
          height: 46.h,
          child: ElevatedButton(
            onPressed: () => model.isSubscribe == "true"
                ? model.unSubScribe(id)
                : model.subScribe(id),
            style: Buttonstyle.main_button_style,
            child: Text(
              model.isSubscribe == "true" ? "Отписаться" : "Присоединиться",
              style: TextStylee.myDateWhite_text,
            ),
          ),
        ),
      ),
    );
  }
}
