import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/Domain/Models/main_appbar_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider(
          create: (context) => MainAppBarModel(), child: const subMainAppBar()),
    );
  }
}

class subMainAppBar extends StatelessWidget {
  const subMainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainAppBarModel>();
    return AppBar(
      centerTitle: true,
      title: SvgPicture.asset(
        "assets/image/logo.svg",
        width: 135.w,
        height: 33.h,
      ),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 10.w,
          ),
          child: Container(
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () => model.goToProfileScreen(context),
              icon: SvgPicture.asset(
                "assets/image/noAvatarUser.svg",
                width: 38.w,
                height: 38.h,
              ),
            ),
          ),
        )
      ],
    );
  }
}
