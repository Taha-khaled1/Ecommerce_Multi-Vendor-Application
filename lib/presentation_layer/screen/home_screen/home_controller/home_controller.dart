import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/get_catogery.dart';
import 'package:pisti/data_layer/function_resbon.dart/get_product_home.dart';
import 'package:pisti/domain_layer/models/catogery_models.dart';
import 'package:pisti/domain_layer/models/product_models.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_controller/login_controller.dart';

class HomeController extends GetxController {
  CatogeryModels? catogeryModels;
  ProductModels? productModels;
  ProductModels? productModelsone;
  ProductModels? productModelstow;
  getAllcatogery() async {
    try {
      var response = await getAllcatogeryRespon();
      catogeryModels = await CatogeryModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
    }
  }

  getAllTopProduct() async {
    try {
      var response = await getAllTopProductRespon();
      productModels = await ProductModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
    }
  }

  getConstantProductHomeone(int idCato, int idPage) async {
    try {
      var response = await getProductOfCatogeryRespon(idCato, idPage);
      productModelsone = await ProductModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return error;
    }
  }

  getConstantProductHomeTow(int idCato, int idPage) async {
    try {
      var response = await getProductOfCatogeryRespon(idCato, idPage);
      productModelstow = await ProductModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return error;
    }
  }

  StatusRequest statusRequest = StatusRequest.none;
  addFavorit(int userId, int productId) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await favoritRespon(userId, productId);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        statusRequest = StatusRequest.none;
        customSnackBar(respon['message']);
      } else {
        customSnackBar('الحساب غير موجود');
      }
    } catch (e) {
      print('catch $e');
      customSnackBar(respon['message']);
    }
    update();
  }
}
