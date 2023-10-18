import 'package:clean_arch_example/modules/data/data_source/category_data_source.dart';
import 'package:clean_arch_example/modules/data/repositories/category_repository.dart';
import 'package:clean_arch_example/modules/domain/repositories/base_category_repository.dart';
import 'package:clean_arch_example/modules/domain/usecase/get_category_usecase.dart';
import 'package:clean_arch_example/modules/domain/usecase/get_products_usecase.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// BLOC
    sl.registerFactory(() => CategoriesBloc(sl(),sl()));

    /// USE CASES
    sl.registerLazySingleton(() => CategoryUseCase(sl()));
    sl.registerLazySingleton(() => ProductsUseCase(sl()));
    /// REPOSITORY
    sl.registerLazySingleton<BaseCategoryRepository>(() => CategoryRepository(sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseCategoryDataSource>(() => CategoryDataSource());
  }
}
