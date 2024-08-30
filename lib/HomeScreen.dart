import 'package:flutter/material.dart';
import 'package:movise/home/tabs/browse.dart';
import 'package:movise/home/tabs/home_tab.dart';
import 'package:movise/home/tabs/search_movies_tab.dart';
import 'package:movise/home/tabs/search_tab.dart';
import 'package:movise/home/tabs/watch_list_tab.dart';

import 'app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';
   HomeScreen({super.key});

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
          selectedIndex = index;
          setState(() {

          });
        },

        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/Home.png')),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/Search.png')),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/Browse.png')),
              label: 'Browse'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/watchlist.png')),
              label: 'Watch List'),
        ],
      ),
      body:tabs[selectedIndex] ,
    );
  }

  List<Widget> tabs = [
 HomeTab(),
SearchTab(),
SearchMoviesTab(),
Browse(),
WatchListTab(),
  ];
}
