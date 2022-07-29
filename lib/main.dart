import 'package:flutter/material.dart';
import 'package:shop/pages/product_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (ctx) => ProductOverviewPage(),
      },
    );
  }
}
