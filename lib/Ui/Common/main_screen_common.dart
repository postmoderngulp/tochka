import 'package:Tochka_Sbora/Ui/Common/main_screen.dart';
import 'package:Tochka_Sbora/Ui/Common/notification.dart';
import 'package:Tochka_Sbora/Ui/Common/profile_screen.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: _tabs[widget.selectIndex],
      bottomNavigationBar: SizedBox(
        height: 58.h,
        child: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          backgroundColor: Colors.white,
          onTap: tapBar,
          currentIndex: widget.selectIndex,
          selectedItemColor: colors.MainColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: colors.MainColor),
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/image/home.png'),
                size: 20.w,
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/image/notification.png'),
                  size: 20.w,
                ),
                label: 'Уведомления'),
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/image/profile.png'),
                size: 20.w,
              ),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}
