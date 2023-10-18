import 'package:clean_arch_example/modules/presentation/home_screen/cubit/bloc.dart';
import 'package:flutter/material.dart';

import 'core/services/service_locator.dart';
import 'modules/presentation/home_screen/screen/home_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen()
    );
  }
}