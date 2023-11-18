import 'package:Tochka_Sbora/Domain/Models/main_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
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
        body: ChangeNotifierProvider(
            create: (BuildContext context) => mainScreenModel(),
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
          SizedBox(height: 155.h, child: banner()),
          SizedBox(
            height: 10.h,
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
            height: 15.h,
          ),
          SizedBox(height: 165.h, child: GroupBanner()),
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
    final model = context.watch<mainScreenModel>();
    return Center(
      child: SizedBox(
        width: 305.w,
        height: 40.h,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 12.h),
          prefix: SvgPicture.asset(
            "assets/image/search.svg",
            width: 14.w,
            height: 14.h,
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
    final model = context.watch<mainScreenModel>();
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
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
                    GestureDetector(
                      onTap: () => model.setLike(),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: model.isLike
                            ? SvgPicture.asset(
                                "assets/image/like.svg",
                                width: 19.w,
                                height: 17.h,
                              )
                            : SvgPicture.asset(
                                "assets/image/notLike.svg",
                                width: 19.w,
                                height: 17.h,
                              ),
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
      child: Row(
        children: [
          Column(children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 10.w),
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
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, right: 10.w),
                child: SvgPicture.asset(
                  "assets/image/close.svg",
                  width: 9.w,
                  height: 9.h,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
