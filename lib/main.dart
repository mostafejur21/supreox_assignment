import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/cart/bindings/bindings.dart';
import 'features/cart/views/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: CartBindings(),
      home: const AddToCartScreen(),
    );
  }
}
