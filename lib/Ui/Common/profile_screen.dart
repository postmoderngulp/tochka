import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Models/commonModel/profile_model.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../style/styles/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
            create: (BuildContext context) => ProfileUserModel(),
            child: const subProfileScreen()),
      ),
    );
  }
}

class subProfileScreen extends StatefulWidget {
  const subProfileScreen({super.key});

  @override
  State<subProfileScreen> createState() => _subProfileScreenState();
}

class _subProfileScreenState extends State<subProfileScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileUserModel>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.h, right: 16.w),
            child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/image/setting.svg",
                  width: 19.w,
                  height: 19.h,
                )),
          ),
          Center(
            child: Container(
              width: 117.w,
              height: 117.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                      image: NetworkImage(model.path), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Center(
            child: Text(
              "${model.Name} ${model.Surname}",
              style: TextStylee.homepage_text,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              model.email,
              style: TextStylee.second_text,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: SvgPicture.asset(
                              "assets/image/star.svg",
                              width: 20.w,
                              height: 20.h,
                            ),
                          )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          TabBar(
              controller: _tabController,
              unselectedLabelStyle: TextStylee.second_text,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                  color: colors.MainColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              tabs: const [
                Tab(
                  text: "Группы",
                ),
                Tab(
                  text: "Мероприятия",
                ),
                Tab(
                  text: "Избранное",
                ),
              ]),
          SizedBox(
            height: 500.h,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                GroupBanner(),
                GroupEvent(),
                const Center(
                  child: Text("It's sunny here"),
                ),
              ],
            ),
          ),
        ],
      ),
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
    final model = context.watch<ProfileUserModel>();
    return Container(
      width: 325.w,
      height: 76.h,
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
                      image: AssetImage("assets/image/NoAvatarBanner.png"),
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

class GroupEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileUserModel>();
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: model.listMyEvent.length,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              child: GroupEventItem(index: index),
            ));
  }
}

class GroupEventItem extends StatelessWidget {
  int index;
  GroupEventItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileUserModel>();
    String title = utf8.decode(model.listMyEvent[index].title.runes.toList());
    String time =
        utf8.decode(model.listMyEvent[index].datetime_event.runes.toList());
    String address =
        utf8.decode(model.listMyEvent[index].address.runes.toList());
    return Container(
      width: 325.w,
      height: 85.h,
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
                      image: AssetImage("assets/image/NoAvatarBanner.png"),
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
                  title,
                  style: TextStylee.main_text,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/image/calendarOranje.svg",
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
                        "assets/image/locationOranje.svg",
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
                )
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => {},
              child: Padding(
                  padding: EdgeInsets.only(right: 7.w, top: 4.h),
                  child: SvgPicture.asset(
                    "assets/image/likeIcon.svg",
                    width: 24.w,
                    height: 24.h,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
