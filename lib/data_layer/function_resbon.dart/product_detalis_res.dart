// ignore_for_file: file_names
import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

getProductDetalisRespon(int idproduct) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.productdetalis}/$idproduct',
  );
  print(respons);
  return respons;
}
