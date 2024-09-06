import 'database_helper.dart';
import 'package:augmentedreality_drawing_app/src/model/svgfile_datamodel.dart';
import 'package:augmentedreality_drawing_app/src/model/category_database_datamodel.dart';


class DataPopulator {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  Future<void> populateData() async {
    // List of categories and their associated SVG files
    final List<Map<String, dynamic>> categoriesWithSvgFiles = [
      {
        'name': 'Animals',
        'thumbnail': 'assets/images/animal.png',
        'svgs': [
          'assets/images/animals/tiger.svg',
        ],
      },
      {
        'name': 'Anime',
        'thumbnail': 'assets/images/anime.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Birds',
        'thumbnail': 'assets/images/birds.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Cute',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Fruit',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Vegetable',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Butterfly',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Sports',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Cars',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Bikes',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Men',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Women',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Foods',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },
      {
        'name': 'Instruments',
        'thumbnail': 'assets/images/cute.png',
        'svgs': [
          'assets/images/vehicles/car.svg',
        ],
      },

    ];

    // Insert data into the database
    for (var categoryData in categoriesWithSvgFiles) {
      // Create a Category object
      Category category = Category(
        name: categoryData['name'],
        thumbnail: categoryData['thumbnail'],
      );

      // Insert the category into the database
      int categoryId = await dbHelper.insertCategory(category);

      // Insert associated SVG files into the database
      for (String svgFilePath in categoryData['svgs']) {
        SvgFile svgFile = SvgFile(
          categoryId: categoryId,
          filePath: svgFilePath,
        );

        await dbHelper.insertSvgFile(svgFile);
      }
    }

    print("Data population complete!");
  }
}

void main() async {
  DataPopulator dataPopulator = DataPopulator();
  await dataPopulator.populateData();
}
