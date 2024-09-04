// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movise/Bloc/Home/cubit.dart';
import 'package:movise/Bloc/Home/states.dart';
import 'package:movise/widgets/movies/moviesitem.dart';

class RecommendedMovies extends StatelessWidget {
  RecommendedMovies({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getRecommendedMovies(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          if (cubit.recommendedResponse != null &&
              cubit.recommendedResponse!.results != null) {
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
                      "Recommende Movies",
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
                      itemCount: cubit.recommendedResponse!.results!.length,
                      itemBuilder: (context, index) {
                        return MoviesItem(
                          model: cubit.recommendedResponse!.results![index],
                          callBack: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is HomeGetUpcomingMoviesErrorState) {
            return Center(
              child: Text(
                'Error loading new releases',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                'No new releases available',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
