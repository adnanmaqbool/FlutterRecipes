// recipe_detail.dart
import 'package:flut_api/model/recipes/Recipe.dart';
import 'package:flut_api/view_model/recipe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/recipe_detail_view_model.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late Recipe recipe;
  late RecipeDetailViewModel recipeVM;

  @override
  void initState() {
    super.initState();
    recipe = widget.recipe; // get value from the constructor way , getIntent

    WidgetsBinding.instance.addPostFrameCallback((_)  async{
      recipeVM = Provider.of<RecipeDetailViewModel>(context, listen: false);
      await  recipeVM.callRecipeDetail(recipe);
      recipe = recipeVM.getRecipe();
      recipeVM.notify();

    });
  }

  @override
  Widget build(BuildContext context) {
    recipeVM = Provider.of<RecipeDetailViewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: recipeVM.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : recipeVM.errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    recipeVM.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recipe ID: ${recipe.rId}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Recipe Name: ${recipe.recipyName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      child: Text(
                        'Recipe Detail: ${recipe.detail}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    // Add more detail content here
                  ],
                ),
    );
  }
}
