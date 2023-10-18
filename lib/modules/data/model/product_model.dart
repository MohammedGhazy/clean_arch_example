import 'package:clean_arch_example/modules/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.status,
    super.message,
    super.productData,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
          status: json["status"],
          message: json["message"],
          productData: ProductDataModel.fromJson(json["data"])
      );
}

class ProductDataModel extends ProductData {
  const ProductDataModel({required super.productDataItems,});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
          productDataItems: List<ProductDataItemModel>.from(
            json["data"].map((e) => ProductDataItemModel.fromJson(e),),)
      );
}

class ProductDataItemModel extends ProductDataItems {
  const ProductDataItemModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
  });

  factory ProductDataItemModel.fromJson(Map<String, dynamic> json) =>
      ProductDataItemModel(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
      );

}
