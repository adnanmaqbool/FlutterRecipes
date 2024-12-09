import 'dart:convert';

List<Recipe> recipeFromJson(dynamic str) {
  // final jsonData = json.decode(str);
  return List<Recipe>.from(str.map((x) => Recipe.fromJson(x)));
}

String recipeToJson(List<Recipe> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}



class Recipe {
  String? rId;
  String? conId;
  String? catId;
  String? recipyName;
  String? popular;
  String? englishName;
  String? engUrduName;
  String? engCategoryNameAdvance;
  String? categoryName;
  dynamic detail;

  Recipe({
    this.rId,
    this.conId,
    this.catId,
    this.recipyName,
    this.popular,
    this.englishName,
    this.engUrduName,
    this.engCategoryNameAdvance,
    this.categoryName,
    this.detail,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    rId: json["R_Id"].toString(),
    conId: json["Con_Id"].toString(),
    catId: json["Cat_Id"].toString(),
    recipyName: json["RecipyName"],
    popular: json["Popular"].toString(),
    englishName: json["EnglishName"],
    engUrduName: json["EngUrduName"],
    engCategoryNameAdvance: json["EngCategoryNameAdvance"],
    categoryName: json["CategoryName"],
    detail: json["Detail"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "R_Id": rId,
    "Con_Id": conId,
    "Cat_Id": catId,
    "RecipyName": recipyName,
    "Popular": popular,
    "EnglishName": englishName,
    "EngUrduName": engUrduName,
    "EngCategoryNameAdvance": engCategoryNameAdvance,
    "CategoryName": categoryName,
    "Detail": detail,
  };
}

/*
List model
{
"Cat_Id": "1",
"Con_Id": "1",
"R_Id": "1",
"RecipyName": "\ufeff \u0628\u0679\u0627\u0679\u0627 \u0648\u0691\u0627\r\n",

"Detail": 0,
"EngUrduName": "Battata Vada",
"EngCategoryNameAdvance": "Appetizer",
"CategoryName": "\u0627\u067e\u06cc\u0679\u0627\u0626\u0632\u0631"
"EnglishName": "potato fritters",
"Popular": "0",

}*/

/*
Detail model
{
"Cat_Id": "1",
"Con_Id": "1",
"R_Id": "1",
"RecipyName": "﻿ بٹاٹا وڑا\r\n",

"Detail": "﻿تيارى كا وقت : 15 منٹ\r\nپكانے كا وقت : 20 منٹ\r\n\r\nاجزا\r\nآلو آدھا کلو\r\n(ہری مرچ چار عدد ﴿باریک کٹی ہوئی\r\n(ادرک ایک چائے کا چمچ ﴿باریک کٹی ہوئی\r\n(پیاز آدھا کپ ﴿باریک کٹی ہوئی\r\n(لال مرچ آدھا چائے کا چمچ (پسی ہوئی\r\n(ہرا دھنیا چار کھانے کے چمچ ﴿باریک کٹا ہوا\r\nلیموں کا رس دو کھانے کے چمچ\r\nنمک ایک چائے کا چمچ\r\n:بیٹر کے لیے\r\nبیسن ایک کپ\r\nنمک آدھا چائے کا چمچ\r\n(لال مرچ آدھا چائے کا چمچ ﴿پسی ہوئی\r\nتیل تلنے کے لیے\r\n\r\nتركيب\r\nپہلے آلوؤں کو اُبال کر ان کے چھلکے اُتاریں اور میش کرلیں۔\r\nاب ایک پیالے میں ہری مرچ، ادرک، پیاز، پسی لال مرچ، ہرا دھنیا اور لیموں کا رس ڈال کر اچھی طرح مکس کریں اور اس کی چھوٹی چھوٹی بالز بنائیں اور رکھ دیں۔\r\nبیٹر کے لئے: ایک پیالے میں بیسن، پانی، نمک اور پسی لال مرچ ڈال کر بیٹر بنائیں اور تیار بالز کو اس میں ڈِپ کرلیں اور ڈیپ فرائی کرلیں، یہاں تک کہ وہ لائٹ گولڈن ہو جائیں۔\r\nاب انھیں تیل سے نکال کر املی اور پودینے کی چٹنی کے ساتھ گرم گرم سرو کریں۔\r\n\r\n",
"EngUrduName": "Battata Vada"
"EngCategoryNameAdvance": "Appetizer",
"CategoryName": "اپیٹائزر",

}*/
