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

favoritRespon(int userId, int productId) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.wishlists,
    {
      'user_id': userId,
      'product_id': productId,
    },
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}
