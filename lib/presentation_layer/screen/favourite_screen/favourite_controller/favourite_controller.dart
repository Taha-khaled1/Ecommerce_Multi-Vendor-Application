import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/domain_layer/models/favorite_models.dart';

class FavouriteController extends GetxController {
  FavoriteModels? favoriteModels;

  getFavorit(int userId) async {
    try {
      var response = await getFavoriteProductRes(userId);
      favoriteModels = await FavoriteModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
  }
}
