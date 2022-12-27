import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

getAllTopProductRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.bestseller,
  );
  return respons;
}

getProductOfCatogeryRespon(int idCato, int idPage) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.products}/$idCato?page=$idPage',
  );
  return respons;
}
