import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/permanentEl/main_app_bar.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Navigation/navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(1.w, 60.h), child: const MainAppBar()),
        body: const MainScreenWidget(),
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
            height: 10.h,
          ),
          const locationBox(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Что нового",
              style: TextStylee.homepage_text,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
           SizedBox(height: 155.h, child: banner()),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Группы в вашем городе",
              style: TextStylee.homepage_text,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(height: 165.h, child: GroupBanner()),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Ваши группы",
              style: TextStylee.homepage_text,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 15.h,
          ),
          const findGroupBox(),
        ],
      ),
    );
  }
}

class findGroupBox extends StatelessWidget {
  const findGroupBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90.h,
      decoration: BoxDecoration(border: Border.all(color: colors.TextColor)),
      child: Column(children: [
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text(
            "У вас пока нет групп",
            style: TextStylee.bannerGroup_text,
          ),
        ),
        SizedBox(
          width: 155.w,
          height: 35.h,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 20.w,
            ),
            label: Text(
              "Найти группу",
              style: TextStylee.white_text,
            ),
            style: Buttonstyle.main_button_style,
          ),
        ),
      ]),
    );
  }
}

class locationBox extends StatelessWidget {
  const locationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: colors.MainColor),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
              size: 25.w,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          TextButton(
            onPressed: () => Navigator.of(context)
                .pushNamed(NavigationRoutes.chooseLocation),
            child: Text(
              "Ваше местоположение",
              style: TextStylee.location_text,
            ),
          ),
          SizedBox(
            width: 50.w,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Оренбург",
              style: TextStylee.light_location_text,
            ),
          ),
        ],
      ),
    );
  }
}

class banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const BannerItem(),
            ));
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: colors.TextColor)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 185.w,
              height: 85.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only( topLeft: Radius.circular(10), topRight: Radius.circular(8)),
                  image:  DecorationImage(
                      image: AssetImage("assets/image/NoAvatarBanner.png"),
                      fit: BoxFit.cover)),
            ),
            Text(
              "MON 01 - MON 01",
              style: TextStylee.bannerDate_text,
            ),
            Text(
              "Name event",
              style: TextStylee.bannerName_text,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Icon(
                        Icons.heart_broken,
                        color: Colors.red,
                        size: 22.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h, left: 5.w),
                      child: SizedBox(
                        width: 70.w,
                        height: 25.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Buttonstyle.baseMain_button_style,
                          child: Text(
                            "Я иду",
                            style: TextStylee.Banner_text,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const GroupBannerItem(),
            ));
  }
}

class GroupBannerItem extends StatelessWidget {
  const GroupBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      decoration: BoxDecoration(
        border: Border.all(color: colors.TextColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30.w,
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/image/groupPhoto.png",
                width: 80.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, bottom: 10.h),
                child: Column(
                  children: [
                    Text(
                      "Name Group",
                      style: TextStylee.bannerName_text,
                    ),
                    Text(
                      "15 участников",
                      style: TextStylee.bannerDate_text,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 100.w),
          child: SizedBox(
            width: 134.w,
            height: 30.h,
            child: ElevatedButton(
              onPressed: () {},
              style: Buttonstyle.baseMain_button_style,
              child: Text(
                "Присоединиться",
                style: TextStylee.Banner_text,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
