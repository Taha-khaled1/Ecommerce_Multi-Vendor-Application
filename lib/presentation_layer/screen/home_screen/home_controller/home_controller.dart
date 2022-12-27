import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/get_catogery.dart';
import 'package:pisti/data_layer/function_resbon.dart/get_product_home.dart';
import 'package:pisti/domain_layer/models/catogery_models.dart';
import 'package:pisti/domain_layer/models/product_models.dart';

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
}
