import 'package:Tochka_Sbora/Domain/Models/organizerModel/members_model.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MembersModel(),
      child: const subMembers(),
    );
  }
}

class subMembers extends StatelessWidget {
  const subMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const backButton(),
              Center(
                  child: Text(
                "Участники",
                style: TextStylee.subAlert_title_text,
              )),
              SizedBox(
                height: 40.h,
              ),
              const listMembers()
            ],
          ),
        ),
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
          "assets/image/arrow-left.svg",
          width: 22.w,
          height: 22.h,
        ));
  }
}

class listMembers extends StatelessWidget {
  const listMembers({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MembersModel>();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 14,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: const membersItem(),
      ),
    );
  }
}

class membersItem extends StatelessWidget {
  const membersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return 2 == 1
        ? SizedBox(
            width: 320.w,
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/image/avatarMember.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Катя Милашкина",
                          style: TextStylee.subAlert_title_text,
                        ),
                        SizedBox(
                          width: 75.w,
                        ),
                        Text(
                          "10 мин",
                          style: TextStylee.second_text,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    SizedBox(
                      width: 255.w,
                      child: Text(
                        "Катя Милашкина хочет принять участие в мероприятии",
                        style: TextStylee.second_text,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        const acceptButton(),
                        SizedBox(
                          width: 11.w,
                        ),
                        const rejectButton()
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        : SizedBox(
            width: 320.w,
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/image/avatarMember.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Катя Милашкина",
                      style: TextStylee.subAlert_title_text,
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      "example@mail.com",
                      style: TextStylee.second_text,
                    ),
                  ],
                ),
                SizedBox(
                  width: 85.w,
                ),
                const unAcceptButton()
              ],
            ),
          );
  }
}

class unAcceptButton extends StatelessWidget {
  const unAcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: colors.yeloww, width: 1)),
            width: 30.w,
            height: 30.h,
            child: Center(
                child: Icon(
              Icons.close,
              color: colors.yeloww,
              size: 12.w,
            ))),
      ),
    );
  }
}

class acceptButton extends StatelessWidget {
  const acceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 105.w,
        height: 28.h,
        child: ElevatedButton(
            style: Buttonstyle.yeloww_button_style,
            onPressed: () {},
            child: Text(
              "Принять",
              style: TextStylee.second_text,
            )));
  }
}

class rejectButton extends StatelessWidget {
  const rejectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 105.w,
        height: 28.h,
        child: ElevatedButton(
            style: Buttonstyle.unYeloww_button_style,
            onPressed: () {},
            child: Text(
              "Отклонить",
              style: TextStylee.second_text,
            )));
  }
}
