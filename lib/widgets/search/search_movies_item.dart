import 'package:flutter/material.dart';
import 'package:movise/Models/search_model.dart';

class SearchMoviesItem extends StatefulWidget {
  final SearchModel model;
  final VoidCallback callBack;

  SearchMoviesItem({required this.model, required this.callBack, super.key});

  @override
  State<SearchMoviesItem> createState() => _MoviesItemState();
}

class _MoviesItemState extends State<SearchMoviesItem> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0XFF343534),
        borderRadius: BorderRadius.circular(8),
      ),
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
                    widget.model.posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${widget.model.posterPath}'
                        : "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 170,
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
                child: Image.asset(
                  isBookmarked
                      ? 'assets/images/bookmark.png'
                      : 'assets/images/bookmark-add.png',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Column(
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
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.model.releaseDate!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
