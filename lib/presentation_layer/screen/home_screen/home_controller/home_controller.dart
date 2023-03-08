import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/get_catogery.dart';
import 'package:pisti/data_layer/function_resbon.dart/get_product_home.dart';
import 'package:pisti/domain_layer/models/catogery_models.dart';
import 'package:pisti/domain_layer/models/product_models.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_controller/login_controller.dart';

class HomeController extends GetxController {
  CatogeryModels? catogeryModels;
  ProductModels? productModels;
  ProductModels? productModelsone;
  ProductModels? productModelstow;

  late StatusRequest statusRequest1;
  getAllcatogery() async {
    try {
      statusRequest1 = StatusRequest.loading;
      var response = await getAllcatogeryRespon();
      statusRequest1 = handlingData(response);
      if (statusRequest1 == StatusRequest.success) {
        print('----------------------------------');
        catogeryModels = await CatogeryModels.fromJson(response);
      } else {
        statusRequest1 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest1 = StatusRequest.erorr;
    }
    update();
  }

  late StatusRequest statusRequest2;
  getAllTopProduct() async {
    try {
      statusRequest2 = StatusRequest.loading;
      var response = await getAllTopProductRespon();
      statusRequest2 = handlingData(response);
      if (statusRequest2 == StatusRequest.success) {
        print('----------------------------------');
        productModels = await ProductModels.fromJson(response);
      } else {
        statusRequest2 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest2 = StatusRequest.erorr;
    }
    update();
  }

  late StatusRequest statusRequest3;
  getConstantProductHomeone(int idCato, int idPage) async {
    try {
      statusRequest3 = StatusRequest.loading;
      var response = await getProductOfCatogeryRespon(idCato, idPage);
      statusRequest3 = handlingData(response);
      if (statusRequest3 == StatusRequest.success) {
        print('----------------------------------');
        productModelsone = await ProductModels.fromJson(response);
      } else {
        statusRequest3 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest3 = StatusRequest.erorr;
    }
    update();
  }

  late StatusRequest statusRequest4;
  getConstantProductHomeTow(int idCato, int idPage) async {
    try {
      statusRequest4 = StatusRequest.loading;
      var response = await getProductOfCatogeryRespon(idCato, idPage);
      statusRequest4 = handlingData(response);
      if (statusRequest4 == StatusRequest.success) {
        print('----------------------------------');
        productModelstow = await ProductModels.fromJson(response);
      } else {
        statusRequest4 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest4 = StatusRequest.erorr;
    }
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;
  addFavorit(int userId, int productId, BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await favoritRespon(userId, productId);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        statusRequest = StatusRequest.none;
        showDilog(context, 'تم اضافة الي المفضلات بنجاح');
      } else {
        customSnackBar('الحساب غير موجود');
      }
    } catch (e) {
      print('catch $e');
      customSnackBar(respon['message']);
    }
    update();
  }

  @override
  void onInit() {
    getAllcatogery();
    getAllTopProduct();
    getConstantProductHomeone(15, 1);
    getConstantProductHomeTow(6, 1);
    super.onInit();
  }
}
