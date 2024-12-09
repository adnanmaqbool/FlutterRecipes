import 'package:flut_api/view/cat_list_screen.dart';
import 'package:flut_api/view/recipe_list_screen.dart';
import 'package:flut_api/view/routes/Routes.dart';
import 'package:flut_api/view/routes/RoutesName.dart';
import 'package:flut_api/view/splash_screen.dart';
import 'package:flut_api/view_model/api_view_model.dart';
import 'package:flut_api/view_model/category_view_model.dart';
import 'package:flut_api/view_model/recipe_detail_view_model.dart';
import 'package:flut_api/view_model/recipe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import 'package:flutter/material.dart';

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Grid View')),
        body: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns for smaller items
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          childrenDelegate: SliverChildListDelegate(
            [
              // Full-width item (spans both columns)
              GridTile(
                child: Container(
                  color: Colors.brown,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('1', style: TextStyle(fontSize: 24, color: Colors.white)),
                        Text('item', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              // Two items in the second row
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('2', style: TextStyle(fontSize: 24, color: Colors.white)),
                      Text('item', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('3', style: TextStyle(fontSize: 24, color: Colors.white)),
                      Text('item', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              // Two items in the third row
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('4', style: TextStyle(fontSize: 24, color: Colors.white)),
                      Text('item', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('5', style: TextStyle(fontSize: 24, color: Colors.white)),
                      Text('item', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}*/


void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => RecipeViewModel()),
        ChangeNotifierProvider(create: (_) => RecipeDetailViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: RoutesName.splashRoute,
        routes: {
          RoutesName.splashRoute: (context) => SplashScreen(),
          // When navigating to the "/" route, build the FirstScreen widget.
          RoutesName.catListRoute: (context) => CatListScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          RoutesName.recipeListRoute: (context) =>  RecipeListScreen(catId: 0),
        },
        onGenerateRoute: (settings) {
          if (settings.name == RoutesName.recipeListRoute) {
            final args = settings.arguments as Map<String, dynamic>;
            final catId = int.parse(args["catId"]);
            return MaterialPageRoute(
              builder: (context) => RecipeListScreen(catId: catId),
            );
          }
          // Return null if the route is not found
          return null;
        },
      ),
    );
  }
}

// onGenerateRoute: Routes.generateRoutes,


