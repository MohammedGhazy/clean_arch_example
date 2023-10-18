import 'dart:math';

import 'package:clean_arch_example/modules/domain/entities/category.dart';

class CategoriesModel extends CategoriesEntities {
  CategoriesModel({
    required super.status,
    super.data,
    super.message,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
          status: json['status'],
          message: json['message'],
          data: json['data'] != null
              ? CategoriesDataModel.fromJson(json['data'])
              : null);
}

class CategoriesDataModel extends CategoriesDataEntities {
  CategoriesDataModel({required super.data});

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataModel(
      data: List<CategoriesDataPropertiesModel>.from(
        json["data"].map(
          (e) => CategoriesDataPropertiesModel.fromJson(e),
        ),
      ),
    );
  }
}

class CategoriesDataPropertiesModel extends CategoryData {
  CategoriesDataPropertiesModel({super.id, super.name, super.image});

  factory CategoriesDataPropertiesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDataPropertiesModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}
