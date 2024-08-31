import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movise/Api-Manegar.dart';
import 'package:movise/Models/catrgory-model.dart';
import 'package:movise/moviesitem.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = "CategoryDetails";
  CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          model.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ApiManager.getSpecificCategory(
                    id: model.id, page: page.toString()),
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
                          color: Colors.white,
                        ),
                      ),
                    );
                  }

                  var specificCategory = snapshot.data?.results ?? [];

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20, // Reduced mainAxisSpacing
                      crossAxisSpacing: 10,
                      childAspectRatio:
                          3 / 6, // Adjusted aspect ratio for better fit
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          MoviesItem(
                            model: specificCategory[index],
                            callBack: () {},
                          ),
                        ],
                      );
                    },
                    itemCount: specificCategory.length,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                page == 1
                    ? SizedBox()
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            page--;
                          });
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      page++;
                    });
                    print(page);
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
