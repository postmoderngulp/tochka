import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../style/styles/text_style.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _NotificationState();
}

class _NotificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: subNotification(),
      ),
    );
  }
}

class subNotification extends StatelessWidget {
  const subNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/image/notification.svg",
            width: 65.w,
            height: 65.h,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "У вас пока нет уведомлений!",
            style: TextStylee.NotNotification_text,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Здесь будут отображаться групповые",
            style: TextStylee.second_text,
          ),
          Text(
            "уведомления  и напоминания о мероприятиях",
            style: TextStylee.second_text,
          ),
        ],
      ),
    );
  }
}
