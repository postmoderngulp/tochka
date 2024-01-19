import 'package:Tochka_Sbora/Ui/Organizer/main_screen.dart';
import 'package:Tochka_Sbora/Ui/Organizer/notification_organizer.dart';
import 'package:Tochka_Sbora/Ui/Organizer/profile_organizer.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class mainSreenOrganizer extends StatefulWidget {
  int selectIndex = 0;
  mainSreenOrganizer({super.key});

  @override
  State<mainSreenOrganizer> createState() => _mainSreenCompanyState();
}

class _mainSreenCompanyState extends State<mainSreenOrganizer> {
  final List<Widget> _tabs = [
    const MainScreenOrganizer(),
    const notificationOrganizer(),
    const ProfileOrganizerScreen()
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
        height: 58.h,
        child: Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
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
