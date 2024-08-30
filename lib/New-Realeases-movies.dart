import 'package:flutter/material.dart';
import 'package:movise/Api-Manegar.dart';

class NewRealeasesMovies extends StatefulWidget {
  const NewRealeasesMovies({super.key});

  @override
  State<NewRealeasesMovies> createState() => _NewRealeasesMoviesState();
}

class _NewRealeasesMoviesState extends State<NewRealeasesMovies> {
  List<bool> bookmarked = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getUpcomingMovies(),
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
                  "New Realeases Movies",
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
                    return Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0XFF343534),
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
                                    'https://image.tmdb.org/t/p/w500${newReleases[index].posterPath}',
                                    // height: 200,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
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
                          SizedBox(
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
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${newReleases[index].voteAverage.toString().substring(0, 3)}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text(
                                  newReleases[index].originalTitle ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  newReleases[index]
                                          .releaseDate
                                          ?.substring(0, 4) ??
                                      "",
                                  style: TextStyle(
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
