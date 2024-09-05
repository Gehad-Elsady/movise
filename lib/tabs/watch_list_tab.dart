import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movise/firebase/firebase-function.dart';
import 'package:movise/widgets/movies/moviesitem.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFunctions.getMovies(),
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
        var movies = snapshot.data?.docs
            .map(
              (doc) => doc.data(),
            )
            .toList();
        return Container(
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
                  "More Like Movies",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    childAspectRatio: 4 / 7,
                  ),
                  itemCount: movies!.length,
                  itemBuilder: (context, index) {
                    return MoviesItem(
                      isBooked: true,
                      model: movies[index],
                      callBack: () {},
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
