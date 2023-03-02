import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

getAllCountersRes(int userId) async {
  Curd curd = Curd();
  print('$userId |||  ${Curd().myheaders2}');
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
    myheadersres: Curd().myheaders2,
  );
  return respons;
}

getAddressRes(int userId) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    '${APiMange.gteAddressuser}/$userId',
    {},
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}

cahngeProfileRes(String name, String phone) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.updatepro,
    {
      "name": name,
      "phone": phone,
      "email": "${sharedPreferences.getString('email')}",
    },
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}

sendRequset(String name, String phone, String address) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.updatepro,
    {
      "name": name,
      "phone": phone,
      "address": address,
      "email": "${sharedPreferences.getString('email')}",
    },
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}
