import 'package:flutter/material.dart';
import 'package:movise/Models/popularMoviesResponse%20.dart';

class MoviesItem extends StatefulWidget {
  final Results model;
  Function callBack;
  MoviesItem({required this.model, required this.callBack, super.key});

  @override
  State<MoviesItem> createState() => _MoviesItemState();
}

class _MoviesItemState extends State<MoviesItem> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
          color: const Color(0XFF343534),
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${widget.model.posterPath}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 170, // Adjust the height as necessary
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.callBack();
                    isBookmarked = !isBookmarked;
                  });
                  print(
                      '${widget.model.originalTitle} is bookmarked: $isBookmarked');
                },
                child: Image.asset(isBookmarked
                    ? 'assets/images/bookmark.png'
                    : 'assets/images/bookmark-add.png'),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      widget.model.voteAverage!.toStringAsFixed(1),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  widget.model.originalTitle ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.model.releaseDate!.substring(0, 4),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
