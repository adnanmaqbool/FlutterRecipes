class AppUrl {
  static const String baseUrl = "https://reqres.in";
  static const String listUrl = "$baseUrl/api/login";

  static const String recipeBaseUrl = "https://stallionengg.com/technospart_recipe";
  static const String categoryList = "$recipeBaseUrl/urdurecepies_categories.php";

  // https://stallionengg.com/technospart_recipe/new_urdu_recepies.php // updated category list
  static const String allRecipeList = "$recipeBaseUrl/recepies_topics.php?id=0" ;// all recipe list if call without id =0 , if specific then id=cat_id

  static const String specificRecipeDetail = "$recipeBaseUrl/urdurecepies_specific_category.php" ; // post api params Cat_Id =1


// recipeList

/*  [
  {
  "R_Id": "1",
  "Con_Id": "1",
  "Cat_Id": "1",
  "RecipyName": "\\ufeff \\u0628\\u0679\\u0627\\u0679\\u0627 \\u0648\\u0691\\u0627\r\n",
  "Detail": 0,
  "Popular": "0",
  "EnglishName": "potato fritters",
  "EngUrduName": "Battata Vada",
  "EngCategoryNameAdvance": "Appetizer",
  "CategoryName": "\\u0627\\u067e\\u06cc\\u0679\\u0627\\u0626\\u0632\\u0631"
  }
  ]*/


// recipe Detail

  /*    [
  {
  "Cat_Id": "1",
  "Con_Id": "1",
  "R_Id": "1",
  "Detail": "﻿تيارى كا وقت : 15 منٹ\r\nپكانے كا وقت : 20 منٹ\r\n\r\nاجزا\r\nآلو آدھا کلو\r\n(ہری مرچ چار عدد ﴿باریک کٹی ہوئی\r\n(ادرک ایک چائے کا چمچ ﴿باریک کٹی ہوئی\r\n(پیاز آدھا کپ ﴿باریک کٹی ہوئی\r\n(لال مرچ آدھا چائے کا چمچ (پسی ہوئی\r\n(ہرا دھنیا چار کھانے کے چمچ ﴿باریک کٹا ہوا\r\nلیموں کا رس دو کھانے کے چمچ\r\nنمک ایک چائے کا چمچ\r\n:بیٹر کے لیے\r\nبیسن ایک کپ\r\nنمک آدھا چائے کا چمچ\r\n(لال مرچ آدھا چائے کا چمچ ﴿پسی ہوئی\r\nتیل تلنے کے لیے\r\n\r\nتركيب\r\nپہلے آلوؤں کو اُبال کر ان کے چھلکے اُتاریں اور میش کرلیں۔\r\nاب ایک پیالے میں ہری مرچ، ادرک، پیاز، پسی لال مرچ، ہرا دھنیا اور لیموں کا رس ڈال کر اچھی طرح مکس کریں اور اس کی چھوٹی چھوٹی بالز بنائیں اور رکھ دیں۔\r\nبیٹر کے لئے: ایک پیالے میں بیسن، پانی، نمک اور پسی لال مرچ ڈال کر بیٹر بنائیں اور تیار بالز کو اس میں ڈِپ کرلیں اور ڈیپ فرائی کرلیں، یہاں تک کہ وہ لائٹ گولڈن ہو جائیں۔\r\nاب انھیں تیل سے نکال کر املی اور پودینے کی چٹنی کے ساتھ گرم گرم سرو کریں۔\r\n\r\n",
  "RecipyName": "﻿ بٹاٹا وڑا\r\n",
  "EngCategoryNameAdvance": "Appetizer",
  "CategoryName": "اپیٹائزر",
  "EngUrduName": "Battata Vada"
  }
  ]*/
}
