import 'package:flutter/material.dart';
import 'package:movise/Api-Manegar.dart';
import 'package:movise/Models/search_model.dart';
import 'package:movise/widgets/search/search_movies_item.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = "Search";
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<SearchModel> movies = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121312),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) async {
                if (value.isEmpty) {
                  movies = [];
                  setState(() {});
                } else {
                  movies = await ApiManager.searchMovies(movieName: value);
                  setState(() {});
                }

                // print(await ApiManager.searchMovies());
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Color(0xff373635),
                filled: true,
                labelText: 'Search',
                labelStyle: TextStyle(color: Color(0xff908f8f)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Visibility(
            visible: movies.isNotEmpty,
            child: Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 25,
                  childAspectRatio: 4 / 8,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return SearchMoviesItem(
                    model: movies[index],
                    callBack: () {},
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: movies.isEmpty,
            child: Expanded(
              child: Column(
                children: [
                  Spacer(),
                  Image.asset("assets/images/Icon movies.png"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'No movies found',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffb2b2b2)),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
