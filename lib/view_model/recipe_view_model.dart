
import 'package:flut_api/model/recipes/Recipe.dart';
import 'package:flut_api/repository/RecipeRepository.dart';
import 'package:flut_api/view_model/base_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/AppConst.dart';
import '../data/exceptions/app_exceptions.dart';

class RecipeViewModel extends BaseViewModel{

  final _recipeRepository = RecipeRepository();

  List<Recipe> _recipeList = <Recipe>[];
  bool isDeleted=false;

  setDeletedValue(bool delete){
    isDeleted = delete;
    notifyListeners();
  }

  getDeletedValue(){
    return isDeleted;
  }


  setRecipeList(List<Recipe> recipeList) {
    _recipeList = recipeList;
    notifyListeners();
  }

  List<Recipe> getRecipeList() {
    return _recipeList;
  }

  Future<void> callRecipeList(categoryId) async {

    setLoading(true);
    clearErrorMessage();

    try {
      final recipeList = await _recipeRepository.getRecipeList(categoryId);
      setRecipeList(recipeList);
    } catch (e) {
      if (e is AppException) {
        debugPrint('AppException: ${e.toString()}');

        setErrorMessage(e.toString());
      } else {
        debugPrint('Unknown exception: $e');
        setErrorMessage(AppConst.someThingWentWrong);
      }
    } finally {
      setLoading(false);
    }
    notifyListeners();


  }

  clearRecipeList(){
    _recipeList.clear();
    deleteAllRecipes();
    notifyListeners();
  }


  void deleteAllRecipes()  {

    _recipeRepository.deleteRecipes().then((deleted) {
      setDeletedValue  (deleted == 0) ? false : true ;
    });

  }
}