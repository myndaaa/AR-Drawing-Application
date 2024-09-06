import 'package:augmentedreality_drawing_app/src/view/widgets/see_all_widget.dart';
import 'package:flutter/material.dart';
import '../../controller/category_controller.dart';
import '../../model/category_database_datamodel.dart';
import 'category_item.dart';


class CategoriesWidget extends StatelessWidget {
  final CategoryController categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: categoryController.fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading categories'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No categories available'));
        } else {
          List<Category> categories = snapshot.data!;

          // Limit to first 8 categories for display
          List<Category> displayCategories =
          categories.length > 8 ? categories.sublist(0, 8) : categories;

          return Container(
            color: Color(0xFFFAFAFA),
            height: 200, // Set height
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: displayCategories.length + 1, // +1 for "See All" container
              itemBuilder: (context, index) {
                if (index < displayCategories.length) {
                  // Category Item
                  return CategoryItemWidget(category: displayCategories[index]);
                } else {
                  // "See All" Container
                  return SeeAllWidget();
                }
              },
            ),
          );
        }
      },
    );
  }
}



