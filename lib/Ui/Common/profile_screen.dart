import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Models/commonModel/profile_bloc.dart';
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
        body: Provider(
            create: (BuildContext context) => profileBloc(),
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
    final bloc = context.read<profileBloc>();
    return StreamBuilder<ProfileState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          String name = utf8.decode(snapshot.data!.name.runes.toList());
          String surname = utf8.decode(snapshot.data!.surname.runes.toList());
          return SingleChildScrollView(
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
                    width: 117.w,
                    height: 117.h,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(
                            image: NetworkImage(snapshot.requireData.path),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Center(
                  child: Text(
                    "$name $surname",
                    style: TextStylee.homepage_text,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    snapshot.requireData.email,
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
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
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
          );
        });
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<profileBloc>();
    return StreamBuilder<ProfileState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          String aboutMe = utf8.decode(snapshot.data!.aboutMe.runes.toList());
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
                    child: Text(aboutMe.isEmpty
                        ? 'Я нахожу вдохновение в природе, взаимодействии с людьми и исследовании различных культур. Мое творчество – это способ передать свои мысли и чувства через изобразительное искусство.'
                        : aboutMe),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Text('Интересы'),
                  SizedBox(
                    height: 14.h,
                  ),
                  Wrap(
                    children: List.generate(
                        snapshot.data!.listInteresting.length,
                        (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: 10.w, bottom: 6.h),
                              child: interestingItem(
                                index: index,
                              ),
                            )),
                  ),
                ],
              ),
            ),
          );
        });
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
    final bloc = context.read<profileBloc>();
    return StreamBuilder<ProfileState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
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
                snapshot.data!.listInteresting[index].picture,
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  snapshot.data!.listInteresting[index].label,
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
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
    final bloc = context.read<profileBloc>();
    return StreamBuilder<ProfileState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
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
                  onTap: () => bloc.disPatch(IsDoneEvents()),
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

class GroupEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<profileBloc>();
    return StreamBuilder<ProfileState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.requireData.listMyEvent.length,
              itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                    child: GroupEventItem(index: index),
                  ));
        });
  }
}

class GroupEventItem extends StatelessWidget {
  int index;
  GroupEventItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<profileBloc>();
    return StreamBuilder<ProfileState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          return Container(
            width: 325.w,
            height: 80.h,
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
                            image:
                                AssetImage("assets/image/NoAvatarBanner.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        utf8.decode(snapshot
                            .requireData.listMyEvent[index].title.runes
                            .toList()),
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  utf8.decode(snapshot.requireData
                                      .listMyEvent[index].datetime_event.runes
                                      .toList()),
                                  style: TextStylee.soraEvent,
                                )
                              ]),
                          SizedBox(
                            height: 4.h,
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
                              utf8.decode(snapshot
                                  .requireData.listMyEvent[index].address.runes
                                  .toList()),
                              style: TextStylee.soraEvent,
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
        });
  }
}
