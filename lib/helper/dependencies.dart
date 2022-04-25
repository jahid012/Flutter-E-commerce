import 'package:bcommerce/controllers/cart_controller.dart';
import 'package:bcommerce/controllers/popular_product_controller.dart';
import 'package:bcommerce/controllers/recommended_product_controller.dart';
import 'package:bcommerce/data/api/api_client.dart';
import 'package:bcommerce/data/repository/cart_repo.dart';
import 'package:bcommerce/data/repository/popular_product_repo.dart';
import 'package:bcommerce/data/repository/recommended_product_repo.dart';
import 'package:bcommerce/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
