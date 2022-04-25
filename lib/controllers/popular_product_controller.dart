import 'package:bcommerce/controllers/cart_controller.dart';
import 'package:bcommerce/data/repository/popular_product_repo.dart';
import 'package:bcommerce/models/products_model.dart';
import 'package:bcommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;
  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement == true) {
      _quantity = checkQuantity(_quantity + 1);
      checkQuantity(_quantity);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  checkQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar("Item Count", "Your can't reduce anymore",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if ((_inCartItem + quantity) > 20) {
      Get.snackbar("Item Count", "Your can't increase anymore",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;

    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("The item id is " +
          value.id.toString() +
          " And the quantity is " +
          value.quantity.toString());
    });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
