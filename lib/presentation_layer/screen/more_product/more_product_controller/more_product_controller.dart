import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/get_product_home.dart';
import 'package:pisti/domain_layer/models/product_models.dart';

class MoreProductController extends GetxController {
  int page = 0;
  ProductModels? productModels;
  ProductModels? productModelsload;

  bool isFirstLoadRunning = false;
  bool hasNextPage = true;
  bool isLoadMoreRunning = false;

  void _loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        controller.position.extentAfter < 300) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom
      update();

      page += 1; // Increase page by 1

      try {
        var response = await getProductOfCatogeryRespon(Get.arguments[0], page);
        productModelsload = await ProductModels.fromJson(response);
        ;

        if (productModelsload!.data!.isNotEmpty) {
          productModels!.data!.addAll(productModelsload!.data!);
          update();
        } else {
          hasNextPage = false;
          update();
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      isLoadMoreRunning = false;
      update();
    }
    update();
  }

  void firstLoad() async {
    isFirstLoadRunning = true;
    update();

    var response = await getProductOfCatogeryRespon(Get.arguments[0], 1);
    productModels = await ProductModels.fromJson(response);
    update();
    isFirstLoadRunning = false;
    update();
    return response;
  }

  late ScrollController controller;
  @override
  void onInit() {
    firstLoad();
    update();
    controller = ScrollController()..addListener(_loadMore);
    super.onInit();
  }
}
