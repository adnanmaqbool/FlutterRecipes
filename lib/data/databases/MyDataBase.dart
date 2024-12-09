import 'package:flut_api/model/categories/Category.dart';
import 'package:flut_api/model/recipes/Recipe.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../constants/AppConst.dart';

class MyDatabase {
  MyDatabase._privateConstructor();

  static final MyDatabase _instance = MyDatabase._privateConstructor();

  // static late Future<Database> _dbInstance;
  static Future<Database>? _dbInstance;

  factory MyDatabase() {
    // _dbInstance = dataBaseCreation();
    return _instance;
  }


  // Public getter for the database instance
  Future<Database> get database async {
    // Initialize database if it’s not already
    _dbInstance ??= dataBaseCreation();
    return _dbInstance!;
  }



// A method that retrieves all the dogs from the dogs table.
  Future<List<Category>> getCategoryList() async {
    // Get a reference to the database.
    final db = await database;
    // Query the table for all The Dogs.
    final List<Map<String, Object?>> maps =
        await db.query(AppConst.categoryTableName);
/*    dynamic maps = await db.query(AppConst.categoryTableName);
    return maps;*/

    // return categoryFromJson(maps); // old way

    return List<Category>.from(maps.map((map) => Category.fromJson(map))); // new way

/*
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return  List.generate(maps.length, (i) {
      return Category(
        id: maps[i]['Id'].toString(),
        categoryUrduName: maps[i]['CategoryName'],
        countryId: maps[i]['CountryId'],
        totalRecipeCount: maps[i]['RecipeCount'],
      );
    });
*/
  }



  Future<List<Recipe>> getRecipeList(categoryId) async {
    // Get a reference to the database.
        final db = await database;

    // Query the table for all The Recipes.
    final List<Map<String, Object?>> maps =
    await db.query(AppConst.recipeTableName,
        where: 'Cat_Id = ?', // Filter condition
        whereArgs: [categoryId]);   // Arguments for the filter);
/*    dynamic maps = await db.query(AppConst.categoryTableName);
    return maps;*/
    return recipeFromJson(maps);
/*
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return  List.generate(maps.length, (i) {
      return Category(
        id: maps[i]['Id'].toString(),
        categoryUrduName: maps[i]['CategoryName'],
        countryId: maps[i]['CountryId'],
        totalRecipeCount: maps[i]['RecipeCount'],
      );
    });
*/
  }

  Future<Recipe?> getRecipeByIdAndCategory(Recipe recipe) async {
    // Get a reference to the database.
        final db = await database;


    // Query the table for the recipe with both R_Id and Cat_Id.
    final List<Map<String, Object?>> maps = await db.query(
      AppConst.recipeTableName,
      where: 'R_Id = ? AND Cat_Id = ?', // Filter by both R_Id and Cat_Id
      whereArgs: [recipe.rId, recipe.catId], // Arguments for R_Id and Cat_Id
    );

    // If no results were found, return null
    if (maps.isEmpty) {
      return null;
    }

    // Convert the first result into a Recipe object and return it.
    return recipeFromJson(maps).first;
  }



  Future<bool> hasAllDetailsForCategory(Recipe recipe) async {
    // Get a reference to the database.
        final db = await database;


    // Query the database to check if any recipe has Detail = '0' for the given category.
    final List<Map<String, Object?>> incompleteDetails = await db.query(
      AppConst.recipeTableName,
      where: 'Cat_Id = ? AND Detail = ?', // Filter condition
      whereArgs: [recipe.catId, '0'], // Arguments for the filter
    );

    // If any rows are returned, it means there is at least one recipe with Detail = '0'.
    return incompleteDetails.isEmpty;
  }

  Future<int> queryRowCount(String tableName) async {
        final db = await database;

    final results =
        await db.rawQuery('SELECT COUNT(*) FROM $tableName');
    return Sqflite.firstIntValue(results!) ?? 0;
  }

