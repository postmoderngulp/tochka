import 'package:flutter/material.dart';
import 'package:Tochka_Sbora/Domain/Models/main_appbar_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      title: Image.asset(
        "assets/image/logo.png",
        width: 160.w,
        height: 150.h,
      ),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 25.w,
          ),
          child: Container(
            width: 30.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () => model.goToProfileScreen(context),
              icon: Icon(
                Icons.person,
                color: Colors.grey[400],
                size: 30.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}
