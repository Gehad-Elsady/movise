import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movise/Bloc/browes/browe-cubit.dart';
import 'package:movise/Bloc/browes/browes-states.dart';
import 'package:movise/Models/catrgory-model.dart';
import 'package:movise/widgets/movies/moviesitem.dart';

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
    return BlocProvider(
      create: (context) => BrowseCubit()
        ..getSpecificCategory(id: model.id, page: page.toString()),
      child: BlocConsumer<BrowseCubit, BrowseStates>(
        builder: (context, state) {
          var cubit = BrowseCubit.get(context);
          if (state is BrowseLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BrowseSuccessState) {
            // Corrected state condition
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
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3 / 6,
                        ),
                        itemCount: cubit.categoryResponse!.results!.length,
                        itemBuilder: (context, index) {
                          return MoviesItem(
                            model: cubit.categoryResponse!.results![index],
                            callBack: () {},
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
                                  cubit.getSpecificCategory(
                                      id: model.id, page: page.toString());
                                },
                                icon: Icon(Icons.arrow_back),
                              ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              page++;
                            });
                            cubit.getSpecificCategory(
                                id: model.id, page: page.toString());
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
                child: Text(
              'Failed to load data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ));
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
