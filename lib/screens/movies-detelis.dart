import 'package:flutter/material.dart';
import 'package:movise/Models/popularMoviesResponse%20.dart';
import 'package:movise/theme/app_color.dart';
import 'package:movise/widgets/movies/SimilarMovies.dart';
import 'package:movise/widgets/movies/moviesdetelis.dart';
import 'package:movise/widgets/movies/trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesDetails extends StatefulWidget {
  static const String routeName = 'detailsScreen';

  @override
  _MoviesDetailsState createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  YoutubePlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as Results;

    return Scaffold(
      backgroundColor: AppColors.ScaffoldClore,
      appBar: AppBar(
        title: Text(
          model.originalTitle ?? "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Trailer(id: model.id!),
            MoviesDetailsDta(
              id: model.id!,
            ),
            SimilarMovies(id: model.id!)
          ],
        ),
      ),
    );
  }
}
