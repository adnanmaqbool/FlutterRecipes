
import 'package:flut_api/model/recipes/Recipe.dart';
import 'package:flut_api/repository/RecipeRepository.dart';
import 'package:flut_api/view_model/base_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/AppConst.dart';
import '../data/exceptions/app_exceptions.dart';

class RecipeDetailViewModel extends BaseViewModel{

  final _recipeRepository = RecipeRepository();
  Recipe _recipe = Recipe();

   setRecipe(Recipe recipe) {
    _recipe = recipe;
    notifyListeners();
  }

  Recipe getRecipe() {
    return _recipe;
  }

  notify(){
    notifyListeners();

  }


  Future<void> callRecipeDetail(Recipe recipe) async {

    setLoading(true);
    clearErrorMessage();

    try {
      final recipeObject = await _recipeRepository.getRecipeDetail(recipe);
      if (kDebugMode) {
        print("recipe_detail-> $recipeObject");
      }
      setRecipe(recipeObject!);
    } catch (e) {
      setLoading(false);
      if (e is AppException) {
        setErrorMessage(e.toString());
      } else {
        setErrorMessage(AppConst.someThingWentWrong);
      }
    } finally {
      setLoading(false);
    }
    notifyListeners();

  }



}