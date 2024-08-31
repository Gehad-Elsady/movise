import 'package:flutter/material.dart';
import 'package:movise/Api-Manegar.dart';
import 'package:movise/moviesitem.dart';

class RecommendedMovies extends StatefulWidget {
  const RecommendedMovies({super.key});

  @override
  State<RecommendedMovies> createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  List<bool> bookmarked = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getRecommendedMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error loading new releases',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          );
        }
        var newReleases = snapshot.data?.results ?? [];

        // Initialize the bookmarked list with 'false' for each item
        if (bookmarked.length != newReleases.length) {
          bookmarked = List<bool>.filled(newReleases.length, false);
        }

        return Container(
          padding: EdgeInsets.only(left: 15, bottom: 17),
          margin: EdgeInsets.zero,
          color: Color(0xff282A28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 11,
                  bottom: 17,
                  left: 10,
                ),
                child: Text(
                  "Recommended Movies",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newReleases.length,
                  itemBuilder: (context, index) {
                    return MoviesItem(
                      model: newReleases[index],
                      callBack: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
