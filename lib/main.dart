
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_mvvm/presentation/products/products_page.dart';
import 'package:providers_mvvm/viewmodel/product_view_model.dart';
import 'package:providers_mvvm/viewmodel/products_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductViewModel()),
      ChangeNotifierProvider(create: (context) => ProductsViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductsPage(),
    );
  }
}
