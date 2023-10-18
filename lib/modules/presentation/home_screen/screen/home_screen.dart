import 'package:clean_arch_example/core/services/service_locator.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/bloc.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/cubit/event.dart';
import 'package:clean_arch_example/modules/presentation/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesBloc>()
        ..add(GetCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            buildCategoryList(),
            buildProductList(),
          ],
        ),
      ),
    );
  }
}
