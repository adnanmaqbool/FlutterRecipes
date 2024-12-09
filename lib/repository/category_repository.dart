import 'package:flut_api/constants/AppConst.dart';
import 'package:flut_api/data/AppUrl.dart';
import 'package:flut_api/data/databases/MyDataBase.dart';
import 'package:flut_api/data/network/base_api_services.dart';
import 'package:flut_api/data/network/network_api_services.dart';
import 'package:flutter/cupertino.dart';
import '../model/categories/Category.dart';

class CategoryRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<List<Category>> getCategoryList() async {
    // List<Category> categoryList = <Category>[];
/*
    await MyDatabase()
        .getCategoryList()
        .then((dbList) => {categoryList = dbList});*/

    List<Category> categoryList = await MyDatabase().getCategoryList();



    if (categoryList.isEmpty) {
      dynamic response =
          await _baseApiServices.getApiResponse(AppUrl.categoryList);



      // categoryList = categoryFromJson(response);

      categoryList = (response as List)
          .map((json) => Category.fromJson(json))
          .toList();


      MyDatabase().insertList(categoryList,AppConst.categoryTableName);
    }

    return categoryList;
  }

  Future<int> deleteCategories() async{
   return await MyDatabase().deleteRecord(AppConst.categoryTableName);
  }




}
