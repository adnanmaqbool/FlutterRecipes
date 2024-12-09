import 'dart:async';

import 'package:flut_api/view/cat_list_screen.dart';
import 'package:flut_api/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {
  dynamic catVM;

  @override
  void initState() {
    // TODO: implement initState


    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_) async {
      catVM = Provider.of<CategoryViewModel>(context, listen: false);
      await catVM.callCategoryList();
      Timer(
          const Duration(seconds: 2),
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const CatListScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    catVM = Provider.of<CategoryViewModel>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.greenAccent,
          body: Center(
        child: catVM.isLoading
            ? CircularProgressIndicator()
            : Container(),
      )
    );
  }

}
