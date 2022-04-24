import 'package:get/get.dart';

class Dimentions {
  //width 360 height 756
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.36;
  static double pageViewContainer = screenHeight / 3.43;
  static double pageViewTextContainer = screenHeight / 6.3;

  //dynamic height for padding and margin
  static double height5 = screenHeight / 151.2;
  static double height10 = screenHeight / 75.6;
  static double height15 = screenHeight / 50.4;
  static double height20 = screenHeight / 37.8;
  static double height30 = screenHeight / 25.2;
  static double height45 = screenHeight / 16.8;

  //dynamic width for padding and margin
  static double width5 = screenHeight / 151.2;
  static double width10 = screenHeight / 75.6;
  static double width15 = screenHeight / 50.4;
  static double width20 = screenHeight / 37.8;
  static double width30 = screenHeight / 25.2;
  static double width45 = screenHeight / 16.8;

  //font size
  static double font16 = screenHeight / 47.25;
  static double font20 = screenHeight / 37.8;
  static double font26 = screenHeight / 29.07;

  static double radious15 = screenHeight / 50.4;
  static double radious20 = screenHeight / 37.8;
  static double radious30 = screenHeight / 25.2;

  //dynamic size for icons
  static double icon24 = screenHeight / 31.5;
  static double icon16 = screenHeight / 47.25;

  //list view size
  static double listViewimgSize = screenWidth / 3.6;
  static double listViewTextContSize = screenWidth / 3.6;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.16;

  //bottom height bar
  static double bottomHeightBar = screenHeight / 6.3;
}
