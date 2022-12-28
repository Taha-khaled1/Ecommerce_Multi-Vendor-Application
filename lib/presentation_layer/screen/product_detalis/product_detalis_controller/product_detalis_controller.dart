import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/product_detalis_res.dart';
import 'package:pisti/domain_layer/models/product_detalis_models.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_controller/login_controller.dart';

class ProductDetalisController extends GetxController {
  int count = 1;
  ProductDetalisModels? productDetalisModels;
  getConstantProductDetalis(int idpro) async {
    try {
      var response = await getProductDetalisRespon(idpro);
      productDetalisModels = await ProductDetalisModels.fromJson(response);

      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 0;
    }
  }

  icrasingCount() {
    count++;
    update();
  }

  decrasingCount() {
    if (count > 1) {
      count--;
    }
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;
  addCart(String userId, String productId, String quanty,
      {bool isAlh7in = false}) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await addCartRespon(userId, productId, quanty);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        if (respon["result"].toString() == 'true') {
          statusRequest = StatusRequest.none;
          customSnackBar('تم اضافة المنتج بنجاح');
          isAlh7in ? gotoCartscreen() : null;
        } else {
          statusRequest = StatusRequest.none;
          customSnackBar(respon['message']);
        }
      } else {
        customSnackBar('يرجي تسجيل الدخول اولا');
      }
    } catch (e) {
      print('catch $e');
      customSnackBar(respon['message']);
    }
    update();
  }

  gotoCartscreen() {
    Get.toNamed(Routes.cart);
  }
}
