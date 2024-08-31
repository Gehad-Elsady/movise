import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movise/Appbar.dart';
import 'package:movise/New-Realeases-movies.dart';
import 'package:movise/recommended-movies.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(),
            // SizedBox(height: 20),
            // ---------------------------------------------------------------movies item
            NewRealeasesMovies(),

            // ---------------------------------------------------------------trending item
            SizedBox(
              height: 42,
            ),
            RecommendedMovies(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
