import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final bool status;
  final String? message;
  final ProductData? productData;

  const Product({required this.status, this.message, this.productData});

  @override
  List<Object?> get props => [status, message, productData];
}

class ProductData extends Equatable {
  final List<ProductDataItems> productDataItems;

  const ProductData({required this.productDataItems});

  @override
  List<Object?> get props => [productDataItems];
}

class ProductDataItems extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final int discount;
  final String image;
  final String name;

  const ProductDataItems({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
      ];
}