  Future<void> insertList(List<dynamic> catList,String tableName) async {
    // Get a reference to the database.
        final db = await database;

    // categoryToJson
    catList.forEach((element) async {
      await db.insert(
        tableName,
        element.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }


  Future<void> updateDetailColumn(List<dynamic> catList, String tableName) async {
        final db = await database;


    // Loop through each element in the catList and update only the 'Detail' column
    for (var element in catList) {
      // Prepare a map for the 'Detail' column only
      Map<String, dynamic> updateData = {
        'Detail': element.detail,  // Assuming the 'Detail' value is stored in element.detail
      };

      // Update the 'Detail' column for the record with the given 'R_Id'
      await db.update(
        tableName,
        updateData,  // Only the 'Detail' column is updated
        where: 'R_Id = ?',  // Update based on the primary key (R_Id in this case)
        whereArgs: [element.rId],  // The primary key value (R_Id) for the specific record
      );
    }
  }


  Future<void> insertItem(dynamic item,String tableName) async {
    // Get a reference to the database.
        final db = await database;

    // categoryToJson
    await db.insert(
      tableName,
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteRecord(String tableName) async {
    // Get a reference to the database.
        final db = await database;

    return await db.delete(tableName);
  }

/* Future<int> queryRowCount() async {
    final db = await MyDatabase.myDataBase;
    final results = await db.rawQuery('SELECT COUNT(*) FROM ${AppConst.categoryTableName}');
    return Sqflite.firstIntValue(results) ?? 0;
  }


  // A method that retrieves all the dogs from the dogs table.
  Future<bool> isSpecificCategoryFound(String id) async {
    // Get a reference to the database.
    final db = await MyDatabase.myDataBase;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(AppConst.categoryTableName);

    List<Map> result = await db.rawQuery('SELECT * FROM "${AppConst.categoryTableName}" WHERE Id=?', [id]);

    // debugPrint("categoryId>$id  result=${result.isEmpty}");
    return (result.isEmpty)?false:true;

    */ /* List<Map<String,Object?>> resultw =  await db.query(AppConst.categoryTableName,where: 'Id = ?',
      whereArgs: [id],);

    debugPrint("directly from database ${maps.length}");

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return  List.generate(maps.length, (i) {
      return Category(
        id: maps[i]['Id'].toString(),
        categoryUrduName: maps[i]['CategoryName'],
        countryId: maps[i]['CountryId'],
        totalRecipeCount: maps[i]['RecipeCount'],
      );
    });
*/ /*

  }


  Future<void> deleteCategory(int id) async {
    // Get a reference to the database.
    final db = await MyDatabase.myDataBase;

    // Remove the Dog from the database.

    await db.delete(
      AppConst.categoryTableName,
      // Use a `where` clause to delete a specific dog.
      where: 'Id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );

  }*/
}

Future<Database> dataBaseCreation() async {
  sqfliteFfiInit();
  WidgetsFlutterBinding.ensureInitialized();
  return openDatabase(
    join(await getDatabasesPath(), 'recipes.db'),
    onCreate: (db, version) async {
     await db.execute(
        'CREATE TABLE ${AppConst.categoryTableName}(Id INTEGER PRIMARY KEY, CategoryName TEXT, CountryId TEXT, RecipeCount TEXT)'
      );
     /*await db.execute(
       'CREATE TABLE ${AppConst.recipeTableName}(R_Id INTEGER PRIMARY KEY, Con_Id TEXT, Cat_Id TEXT, RecipyName TEXT,  Popular TEXT, EnglishName TEXT, EngUrduName TEXT, EngCategoryNameAdvance TEXT, Detail TEXT DEFAULT "0", CategoryName TEXT)'
     );*/
     await db.execute(
         "CREATE TABLE ${AppConst.recipeTableName}("
             "R_Id INTEGER PRIMARY KEY, "
             "Con_Id TEXT, "
             "Cat_Id TEXT, "
             "RecipyName TEXT, "
             "Popular TEXT, "
             "EnglishName TEXT, "
             "EngUrduName TEXT, "
             "EngCategoryNameAdvance TEXT, "
             "Detail TEXT DEFAULT '0', "
             "CategoryName TEXT)"
     );

    },
    version: 1,
  );
  //

}
