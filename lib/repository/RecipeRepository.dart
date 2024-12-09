import 'package:flut_api/constants/AppConst.dart';
import 'package:flut_api/data/AppUrl.dart';
import 'package:flut_api/data/databases/MyDataBase.dart';
import 'package:flut_api/data/network/base_api_services.dart';
import 'package:flut_api/data/network/network_api_services.dart';
import 'package:flut_api/model/recipes/Recipe.dart';

class RecipeRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<List<Recipe>> getRecipeList(categoryId) async {
    List<Recipe> recipeList = <Recipe>[];

    await MyDatabase()
        .getRecipeList(categoryId)
        .then((dbList) => {recipeList = dbList});
    if (recipeList.isEmpty) {
      dynamic response = await _baseApiServices.getApiResponse(
          AppUrl.allRecipeList); // getting all recipes in one go
      recipeList = recipeFromJson(response);
      await MyDatabase().insertList(recipeList, AppConst.recipeTableName);
      recipeList = await MyDatabase().getRecipeList(
          categoryId); // Because API list has all recipes, so thats why getting specific category from DB
    }

    return recipeList;
  }

  Future<Recipe?> getRecipeDetail(Recipe recipe) async {
    Map categoryMap = {
      "Cat_Id": recipe.catId,
    };

    bool isDetailAvailable =
        await MyDatabase().hasAllDetailsForCategory(recipe);
    if (!isDetailAvailable) {
      dynamic response = await _baseApiServices.postApiResponse(
          AppUrl.specificRecipeDetail,
          categoryMap); // getting all recipes in one go
      await MyDatabase().updateDetailColumn(
          recipeFromJson(response), AppConst.recipeTableName);
      return await MyDatabase().getRecipeByIdAndCategory(
          recipe); // Because API list has all recipes, so thats why getting specific category from DB
    } else {
      return await MyDatabase().getRecipeByIdAndCategory(recipe);
    }
  }

  Future<int> deleteRecipes() async {
    return await MyDatabase().deleteRecord(AppConst.recipeTableName);
  }
}
