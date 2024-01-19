import 'dart:convert';

import 'package:Tochka_Sbora/Domain/Models/organizerModel/filter_model.dart';
import 'package:Tochka_Sbora/Domain/Models/organizerModel/main_screen_organizer_model.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreenOrganizer extends StatelessWidget {
  const MainScreenOrganizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
            create: (BuildContext context) => mainScreenOrganizerModel(),
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
    final model = context.watch<mainScreenOrganizerModel>();
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
          suffix: GestureDetector(
            onTap: () => showModalBottomSheet<dynamic>(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ChangeNotifierProvider(
                  create: (context) => FilterModel(),
                  child: const FilterBanner(),
                );
              },
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                "assets/image/filter.svg",
                width: 22.w,
                height: 22.h,
              ),
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

class FilterBanner extends StatelessWidget {
  const FilterBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38), topRight: Radius.circular(38))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Center(child: SvgPicture.asset('assets/image/top_panel.svg')),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Фильтр",
              style: TextStylee.subAlert_title_text,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          const listInterest(),
          SizedBox(
            height: 27.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Время и дата",
              style: TextStylee.subAlert_title_text,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const listTimes(),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: const timePicker(),
          ),
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Местоположение",
              style: TextStylee.subAlert_title_text,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          const chooseLocation(),
          SizedBox(
            height: 180.h,
          ),
          const ActionGroupButton(),
          SizedBox(
            height: 21.h,
          ),
        ],
      ),
    );
  }
}

class ActionGroupButton extends StatelessWidget {
  const ActionGroupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 137.w,
            height: 55.h,
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(0),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 1, color: colors.MainColor)))),
              onPressed: () {},
              child: Center(
                child: Text(
                  "Очистить",
                  style: TextStylee.main_text,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 11.w,
          ),
          SizedBox(
            width: 179.w,
            height: 55.h,
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(colors.MainColor),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 1, color: colors.MainColor)))),
              onPressed: () {},
              child: Center(
                child: Text(
                  "Принять",
                  style: TextStylee.white_text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class chooseLocation extends StatelessWidget {
  const chooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 334.w,
          height: 60.h,
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 1, color: Colors.grey)))),
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/image/chooseLocation.svg",
                  width: 45.w,
                  height: 45.h,
                ),
                SizedBox(
                  width: 9.w,
                ),
                Text(
                  "Оренбург",
                  style: TextStylee.big_second_text,
                ),
              ],
            ),
          )),
    );
  }
}

class timePicker extends StatefulWidget {
  const timePicker({super.key});

  @override
  State<timePicker> createState() => _timePickerState();
}

class _timePickerState extends State<timePicker> {
  DateTime _selectDate = DateTime.now();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: colors.AccentColor, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black,
              ),
              primaryColor: colors.MainColor,
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: _selectDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != _selectDate) {
      setState(() {
        _selectDate = picked!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String month = '';
    switch (_selectDate.month) {
      case 1:
        month = 'Января';
        break;
      case 2:
        month = 'Февраля';
        break;
      case 3:
        month = 'Марта';
        break;
      case 4:
        month = 'Апреля';
        break;
      case 5:
        month = 'Мая';
        break;
      case 6:
        month = 'Июня';
        break;
      case 7:
        month = 'Июля';
        break;
      case 8:
        month = 'Августа';
        break;
      case 9:
        month = 'Сентября';
        break;
      case 10:
        month = 'Октября';
        break;
      case 11:
        month = 'Ноября';
        break;
      case 12:
        month = 'Декабря';
    }
    return SizedBox(
        width: 241.w,
        height: 42.h,
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor:
                  const MaterialStatePropertyAll(Colors.transparent),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(width: 1, color: Colors.grey)))),
          onPressed: () => _pickDate(context),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/image/timePicker.svg",
                width: 21.w,
                height: 21.h,
              ),
              SizedBox(
                width: 9.w,
              ),
              Text(
                "${_selectDate.day.toString()} $month",
                style: TextStylee.second_text,
              ),
            ],
          ),
        ));
  }
}

class listTimes extends StatelessWidget {
  const listTimes({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FilterModel>();
    return Wrap(
      children: List.generate(
          model.listTimes.length,
          (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                child: Item(index: index),
              )),
    );
  }
}

class Item extends StatelessWidget {
  int index;
  Item({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FilterModel>();
    return SizedBox(
      height: 41.h,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor: model.chooseVal != index
                  ? const MaterialStatePropertyAll(Colors.transparent)
                  : MaterialStatePropertyAll(colors.MainColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: model.chooseVal != index
                      ? const BorderSide(width: 1, color: Colors.grey)
                      : BorderSide.none))),
          onPressed: () => model.setVal(index),
          child: Text(
            model.listTimes[index],
            style: model.chooseVal != index
                ? TextStylee.second_text
                : TextStylee.location_text,
          )),
    );
  }
}

class listInterest extends StatelessWidget {
  const listInterest({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<FilterModel>();
    return SizedBox(
      height: 117.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) => Padding(
            padding: EdgeInsets.only(left: 16.w), child: const InterestsItem()),
      ),
    );
  }
}

class InterestsItem extends StatelessWidget {
  const InterestsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Container(
          width: 63.w,
          height: 63.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 3, // changes position of shadow
              ),
            ],
          ),
          child: Image.asset("assets/image/cook.png"),
        ),
        SizedBox(
          height: 11.h,
        ),
        Text(
          "Еда",
          style: TextStylee.titleRegularGroup,
        ),
      ],
    );
  }
}

class banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenOrganizerModel>();
    return SizedBox(
      height: 169.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: model.listEvent.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    model.goToInfoEvent(context, model.listEvent[index]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: BannerItem(
                    index: index,
                  ),
                ),
              )),
    );
  }
}

class BannerItem extends StatelessWidget {
  int index;

  BannerItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenOrganizerModel>();
    String title = utf8.decode(model.listEvent[index].title.runes.toList());
    String time =
        utf8.decode(model.listEvent[index].datetime_event.runes.toList());
    String addres = utf8.decode(model.listEvent[index].address.runes.toList());
    return Container(
      width: 167.w,
      height: 169.h,
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
                        image: NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/cf8d/3fa4/f6d794fff88e926131fb33ec72ab3380?Expires=1706486400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fB9vqt45kICF-lkwVNUmhXyj92tow9G3jX79rVrmO4-ysYXArixZIuF0o~T6p2fpHp5dPhGTdEtuEJI8NJlxMCSL~mTrkAuqJlX4j3erQtWVEW-IpRgsVbfq~YPOuVhvS3exNeU9LRFgfxpsdmQKafjYNfh47TQ7PqgwdmyWfGFEsxbXH9lZpLlU0rjkWPGJZuo0C7vkoWMwBIEeJjwtc7dUyOF-9XsIREK302Ri3oNIPe9BXo6gxJkB8amidsu5lWQ7bG-c4egOdErK1N-wgxPXRaYZ1DCTlySqVcHuIiLO1jcGrjCGVjKXV93ul~~5QBWMyIJgxmVG0dusDrccSw__"),
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
                title,
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
                      addres,
                      style: TextStylee.Subsecond_text,
                    )
                  ]),
                ],
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
    final model = context.watch<mainScreenOrganizerModel>();
    return Container(
      width: 325.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
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
