import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/permanentEl/main_app_bar.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/styles/button_style.dart';
import '../../style/styles/text_style.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(1.w, 60.h), child: const MainAppBar()),
        body: const subSearch(),
      ),
    );
  }
}

class subSearch extends StatelessWidget {
  const subSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          width: 350.w,
          height: 45.h,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.TextColor, width: 1),
                  borderRadius: BorderRadius.circular(10.0)),
              hintText: "Найти мероприятие...",
              hintStyle: TextStylee.second_text,
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 115.w,
              height: 30.h,
              child: ElevatedButton(
                onPressed: () {},
                style: Buttonstyle.main_button_style,
                child: Text(
                  "Сегодня",
                  style: TextStylee.myDateWhite_text,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: 115.w,
              height: 30.h,
              child: ElevatedButton(
                onPressed: () {},
                style: Buttonstyle.main_button_style,
                child: Text(
                  "Завтра",
                  style: TextStylee.myDateWhite_text,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: 115.w,
              height: 30.h,
              child: ElevatedButton(
                onPressed: () {},
                style: Buttonstyle.main_button_style,
                child: Text(
                  "Другая дата",
                  style: TextStylee.myDateWhite_text,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              "Россия,",
              style: TextStylee.homepage_text,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "Оренбург",
              style: TextStylee.homepage_text,
            ),
            const Spacer(),
            SizedBox(
              width: 150.w,
              height: 30.h,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  size: 20.w,
                  color: colors.TextColor,
                ),
                label: Text(
                  "Изменить",
                  style: TextStylee.Localsecond_text,
                ),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 350.w,
          height: 175.h,
          decoration: BoxDecoration(
              color: colors.TextColor, borderRadius: BorderRadius.circular(15)),
          child: const Center(child: Text("Map")),
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Row(
            children: [
              Text(
                "Проходят сейчас",
                style: TextStylee.homepage_text,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(height: 50.h, child: GroupHobbyBanner()),
      ],
    );
  }
}

class GroupHobbyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const GroupHobbyBanneritem(),
            ));
  }
}

class GroupHobbyBanneritem extends StatelessWidget {
  const GroupHobbyBanneritem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 160.w,
        height: 35.h,
        child: ElevatedButton(
          onPressed: () {},
          style: Buttonstyle.edu_button_style,
          child: Text(
            "Учеба",
            style: TextStylee.white_text,
          ),
        ),
      ),
    ]);
  }
}
