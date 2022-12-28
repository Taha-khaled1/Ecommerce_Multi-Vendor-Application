import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

getAllTopProductRespon(int userId) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.counters}/$userId',
  );
  return respons;
}
