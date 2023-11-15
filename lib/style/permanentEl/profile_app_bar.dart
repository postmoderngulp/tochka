import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "nickname",
        style: TextStyle(fontFamily: "GeometriaMedium"),
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      backgroundColor: colors.MainColor,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: SvgPicture.asset(
          "assets/image/backArrow.svg",
          width: 19.w,
          height: 19.h,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/image/settings.svg",
              width: 19.w,
              height: 19.h,
            ))
      ],
    );
  }
}
