import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/product_detalis_res.dart';
import 'package:pisti/domain_layer/models/product_detalis_models.dart';

class ProductDetalisController extends GetxController {
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

  //
}
