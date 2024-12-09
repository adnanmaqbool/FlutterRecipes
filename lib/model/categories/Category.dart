/*class Category {
  String? id;
  String? categoryName;
  String? countryId;
  String? recipeCount;

  Category({this.id, this.categoryName, this.countryId, this.recipeCount});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    categoryName = json['CategoryName'];
    countryId = json['CountryId'];
    recipeCount = json['RecipeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['CategoryName'] = this.categoryName;
    data['CountryId'] = this.countryId;
    data['RecipeCount'] = this.recipeCount;
    return data;
  }
}*/
/*class Category {
  Category({
      this.id,
      this.categoryName, 
      this.countryId, 
      this.recipeCount,});

  String? id;
  String? categoryName;
  String? countryId;
  String? recipeCount;

  Category.fromJson(dynamic json) {
    id = json[0]['Id'] ;
    categoryName = json[0]['CategoryName'];
    countryId = json[0]['CountryId'];
    recipeCount = json[0]['RecipeCount'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['Id'] = id;
    map['CategoryName'] = categoryName;
    map['CountryId'] = countryId;
    map['RecipeCount'] = recipeCount;
    return map;
  }

}*/
import 'dart:convert';

/*List<Category> categoryFromJson(dynamic str) {
  // final jsonData = json.decode(str);
  return List<Category>.from(str.map((x) => Category.fromJson(x)));
}

String categoryToJson(List<Category> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Category {
  String? id;
  String? categoryName;
  String? countryId;
  String? recipeCount;

  Category({
    this.id,
    this.categoryName,
    this.countryId,
    this.recipeCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["Id"].toString(),
        categoryName: json["CategoryName"],
        countryId: json["CountryId"],
        recipeCount: json["RecipeCount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryName": categoryName,
        "CountryId": countryId,
        "RecipeCount": recipeCount,
      };
}*/

import 'package:json_annotation/json_annotation.dart';
part 'Category.g.dart';  // Ensure this part directive is included


@JsonSerializable()  // Marking the class for JSON serialization
class Category {
  @JsonKey(name: 'Id')
  String? id;

  @JsonKey(name: 'CategoryName')
  String? categoryName;

  @JsonKey(name: 'CountryId')
  String? countryId;

  @JsonKey(name: 'RecipeCount')
  String? recipeCount;

  Category({
    this.id,
    this.categoryName,
    this.countryId,
    this.recipeCount,
  });

  // From JSON constructor
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  // To JSON method
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

