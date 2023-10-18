import 'package:clean_arch_example/core/error/exceptions.dart';
import 'package:clean_arch_example/core/error/failure.dart';
import 'package:clean_arch_example/modules/domain/entities/category.dart';
import 'package:clean_arch_example/modules/domain/entities/product.dart';
import 'package:clean_arch_example/modules/domain/repositories/base_category_repository.dart';
import 'package:clean_arch_example/modules/domain/usecase/get_products_usecase.dart';
import 'package:dartz/dartz.dart';
import '../data_source/category_data_source.dart';

class CategoryRepository extends BaseCategoryRepository {
  final BaseCategoryDataSource baseCategoryDataSource;

  CategoryRepository(this.baseCategoryDataSource);

  @override
  Future<Either<Failure, CategoriesEntities>> getCategoryData() async {
    final result = await baseCategoryDataSource.getCategoryData();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message ?? ""));
    }
  }

  @override
  Future<Either<Failure, Product>> getProducts(
      ProductParameters parameters) async {
    final result = await baseCategoryDataSource.getProductsData(parameters);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message ?? ""));
    }
  }
}
