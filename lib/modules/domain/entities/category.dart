import 'dart:math';

class CategoriesEntities {
  bool? status;
  String? message;
  CategoriesDataEntities? data;

  CategoriesEntities({required this.status, this.message, this.data});
}

class CategoriesDataEntities {
  List<CategoryData> data;

  CategoriesDataEntities({
    required this.data,
  });
}

class CategoryData {
  int? id;
  String? name;
  String? image;

  CategoryData({this.id, this.name, this.image});
}
