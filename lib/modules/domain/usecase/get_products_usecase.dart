import 'package:clean_arch_example/core/error/failure.dart';
import 'package:clean_arch_example/core/usecase/base_usecase.dart';
import 'package:clean_arch_example/modules/domain/entities/product.dart';
import 'package:clean_arch_example/modules/domain/repositories/base_category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ProductsUseCase extends BaseUseCase<Product,ProductParameters> {
  final BaseCategoryRepository baseCategoryRepository;

  ProductsUseCase(this.baseCategoryRepository);

  @override
  Future<Either<Failure, Product>> call(ProductParameters parameters) async{
    return await baseCategoryRepository.getProducts(parameters);
  }

}

class ProductParameters extends Equatable {
  final int categoryId;

  const ProductParameters({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}