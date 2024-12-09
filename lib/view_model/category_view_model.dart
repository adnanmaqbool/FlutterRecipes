import 'package:flut_api/constants/AppConst.dart';
import 'package:flut_api/data/exceptions/app_exceptions.dart';
import 'package:flut_api/model/categories/Category.dart';
import 'package:flut_api/repository/category_repository.dart';
import 'package:flut_api/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends BaseViewModel {
  final _categoryRepository = CategoryRepository();

  List<Category> _categoryList = <Category>[];

  bool isDeleted=false;

  setDeletedValue(bool delete){
    isDeleted = delete;
    notifyListeners();
  }

  getDeletedValue(){
    return isDeleted;
  }

  setCategoryList(List<Category> categoryList) {
    _categoryList = categoryList;
    notifyListeners();
  }

  List<Category> getCategoryList() {
    return _categoryList;
  }

  clearCategoryList(){
    _categoryList.clear();
    deleteAllCategories();
    notifyListeners();
  }

  Future<void> callCategoryList() async {

    setLoading(true);
    clearErrorMessage();

    /*_categoryRepository.getCategoryList().then((catList) {
      setCategoryList(catList);
    });*/

    try {
      final catList = await _categoryRepository.getCategoryList();
      setCategoryList(catList);
    } catch (e) {
      if (e is AppException) {
        setErrorMessage(e.toString());
        debugPrint("AppException: $e");
      } else {
        setErrorMessage(AppConst.someThingWentWrong);
        debugPrint("AppException: $e");

      }
    } finally {
      setLoading(false);
    }

    notifyListeners();

  }

   void deleteAllCategories()  {

    _categoryRepository.deleteCategories().then((deleted) {
      setDeletedValue  (deleted == 0) ? false : true ;
    });

  }
}
