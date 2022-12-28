import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/domain_layer/models/counters_models.dart';

class controlBoardController extends GetxController {
  CountersModels? countersModels;
  getCounters(int idCato) async {
    try {
      var response = await getAllCountersRes(idCato);
      countersModels = await CountersModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
  }
}
