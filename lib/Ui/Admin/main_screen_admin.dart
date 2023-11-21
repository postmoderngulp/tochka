import 'package:Tochka_Sbora/Ui/Admin/main_screen.dart';
import 'package:Tochka_Sbora/Ui/Admin/notification_admin.dart';
import 'package:Tochka_Sbora/Ui/Admin/profile_admin.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mainSreenAdmin extends StatefulWidget {
  int selectIndex = 0;
  mainSreenAdmin({super.key});

  @override
  State<mainSreenAdmin> createState() => _mainSreenCompanyState();
}

class _mainSreenCompanyState extends State<mainSreenAdmin> {
  final List<Widget> _tabs = [
    const MainScreenAdmin(),
    const notificationAdmin(),
    const ProfileAdminScreen()
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
