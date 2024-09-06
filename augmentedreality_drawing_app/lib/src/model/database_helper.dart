// lib/services/database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:augmentedreality_drawing_app/src/model/svgfile_datamodel.dart';
import 'package:augmentedreality_drawing_app/src/model/category_database_datamodel.dart';



class DatabaseHelper {
  static final _databaseName = "template_database.db";
  static final _databaseVersion = 1;

  static final tableCategories = 'categories';
  static final tableSvgFiles = 'svg_files';

  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();

  // Database reference
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // Create tables
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCategories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        thumbnail TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE $tableSvgFiles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER NOT NULL,
        file_path TEXT NOT NULL,
        FOREIGN KEY (category_id) REFERENCES $tableCategories(id) ON DELETE CASCADE
      );
    ''');
  }

  // Insert a new category
  Future<int> insertCategory(Category category) async {
    Database db = await instance.database;
    return await db.insert(tableCategories, category.toMap());
  }

  // Insert a new SVG file
  Future<int> insertSvgFile(SvgFile svgFile) async {
    Database db = await instance.database;
    return await db.insert(tableSvgFiles, svgFile.toMap());
  }

  // Retrieve categories
  Future<List<Category>> getCategories() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableCategories);
    return List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }

  // Retrieve SVG files by category
  Future<List<SvgFile>> getSvgFilesByCategory(int categoryId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      tableSvgFiles,
      where: "category_id = ?",
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return SvgFile.fromMap(maps[i]);
    });
  }
  // Delete a category by ID
  Future<int> deleteCategory(int id) async {
    Database db = await instance.database;
    // Delete the category by its ID
    return await db.delete(
      tableCategories,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Update a category
  Future<int> updateCategory(Category category) async {
    Database db = await instance.database;
    return await db.update(
      tableCategories,
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

}
