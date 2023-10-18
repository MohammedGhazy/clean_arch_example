import 'package:clean_arch_example/core/error/exceptions.dart';
import 'package:clean_arch_example/core/network/api_constants.dart';
import 'package:clean_arch_example/core/network/error_message_model.dart';
import 'package:clean_arch_example/modules/data/model/category_model.dart';
import 'package:clean_arch_example/modules/data/model/product_model.dart';
import 'package:clean_arch_example/modules/domain/usecase/get_products_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseCategoryDataSource {
  Future<CategoriesModel> getCategoryData();

  Future<ProductModel> getProductsData(ProductParameters parameters);
}

class CategoryDataSource extends BaseCategoryDataSource {
  @override
  Future<CategoriesModel> getCategoryData() async {
    final response = await Dio()
        .get("${ApiConstants.baseURL}${ApiConstants.GET_CATEGORIES}");
    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductModel> getProductsData(ProductParameters parameters) async {
    final response = await Dio().get(
        "${ApiConstants.baseURL}${ApiConstants.GET_CATEGORY_PRODUCTS}${parameters.categoryId}");
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
