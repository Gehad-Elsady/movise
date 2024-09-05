import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movise/Bloc/movies/movies-cubit.dart';
import 'package:movise/Bloc/movies/movise-states.dart';
import 'package:movise/widgets/movies/moviesitem.dart';

class SimilarMovies extends StatelessWidget {
  final int id;
  SimilarMovies({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getSimilarMovie(id: id),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        builder: (context, state) {
          if (state is MoviesLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MoviesErrorState) {
            return Center(
                child: Text("Error loading movies",
                    style: TextStyle(color: Colors.white)));
          } else if (state is MoviesSuccessState) {
            var movies = MoviesCubit.get(context).moviesRespons?.results;

            // Check if movies is null or empty
            if (movies == null || movies.isEmpty) {
              return Center(
                  child: Text("No similar movies found",
                      style: TextStyle(color: Colors.white)));
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
                      "More Like This",
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
                      itemCount:
                          movies.length, // Use the actual length of movies
                      itemBuilder: (context, index) {
                        return MoviesItem(
                          model: movies[index],
                          callBack: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(); // Placeholder for other states if necessary
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
