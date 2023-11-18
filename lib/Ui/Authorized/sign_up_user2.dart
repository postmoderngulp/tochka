import 'package:Tochka_Sbora/style/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Domain/Models/sign_up_user2_model.dart';
import '../../style/styles/text_style.dart';

class SignUpUser2 extends StatelessWidget {
  const SignUpUser2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
            create: (context) => SignUpUser2Model(),
            child: const subSignUpUser2()),
      ),
    );
  }
}

class subSignUpUser2 extends StatelessWidget {
  const subSignUpUser2({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpUser2Model>();
    final dropValue = ValueNotifier('');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 77.h,
          ),
          Text(
            "Выбери свои",
            style: TextStylee.title_text,
          ),
          Text(
            "увлечения",
            style: TextStylee.title_text,
          ),
          SizedBox(
            height: 27.h,
          ),
          Text(
            "На основе ваших интересов мы подберем наиболее подходящие мероприятия и группы",
            style: TextStylee.second_text,
          ),
          SizedBox(
            height: 40.h,
          ),
          Column(
            children: [
              SizedBox(
                width: 335.w,
                height: 50.h,
                child: Material(
                  child: ValueListenableBuilder(
                      valueListenable: dropValue,
                      builder: (BuildContext context, String value, _) {
                        return DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0)),
                          ),
                          isExpanded: true,
                          hint: Text(
                            'Выбрать категорию',
                            style: TextStylee.second_text,
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
              ),
              SizedBox(
                height: 50.h,
              ),
              Wrap(
                  children: List.generate(
                model.listHobby.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
                  child: SizedBox(
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () => model.setVal(index),
                      style: model.val == index
                          ? Buttonstyle.self_button_style
                          : Buttonstyle.inActive_self_button_style,
                      child: Text(
                        model.listHobby[index],
                        style: model.val == index
                            ? TextStylee.hobby_text
                            : TextStylee.inactive_hobby_text,
                      ),
                    ),
                  ),
                ),
              )),
              Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  SizedBox(
                    width: 160.w,
                    height: 45.h,
                    child: ElevatedButton(
                      onPressed: () => model.goToRegistrUser2(context),
                      style: Buttonstyle.baseMain_button_style,
                      child: Text(
                        "Завершить",
                        style: TextStylee.main_text,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Center(
                child: TextButton(
                  onPressed: () => model.goToRegistrUser2(context),
                  child: Text(
                    "Пропустить",
                    style: TextStylee.second_text,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
