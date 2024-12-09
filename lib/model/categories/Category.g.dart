// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['Id'].toString(),
      categoryName: json['CategoryName'] as String?,
      countryId: json['CountryId'] as String?,
      recipeCount: json['RecipeCount'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'Id': instance.id,
      'CategoryName': instance.categoryName,
      'CountryId': instance.countryId,
      'RecipeCount': instance.recipeCount,
    };
