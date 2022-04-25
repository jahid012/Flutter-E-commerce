import 'package:bcommerce/controllers/recommended_product_controller.dart';
import 'package:bcommerce/routes/routes_helper.dart';
import 'package:bcommerce/utils/app_constants.dart';
import 'package:bcommerce/utils/colors.dart';
import 'package:bcommerce/utils/dimentions.dart';
import 'package:bcommerce/widgets/app_icon.dart';
import 'package:bcommerce/widgets/big_text.dart';
import 'package:bcommerce/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimentions.radious20),
                          topRight: Radius.circular(Dimentions.radious20))),
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  width: double.maxFinite,
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimentions.font26,
                  ))),
            ),
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL +
                  AppConstants.UPLOAD_URL +
                  product.img!),
            ),
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (() {
                      Get.toNamed(RouteHelper.getInitial());
                    }),
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.only(
                left: Dimentions.width20, right: Dimentions.width20),
            child: Column(
              children: [
                Container(
                  child: ExpandableText(text: product.description!),
                ),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimentions.width20 * 2.5,
              right: Dimentions.width20 * 2.5,
              top: Dimentions.width10,
              bottom: Dimentions.width10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconSize: Dimentions.icon24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$${product.price!} " + " X " + " 0",
                  color: AppColors.mainBlackColor,
                  size: Dimentions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconSize: Dimentions.icon24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: Dimentions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimentions.height30,
                left: Dimentions.width20,
                right: Dimentions.width20,
                bottom: Dimentions.height30),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimentions.radious30),
                  topRight: Radius.circular(Dimentions.radious30),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.all(Dimentions.height20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimentions.radious20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.all(Dimentions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radious20),
                      color: AppColors.mainColor),
                  child: BigText(
                    text: "\$${product.price!}|Add to Cart",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
