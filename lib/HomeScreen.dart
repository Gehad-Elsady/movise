import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class HomeScreen extends StateLessWidget {
  static const String routeName = 'Home Screen';


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
