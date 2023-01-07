import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

getAdressScreenRespon(int userId) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.getaddress}/$userId',
  );
  print(respons);
  return respons;
}
