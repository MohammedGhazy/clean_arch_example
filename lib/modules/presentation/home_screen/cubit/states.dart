import 'package:clean_arch_example/core/utils/enums.dart';
import 'package:clean_arch_example/modules/domain/entities/category.dart';
import 'package:clean_arch_example/modules/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class CategoriesStates extends Equatable {
  final CategoriesEntities? categories;
  final Product? products;
  final RequestState categoryState;
  final RequestState productsState;
  final String categoryMessage;
  final String productsMessage;
  final int? selectedIndexValue;

  const CategoriesStates({
    this.categories,
    this.products,
    this.categoryState = RequestState.loading,
    this.productsState = RequestState.loading,
    this.categoryMessage = "",
    this.productsMessage = "",
    this.selectedIndexValue = 0,
  });

  CategoriesStates copyWith({
    CategoriesEntities? categories,
    Product? products,
    RequestState? categoryState,
    RequestState? productsState,
    String? categoryMessage,
    String? productsMessage,
    int? selectedIndex,
    int? selectedIndexValue,
  }) {
    return CategoriesStates(
        categories: categories ?? this.categories,
        products: products ?? this.products,
        categoryState: categoryState ?? this.categoryState,
        productsState: productsState ?? this.productsState,
        categoryMessage: categoryMessage ?? this.categoryMessage,
        productsMessage: productsMessage ?? this.productsMessage,
        selectedIndexValue: selectedIndexValue ?? this.selectedIndexValue,
    );
  }

  @override
  List<Object?> get props =>
      [
        categories,
        products,
        categoryState,
        productsState,
        categoryMessage,
        productsMessage,
        selectedIndexValue,
      ];
}
