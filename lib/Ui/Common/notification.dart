import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/styles/text_style.dart';
import '../../style/permanentEl/main_app_bar.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _NotificationState();
}

class _NotificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(1.w, 60.h), child: const MainAppBar()),
        body: const subNotification(),
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
          Image.asset(
            "assets/image/notification.png",
            width: 90.w,
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
