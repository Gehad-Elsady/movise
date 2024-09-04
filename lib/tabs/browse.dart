import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movise/Api-Manegar.dart';
import 'package:movise/Models/catrgory-model.dart';
import 'package:movise/widgets/browse/category-item.dart';
import 'package:movise/widgets/browse/categorydetelis.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  var category = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            // ---------------------------------------------------------------category item
            Text(
              textAlign: TextAlign.left,
              'Browse Category',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 25,
                ),
                itemBuilder: (context, index) {
                  return CategoryItem(
                    category: category[index],
                    callBack: () {
                      Navigator.pushNamed(context, CategoryDetails.routeName,
                          arguments: category[index]);
                    },
                  );
                },
                itemCount: category.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
