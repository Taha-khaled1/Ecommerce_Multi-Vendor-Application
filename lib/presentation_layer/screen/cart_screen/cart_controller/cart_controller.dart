import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/domain_layer/models/cart_list_models.dart';

class CartController extends GetxController {
  CartListModels? cartController;

  getCounters(int idCato) async {
    try {
      var response = await getCartListRes(idCato);
      cartController = await CartListModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
  }
}
