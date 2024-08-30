import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movise/Api-Manegar.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<bool> bookmarked = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getPopularMovies(),
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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider.builder(
              itemCount: newReleases.length,
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
                        'https://image.tmdb.org/t/p/w500${newReleases[index].backdropPath}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
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
                      SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 162.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              newReleases[index].originalTitle ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              newReleases[index].releaseDate!.substring(0, 4),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
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
                                'https://image.tmdb.org/t/p/w500${newReleases[index].posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  bookmarked[index] = !bookmarked[index];
                                });
                              },
                              child: Image.asset(
                                bookmarked[index]
                                    ? "assets/images/bookmark.png"
                                    : "assets/images/bookmark-add.png",
                                // width: 24, // specify a size if necessary
                                // height: 24, // specify a size if necessary
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
      },
    );
  }
}
