import 'package:Tochka_Sbora/Domain/Models/organizerModel/create_event_model.dart';
import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:provider/provider.dart';

class createEvent extends StatelessWidget {
  const createEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => createEventModel(),
      child: const subCreateEvent(),
    );
  }
}

class subCreateEvent extends StatelessWidget {
  const subCreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 25.h),
              child: const Align(
                  alignment: Alignment.topLeft, child: backButton()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 41.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 46.h,
                  ),
                  SizedBox(
                    width: 280.w,
                    child: Text(
                      "Создание мероприятия",
                      style: TextStylee.title_text,
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Text(
                    "Добавьте информацию о предстоящем мероприятии",
                    style: TextStylee.subTitleSora,
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  const nameEventField(),
                  SizedBox(
                    height: 22.h,
                  ),
                  const chooseCategory(),
                  SizedBox(
                    height: 22.h,
                  ),
                  const placeEventField(),
                  SizedBox(
                    height: 22.h,
                  ),
                  const dateField(),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TimeStartingField(),
                      SizedBox(
                        width: 13.w,
                      ),
                      const TimeFinishField(),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  const DescriptionField(),
                  SizedBox(
                    height: 48.h,
                  ),
                  const createEventButton(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class nameEventField extends StatelessWidget {
  const nameEventField({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<createEventModel>();
    return Center(
      child: SizedBox(
        width: 300.w,
        height: 40.h,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Название мероприятия",
          placeholderStyle: TextStylee.fieldStyle,
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class placeEventField extends StatelessWidget {
  const placeEventField({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<createEventModel>();
    return Center(
      child: SizedBox(
        width: 300.w,
        height: 40.h,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Место проведения",
          placeholderStyle: TextStylee.fieldStyle,
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class dateField extends StatelessWidget {
  const dateField({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<createEventModel>();
    return Center(
      child: SizedBox(
        width: 300.w,
        height: 40.h,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Дата проведения",
          placeholderStyle: TextStylee.fieldStyle,
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class chooseCategory extends StatelessWidget {
  const chooseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final model = context.watch<createEventModel>();
    return SizedBox(
      width: 300.w,
      height: 45.h,
      child: Material(
        child: ValueListenableBuilder(
            valueListenable: dropValue,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border, width: 1)),
                ),
                isExpanded: true,
                hint: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    'Выбрать категорию',
                    style: TextStylee.fieldStyle,
                  ),
                ),
                icon: const Icon(Icons.keyboard_arrow_down_sharp),
                value: (value.isEmpty) ? null : value,
                onChanged: (choice) {
                  dropValue.value = choice.toString();
                },
                items: model.listHobby
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }
}

class TimeStartingField extends StatelessWidget {
  const TimeStartingField({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<createEventModel>();
    return Center(
      child: SizedBox(
        width: 136.w,
        height: 40.h,
        child: CupertinoTextField(
          padding: EdgeInsets.only(right: 8.w, top: 10.h, bottom: 10.h),
          autofocus: true,
          prefix: Padding(
            padding: EdgeInsets.only(right: 8.w, left: 12.w),
            child: SvgPicture.asset(
              "assets/image/clock.svg",
              width: 16.w,
              height: 16.h,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Время начала",
          placeholderStyle: TextStylee.fieldStyle,
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class TimeFinishField extends StatelessWidget {
  const TimeFinishField({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<createEventModel>();
    return Center(
      child: SizedBox(
        width: 142.w,
        height: 40.h,
        child: CupertinoTextField(
          padding: EdgeInsets.only(right: 8.w, top: 10.h, bottom: 10.h),
          autofocus: true,
          prefix: Padding(
            padding: EdgeInsets.only(right: 8.w, left: 12.w),
            child: SvgPicture.asset(
              "assets/image/clock.svg",
              width: 16.w,
              height: 16.h,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {},
          placeholder: "Время окончания",
          placeholderStyle: TextStylee.fieldStyle,
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<createEventModel>();
    return SizedBox(
      width: 300.w,
      height: 129.h,
      child: CupertinoTextField(
        onChanged: (value) {},
        padding: EdgeInsets.only(left: 14.w, top: 14.h),
        placeholder: "Описание",
        placeholderStyle: TextStylee.fieldStyle,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.top,
        decoration: BoxDecoration(
          border: Border.all(color: colors.border),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
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

class createEventButton extends StatelessWidget {
  const createEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<createEventModel>();
    return Padding(
      padding: EdgeInsets.only(bottom: 38.h),
      child: Center(
        child: SizedBox(
          width: 252.w,
          height: 46.h,
          child: ElevatedButton(
            onPressed: () => model.createEvent(context),
            style: Buttonstyle.main_button_style,
            child: Text(
              "Создать",
              style: TextStylee.myDateWhite_text,
            ),
          ),
        ),
      ),
    );
  }
}
