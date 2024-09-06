import '../model/category_database_datamodel.dart';
import '../model/database_helper.dart';
import '../model/svgfile_datamodel.dart';

class CategoryController {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // Fetch all categ from db
  Future<List<Category>> fetchCategories() async {
    try {
      // Get list of categ from db
      List<Category> categories = await _dbHelper.getCategories();
      return categories;
    } catch (e) {
      // error handling
      print("Error fetching categories: $e");
      return [];
    }
  }

  // get svg for said categ object
  Future<List<SvgFile>> fetchSvgFilesByCategory(int categoryId) async {
    try {
      // list of svg files for said categ
      List<SvgFile> svgFiles = await _dbHelper.getSvgFilesByCategory(categoryId);
      return svgFiles;
    } catch (e) {
      // Error handling
      print("Error fetching SVG files for category $categoryId: $e");
      return [];
    }
  }

  // add
  Future<void> addCategory(String name, String thumbnail) async {
    try {
      // new obj
      Category newCategory = Category(name: name, thumbnail: thumbnail);
      // insert t o db
      await _dbHelper.insertCategory(newCategory);
      print("Category added: $name");
    } catch (e) {
      // error for debug purpose
      print("Error adding category: $e");
    }
  }

  // delete by id
  Future<void> deleteCategory(int categoryId) async {
    try {
      // delete
      await _dbHelper.deleteCategory(categoryId);
      print("Category deleted with ID: $categoryId");
    } catch (e) {
      //error handling
      print("Error deleting category: $e");
    }
  }

  // Update a category in the database
  Future<void> updateCategory(Category category) async {
    try {
      // Update the category in the database
      await _dbHelper.updateCategory(category);
      print("Category updated: ${category.name}");
    } catch (e) {
      // Handle any errors that occur during update
      print("Error updating category: $e");
    }
  }
}
