import 'package:Tochka_Sbora/Ui/Common/main_screen.dart';
import 'package:Tochka_Sbora/Ui/Common/notification.dart';
import 'package:Tochka_Sbora/Ui/Common/profile_screen.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class mainSreenCommon extends StatefulWidget {
  int selectIndex = 0;
  mainSreenCommon({super.key});

  @override
  State<mainSreenCommon> createState() => _mainSreenCompanyState();
}

class _mainSreenCompanyState extends State<mainSreenCommon> {
  final List<Widget> _tabs = [
    const MainScreen(),
    const notification(),
    const ProfileScreen()
  ];

  void tapBar(int index) {
    setState(() {
      widget.selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _tabs[widget.selectIndex],
      bottomNavigationBar: SizedBox(
        height: 65.h,
        child: Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            backgroundColor: Colors.white,
            onTap: tapBar,
            currentIndex: widget.selectIndex,
            selectedItemColor: colors.MainColor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(color: colors.MainColor),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/image/icon_home.svg',
                  colorFilter: ColorFilter.mode(
                      widget.selectIndex == 0 ? colors.MainColor : Colors.grey,
                      BlendMode.srcIn),
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/image/icon_bell.svg',
                    colorFilter: ColorFilter.mode(
                        widget.selectIndex == 1
                            ? colors.MainColor
                            : Colors.grey,
                        BlendMode.srcIn),
                  ),
                  label: 'Уведомления'),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/image/icon_user.svg',
                  colorFilter: ColorFilter.mode(
                      widget.selectIndex == 2 ? colors.MainColor : Colors.grey,
                      BlendMode.srcIn),
                ),
                label: 'Профиль',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
