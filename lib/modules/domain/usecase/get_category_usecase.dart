import 'package:clean_arch_example/core/error/failure.dart';
import 'package:clean_arch_example/core/usecase/base_usecase.dart';
import 'package:clean_arch_example/modules/domain/entities/category.dart';
import 'package:clean_arch_example/modules/domain/repositories/base_category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CategoryUseCase extends BaseUseCase<CategoriesEntities,NoParameters> {
  final BaseCategoryRepository baseCategoryRepository;

  CategoryUseCase(this.baseCategoryRepository);

  @override
  Future<Either<Failure, CategoriesEntities>> call(NoParameters parameters) async {
    return await baseCategoryRepository.getCategoryData();
  }
}