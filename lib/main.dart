import 'package:flutter/material.dart';
import 'package:store_app/view/home_view.dart';
import 'package:store_app/view/update_product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.id,
      routes: {
        HomeView.id : (context) => const HomeView(),
        UpdateProductView.id : (context) => const UpdateProductView(),
      },
    );
  }
}
