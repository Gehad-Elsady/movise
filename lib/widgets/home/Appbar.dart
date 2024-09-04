import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movise/Bloc/Home/cubit.dart';
import 'package:movise/Bloc/Home/states.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getPopularMovies(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (cubit.popularResponse != null &&
              cubit.popularResponse!.results != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CarouselSlider.builder(
                  itemCount: cubit.popularResponse!.results!.length,
                  options: CarouselOptions(
                    height: 300.0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                  ),
                  itemBuilder: (context, index, realIdx) {
                    return Stack(children: [
                      Column(
                        children: [
                          Image.network(
                            height: 220,
                            width: double.infinity,
                            'https://image.tmdb.org/t/p/w500${cubit.popularResponse!.results![index].posterPath}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.grey,
                              child: const Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14),
                          Padding(
                            padding: const EdgeInsets.only(left: 162.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  cubit.popularResponse!.results![index]
                                          .originalTitle ??
                                      "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  cubit.popularResponse!.results![index]
                                          .releaseDate
                                          ?.substring(0, 4) ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90.0, left: 20),
                        child: Container(
                          height: 200,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Color(0XFF282A28),
                              borderRadius: BorderRadius.circular(8)),
                          child: Stack(
                            children: [
                              Card(
                                margin: EdgeInsets.zero,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  child: Image.network(
                                    height: double.infinity,
                                    'https://image.tmdb.org/t/p/w500${cubit.popularResponse!.results![index].posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]);
                  },
                ),
              ],
            );
          } else {
            return Center(child: Text('No movies available'));
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
