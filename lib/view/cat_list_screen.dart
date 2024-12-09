import 'package:flut_api/data/databases/MyDataBase.dart';
import 'package:flut_api/utils/Utils.dart';
import 'package:flut_api/view/recipe_list_screen.dart';
import 'package:flut_api/view/routes/RoutesName.dart';
import 'package:flut_api/view_model/category_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialog/dialog_helper.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final catVM = Provider.of<CategoryViewModel>(context);
    //
    return WillPopScope(
      onWillPop: () async {
        // Confirm if the dialog appears on back press
        bool shouldExit =
            await DialogHelper.showExitConfirmationDialog(context);

        // Only pop if the user confirms
        return shouldExit;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 50),
                const Text("Categories List"),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: catVM.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : catVM.errorMessage.isNotEmpty
                            ? Center(
                                child: Text(
                                  catVM.errorMessage,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              )
                            : ListView.builder(
                                itemCount: catVM.getCategoryList().length,
                                itemBuilder: (context, index) {
                                  return Material(
                                    elevation: 20.0,
                                    shadowColor: Colors.blueGrey,
                                    child: ListTile(
                                      onTap: () {
                                      /*
                                        Utils.showToast(
                                            "Clicked ${catVM.getCategoryList()[index].id.toString()}");
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeListScreen(catId: 12)));
                                       */
                                        Navigator.pushNamed(
                                            context, RoutesName.recipeListRoute,
                                            arguments: {
                                              "catId": catVM
                                                  .getCategoryList()[index]
                                                  .id
                                                  .toString()
                                            });
                                      },
                                      leading: Text(
                                          "${catVM.getCategoryList()[index].id.toString()}-${catVM.getCategoryList()[index].categoryName.toString()}"),
                                      trailing: Text(catVM
                                          .getCategoryList()[index]
                                          .recipeCount
                                          .toString()),
                                    ),
                                  );
                                }),
                  ),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        catVM.callCategoryList();
                      },
                      child: const Text("Get Categories"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        catVM.clearCategoryList();
                      },
                      child: const Text("Delete Categories"),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
