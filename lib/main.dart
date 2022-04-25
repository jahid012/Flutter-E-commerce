import 'package:bcommerce/controllers/popular_product_controller.dart';
import 'package:bcommerce/controllers/recommended_product_controller.dart';
import 'package:bcommerce/helper/dependencies.dart' as dep;
import 'package:bcommerce/pages/home/main_food_page.dart';
import 'package:bcommerce/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
