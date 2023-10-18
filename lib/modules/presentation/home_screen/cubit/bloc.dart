import 'dart:async';

import 'package:clean_arch_example/core/usecase/base_usecase.dart';
import 'package:clean_arch_example/core/utils/enums.dart';
import 'package:clean_arch_example/modules/domain/usecase/get_category_usecase.dart';
import 'package:clean_arch_example/modules/domain/usecase/get_products_usecase.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/event.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
  final CategoryUseCase categoryUseCase;
  final ProductsUseCase productUseCase;

  CategoriesBloc(this.categoryUseCase, this.productUseCase)
      : super(const CategoriesStates()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetProductsEvent>(_getProducts);
    on<ChangeSelectedIndexEvent>(changeSelectedIndex);
  }

  static CategoriesBloc get(context) => BlocProvider.of(context);

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<CategoriesStates> emit) async {
    final result = await categoryUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              categoryState: RequestState.error,
              categoryMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              categories: r,
              categoryState: RequestState.loaded,
            )));
    if (state.selectedIndexValue == 0) {
      print(state.categories!.data!.data[0].id!.toString());
    }
  }

  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<CategoriesStates> emit) async {
    final result = await productUseCase(
      ProductParameters(categoryId: event.categoryId),
    );
    result.fold(
        (l) => emit(state.copyWith(
              productsState: RequestState.error,
              productsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              products: r,
              productsState: RequestState.loaded,
            )));
  }

  FutureOr<void> changeSelectedIndex(
      ChangeSelectedIndexEvent event, Emitter<CategoriesStates> emit) {
    emit(state.copyWith(
      selectedIndexValue: event.selectedIndex,
    ));
  }
}
