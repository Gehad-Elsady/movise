import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movise/Models/catrgory-model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  Function callBack;

  CategoryItem({required this.callBack, required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callBack();
      },
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(category.image)),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        Center(
          child: Text(
            category.name,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
