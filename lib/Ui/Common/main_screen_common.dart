import 'package:Tochka_Sbora/Ui/Common/main_screen.dart';
import 'package:Tochka_Sbora/Ui/Common/notification.dart';
import 'package:Tochka_Sbora/Ui/Common/search.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mainSreenCompany extends StatefulWidget {
  int selectIndex = 0;
  mainSreenCompany({super.key});

  @override
  State<mainSreenCompany> createState() => _mainSreenCompanyState();
}

class _mainSreenCompanyState extends State<mainSreenCompany> {
  final List<Widget> _tabs = [
    const MainScreen(),
    const Search(),
    const notification()
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
        height: 100.h,
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
                size: 32.w,
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/image/search.png'),
                  size: 32.w,
                ),
                label: 'Поиск'),
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/image/notification_icon.png'),
                size: 32.w,
              ),
              label: 'Уведомления',
            ),
          ],
        ),
      ),
    );
  }
}