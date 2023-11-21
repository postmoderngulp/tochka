import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Models/adminModel/profile_admin_model.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../style/styles/text_style.dart';

class ProfileAdminScreen extends StatelessWidget {
  const ProfileAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileAdminModel(),
      child: const subProfileAdminScreen(),
    );
  }
}

class subProfileAdminScreen extends StatefulWidget {
  const subProfileAdminScreen({super.key});

  @override
  State<subProfileAdminScreen> createState() => _subProfileScreenState();
}

class _subProfileScreenState extends State<subProfileAdminScreen>
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
    final model = context.watch<ProfileAdminModel>();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const createEventButton(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
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
        ),
      ),
    );
  }
}

class createEventButton extends StatelessWidget {
  const createEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileAdminModel>();
    return FloatingActionButton(
      onPressed: () => model.goToCreateEvent(context),
      backgroundColor: colors.MainColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
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
    final model = context.watch<ProfileAdminModel>();
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

class GroupEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileAdminModel>();
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
    final model = context.watch<ProfileAdminModel>();
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
                      image: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/cf8d/3fa4/f6d794fff88e926131fb33ec72ab3380?Expires=1701648000&Signature=PWO~~Zzi7k-V5fXdPHbR7tAC0nCfro53TChNQJeXU8wu4zkC6ncdlQdjLZ326xt6Vfc-DNa7SZwOJ2-HJnIm8MVU1ge7gA-xZJ-wLH~vVg4ttWUtbZW6vUzAyPnB00L~yIlR8v6x6zdm~CnaT-IcsP8nu7Vi-rUfsJoCgO2thd6TN~KluAnS1XdYV6BWecJTqKro4LgTb0FmsAfvXt0ph6jFMNk91wBIiFdN1jnJffC5Tc9eoQPa~gqNqixDn4Jrdtep1GY1ybYIrmfdFyF3JDZ1BUfSaClzmPm0dmG9LB5~2xz6NpyM6Un04DS1clXuAv~cVf6-VKzKm-fLaMNMSg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
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
