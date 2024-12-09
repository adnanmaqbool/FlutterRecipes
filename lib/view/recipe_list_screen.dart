import 'package:flut_api/model/recipes/Recipe.dart';
import 'package:flut_api/view/recipe_detail.dart';
import 'package:flut_api/view_model/recipe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeListScreen extends StatefulWidget {
  final int catId;

  RecipeListScreen({super.key, required this.catId});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  late int catId;
  late RecipeViewModel recipeVM;
  List<Recipe> _recipeList = <Recipe>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Access catId after the widget is built

    catId = widget.catId; // get value from the constructor way , getIntent

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      recipeVM = Provider.of<RecipeViewModel>(context, listen: false);
      await recipeVM.callRecipeList(catId);
      _recipeList = recipeVM.getRecipeList();

    });

  }

  @override
  Widget build(BuildContext context) {
    recipeVM = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            const Text("Recipes List"),
            Expanded(
              child: SizedBox(
                height: double.infinity,
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
                        : ListView.builder(
                            itemCount: _recipeList.length,
                            itemBuilder: (context, index) {
                              return Material(
                                elevation: 20.0,
                                shadowColor: Colors.blueGrey,
                                child: ListTile(
                                  onTap: () {
                                    _showRecipeDetailBottomSheet(
                                        _recipeList[index]);
                                  },
                                  leading: Text(
                                      "${_recipeList[index].rId.toString()}-${_recipeList[index].categoryName.toString()}"),
                                  trailing: Text(recipeVM
                                      .getRecipeList()[index]
                                      .recipyName
                                      .toString()),
                                ),
                              );
                            }),
              ),
            ),
            Row(children: [
              OutlinedButton(
                onPressed: () {
                  recipeVM.callRecipeList(catId);
                },
                child: Text(_recipeList.isEmpty
                    ? "Get Recipe List"
                    : "Found Recipe List"),
              ),
              OutlinedButton(
                onPressed: () {
                  recipeVM.clearRecipeList();
                },
                child: Text(_recipeList.isEmpty
                    ? "Nothing to delete"
                    : "Delete Recipe List"),
              )
            ])
          ],
        )),
      ),
    );
  }

  Future<void> _showRecipeDetailBottomSheet(Recipe recipe) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => RecipeDetail(
        recipe: recipe, // Pass the loaded recipe detail
      ),
    );
  }
}
