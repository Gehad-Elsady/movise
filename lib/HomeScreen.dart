import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movise/tabs/browse.dart';
import 'package:movise/tabs/home_tab.dart';
import 'package:movise/tabs/search_tab.dart';
import 'package:movise/tabs/watch_list_tab.dart';

import 'app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.Black,
        selectedItemColor: AppColors.amber,
        unselectedItemColor: AppColors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Home.png'),
                size: 40,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Search.png'),
                size: 40,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Browse.png'),
                size: 40,
              ),
              label: 'Browse'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/watchlist.png'),
                size: 40,
              ),
              label: 'Watch List'),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    Browse(),
    WatchListTab(),
  ];
}
