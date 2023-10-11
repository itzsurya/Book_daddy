// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/flutter_svg.dart';
import 'package:book_dadyy/home.dart';
import 'package:book_dadyy/pages/profile_page.dart';
import 'package:book_dadyy/screens/bookmark.dart';
import 'package:book_dadyy/screens/searchscreen.dart';
import 'package:flutter/material.dart';
import 'colors.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    Search(),
    BookMark(),
    ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
    
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: KFourthColor,
          selectedItemColor: KFourthColor,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
                 icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: KFourthColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                color: KFourthColor,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                // ignore: deprecated_member_use
                color: KFourthColor,
              ),
              label: 'Bookmarks',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                color: KFourthColor,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
