import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

getAllCountersRes(int userId) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.counters}/$userId',
  );
  return respons;
}

getFavoriteProductRes(int userId) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.getfavorute}/$userId',
  );
  return respons;
}

getCartListRes(int userId) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    '${APiMange.gteCartList}/$userId',
    {},
    encode: true,
    myheadersres: myheaders2,
  );
  return respons;
}
