import 'package:equatable/equatable.dart';

abstract class CategoriesEvents extends Equatable{
  const CategoriesEvents();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvents {}

class GetProductsEvent extends CategoriesEvents {
  final int categoryId;

 const GetProductsEvent(this.categoryId);
}

class ChangeSelectedIndexEvent extends CategoriesEvents {
  final int selectedIndex;

  const ChangeSelectedIndexEvent({required this.selectedIndex});
}