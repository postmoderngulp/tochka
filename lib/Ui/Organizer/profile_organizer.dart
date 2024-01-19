// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:Tochka_Sbora/Domain/Models/organizerModel/profile_organizer_model.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';

import '../../style/styles/text_style.dart';

class ProfileOrganizerScreen extends StatelessWidget {
  const ProfileOrganizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileOrganizerModel(),
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
    final model = context.watch<ProfileOrganizerModel>();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const createEventButton(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                  width: 116.9.w,
                  height: 116.9.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(model.path), fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 13.19.h,
              ),
              Center(
                child: Text(
                  "${model.Name} ${model.Surname}",
                  style: TextStylee.homepage_text,
                ),
              ),
              SizedBox(
                height: 6.43.h,
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
                    SizedBox(
                      width: 105.w,
                    ),
                    const Column(
                      children: [
                        Text('350'),
                        Text('Подписок'),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/image/divider.svg'),
                    const Spacer(),
                    const Column(
                      children: [
                        Text('346'),
                        Text('Подписчиков'),
                      ],
                    ),
                    SizedBox(
                      width: 92.w,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              TabBar(
                  splashFactory: NoSplash.splashFactory,
                  labelColor: Colors.white,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelStyle: TextStylee.second_text,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                      color: colors.MainColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  tabs: const [
                    Tab(
                      text: "Обо мне",
                    ),
                    Tab(
                      text: "Группы",
                    ),
                    Tab(
                      text: "Мероприятия",
                    ),
                  ]),
              SizedBox(
                height: 500.h,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    const AboutMe(),
                    GroupBanner(),
                    GroupEvent(),
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

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileOrganizerModel>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 39.h,
            ),
            Text('Обо мне'),
            SizedBox(
              height: 17.h,
            ),
            SizedBox(
                width: 323.w,
                child: Text(
                    'Я нахожу вдохновение в природе, взаимодействии с людьми и исследовании различных культур. Мое творчество – это способ передать свои мысли и чувства через изобразительное искусство.')),
            SizedBox(
              height: 36.h,
            ),
            Text('Интересы'),
            SizedBox(
              height: 14.h,
            ),
            Wrap(
              children: List.generate(
                  model.listInteresting.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(right: 10.w, bottom: 6.h),
                        child: interestingItem(
                          index: index,
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

class interestingItem extends StatelessWidget {
  int index;
  interestingItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileOrganizerModel>();
    return Container(
      height: 26.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 1),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
          ),
          model.listInteresting[index].picture,
          SizedBox(
            width: 5.w,
          ),
          Text(
            model.listInteresting[index].label,
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}

class createEventButton extends StatelessWidget {
  const createEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileOrganizerModel>();
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
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
    final model = context.watch<ProfileOrganizerModel>();
    return Container(
      width: 325.w,
      height: 76.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 1),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 17.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 13.h),
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
                  style: TextStylee.titleGroup,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "13 участников",
                  style: TextStylee.subTitleGroup,
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
    final model = context.watch<ProfileOrganizerModel>();
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
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
    final model = context.watch<ProfileOrganizerModel>();
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
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 1),
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
                  style: TextStylee.titleGroup,
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
                            style: TextStylee.subTitleGroup,
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
                        style: TextStylee.subTitleGroup,
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
