import 'dart:convert';
import 'package:Tochka_Sbora/Domain/Models/commonModel/main_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Provider(
            create: (BuildContext context) => MainScreenBloc(),
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
      physics: const BouncingScrollPhysics(),
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
    final bloc = context.read<MainScreenBloc>();
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
    final bloc = context.read<MainScreenBloc>();
    return StreamBuilder<MainScreenState>(
      builder: (context, snapshot) => SizedBox(
        height: 169.h,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.requireData.listEvent.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => bloc.disPatch(GoToMoreInfoEvents(
                      Event: snapshot.requireData.listEvent[index],
                      context: context)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: BannerItem(index: index),
                  ),
                )),
      ),
      stream: bloc.stream,
      initialData: bloc.state,
    );
  }
}

class BannerItem extends StatelessWidget {
  int index;
  BannerItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainScreenBloc>();
    return StreamBuilder<MainScreenState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
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
                              image:
                                  AssetImage("assets/image/NoAvatarBanner.png"),
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
                      utf8.decode(snapshot
                          .requireData.listEvent[index].title.runes
                          .toList()),
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
                            utf8.decode(snapshot.requireData.listEvent[index]
                                .datetime_event.runes
                                .toList()),
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
                            utf8.decode(snapshot
                                .requireData.listEvent[index].address.runes
                                .toList()),
                            style: TextStylee.Subsecond_text,
                          )
                        ]),
                      ],
                    ),
                  )
                ]),
          );
        });
  }
}

class GroupBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
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
    final bloc = context.read<MainScreenBloc>();
    return StreamBuilder<MainScreenState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
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
                            image:
                                AssetImage("assets/image/NoAvatarBanner.png"),
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
                  onTap: () => {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: snapshot.requireData.isDone
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
        });
  }
}
