import 'package:flutter/material.dart';
import '../../controller/category_controller.dart';
import '../../model/category_database_datamodel.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  CategoryItemWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // width
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80, //
            width: 80, // ask bandhan
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(category.thumbnail), // Thumbnail image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Center(
            child: Text(
              category.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
