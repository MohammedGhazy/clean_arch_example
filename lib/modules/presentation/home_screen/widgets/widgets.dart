import 'package:clean_arch_example/core/utils/enums.dart';
import 'package:clean_arch_example/modules/domain/entities/category.dart';
import 'package:clean_arch_example/modules/domain/entities/product.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/bloc.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/event.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

Widget buildCategoryListItem({
  required CategoryData model,
  required BuildContext context,
  required int index,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        BlocProvider.of<CategoriesBloc>(context)
            .add(ChangeSelectedIndexEvent(selectedIndex: index));

        /// to get products...
        CategoriesBloc.get(context).add(GetProductsEvent(model.id ?? 44));
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: CategoriesBloc.get(context).state.selectedIndexValue == index
              ? Colors.indigo
              : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Center(
            child: Text(
          model.name ?? "no data",
          style: TextStyle(
            color: CategoriesBloc.get(context).state.selectedIndexValue == index
                ? Colors.white
                : Colors.black,
          ),
        )),
      ),
    ),
  );
}

Widget buildProductListItem({required ProductDataItems model}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: model.image,
                  height: 140,
                  width: 140,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                if (model.discount != 0)
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      width: 80,
                      height: 20,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          "DISCOUNT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${model.price} LE",
                        ),
                        if (model.discount != 0)
                          Text(
                            "${model.oldPrice} LE",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
  );
}

Widget buildCategoryList() {
  return BlocBuilder<CategoriesBloc, CategoriesStates>(
    builder: (context, state) {
      switch (state.categoryState) {
        case RequestState.loading:
          return const SizedBox(
            height: 60,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case RequestState.loaded:
          return SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
                itemCount: state.categories?.data!.data.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if(state.selectedIndexValue == 0) {
                    CategoriesBloc.get(context).add(
                      GetProductsEvent(
                          state.categories!.data!.data[0].id!
                      )
                    );
                  }
                  return buildCategoryListItem(
                      model: state.categories!.data!.data[index],
                      index: index,
                      context: context);
                }),
          );
        case RequestState.error:
          return Center(
            child: Text(state.categoryMessage),
          );
      }
    },
  );
}

Widget buildProductList() {
  return BlocBuilder<CategoriesBloc, CategoriesStates>(
    builder: (context, state) {
      switch (state.productsState) {
        case RequestState.loading:
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case RequestState.loaded:
          return Expanded(
            child: ListView.builder(
                itemCount: state.products?.productData?.productDataItems.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildProductListItem(
                      model:
                          state.products!.productData!.productDataItems[index]);
                }),
          );
        case RequestState.error:
          return Center(
            child: Text(state.categoryMessage),
          );
      }
    },
  );
}
