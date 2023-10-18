import 'package:clean_arch_example/core/error/failure.dart';
import 'package:clean_arch_example/modules/domain/entities/category.dart';
import 'package:clean_arch_example/modules/domain/entities/product.dart';
import 'package:clean_arch_example/modules/domain/usecase/get_products_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCategoryRepository {
  Future<Either<Failure,CategoriesEntities>> getCategoryData();
  Future<Either<Failure,Product>> getProducts(ProductParameters parameters);
}