import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movise/Bloc/movies/movies-cubit.dart';
import 'package:movise/Bloc/movies/movise-states.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trailer extends StatefulWidget {
  final int id;

  const Trailer({super.key, required this.id});

  @override
  State<Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller later, after fetching the trailer data
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getTrailerMovie(id: widget.id),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {
          _controller = YoutubePlayerController(
            initialVideoId:
                MoviesCubit.get(context).trailerRespons!.results![0].key!,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          );
        },
        builder: (context, state) {
          if (state is TrailerLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrailerErrorState) {
            return Center(child: Text('Error'));
          } else if (state is TrailerSuccessState) {
            if (MoviesCubit.get(context).trailerRespons!.results!.isEmpty) {
              return const Center(child: Text('No trailers available.'));
            } else {
              return YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              );
            }
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
