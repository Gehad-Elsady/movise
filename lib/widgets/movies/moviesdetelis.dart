import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movise/Bloc/movies/movies-cubit.dart';
import 'package:movise/Bloc/movies/movise-states.dart';

class MoviesDetailsDta extends StatelessWidget {
  final int id;

  MoviesDetailsDta({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getMovieDetelis(id: id),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MoviesDetailsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MoviesDetailsErrorState) {
            return Center(
                child: Text("Error loading movies",
                    style: TextStyle(color: Colors.white)));
          } else if (state is MoviesDetailsSuccessState) {
            // var movies = MoviesCubit.get(context).moviesResponsD;
            // if (movies == null || movies.isEmpty) {
            //   return Center(
            //       child: Text("No similar movies found",
            //           style: TextStyle(color: Colors.white)));
            // }
            return Column(
              // Added the return statement here
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        MoviesCubit.get(context)
                                .moviesResponsD!
                                .originalTitle ??
                            "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        MoviesCubit.get(context)
                                .moviesResponsD!
                                .releaseDate
                                ?.substring(0, 4) ??
                            "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            margin: EdgeInsets.zero,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${MoviesCubit.get(context).moviesResponsD!.posterPath}',
                                fit: BoxFit.cover,
                                width: 130,
                                height: 200, // Adjust the height as necessary
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 8.0, // Space between each genre
                                  runSpacing: 8.0, // Space between rows
                                  children: MoviesCubit.get(context)
                                      .moviesResponsD!
                                      .genres!
                                      .map((genre) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Text(
                                        genre.name ?? "",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  MoviesCubit.get(context)
                                          .moviesResponsD!
                                          .overview ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      MoviesCubit.get(context)
                                          .moviesResponsD!
                                          .voteAverage!
                                          .toStringAsFixed(1),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container(); // Placeholder for other states if necessary
          }
        },
      ),
    );
  }
}
