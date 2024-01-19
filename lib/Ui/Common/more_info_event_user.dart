import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Domain/Models/commonModel/moreInfoUserBloc.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class moreInfoEventUser extends StatelessWidget {
  const moreInfoEventUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MoreInfoScreenBloc(),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 25.h),
              child: const Align(
                  alignment: Alignment.topLeft, child: backButton()),
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
                            image:
                                AssetImage("assets/image/NoAvatarBanner.png"),
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
                        image: AssetImage("assets/image/NoAvatarBanner.png"),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const shareButton(),
                  joinButton(
                    id: Event.id,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class shareButton extends StatelessWidget {
  const shareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 46.w,
        height: 46.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.MainColor,
        ),
        child: Center(
            child: SvgPicture.asset(
          "assets/image/share.svg",
          width: 17.2,
          height: 21.h,
        )),
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

class joinButton extends StatelessWidget {
  int id;
  joinButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MoreInfoScreenBloc>();
    return StreamBuilder<MoreInfoScreenState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          return SizedBox(
            width: 252.w,
            height: 46.h,
            child: ElevatedButton(
              onPressed: () => snapshot.requireData.isSubscribe
                  ? bloc.disPatch(UnSubscribeEvent(id: id))
                  : bloc.disPatch(SubscribeEvent(id: id)),
              style: Buttonstyle.main_button_style,
              child: Text(
                snapshot.requireData.isSubscribe
                    ? "Отписаться"
                    : "Присоединиться",
                style: TextStylee.myDateWhite_text,
              ),
            ),
          );
        });
  }
}
