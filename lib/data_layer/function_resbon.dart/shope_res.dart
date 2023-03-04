import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

shopeRequestRespon(String name, String phone, String address) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.requestShope,
    {
      'name': name,
      'email': sharedPreferences.getString('email'),
      'phone': phone,
      'address': address,
    },
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}

contactUsRespon(String name, String message, String email) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.sendcontact,
    {
      'name': name,
      'email': email,
      'message': message,
    },
    myheadersres: Curd().myheaders2,
    encode: true,
  );
  return respons;
}

editeShopeRespon(String name, String phone, String address, String fac) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.editShope,
    {
      'name': name,
      'phone': phone,
      'facebook': fac,
      'address': address,
    },
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}

deleteFromCartRespon(int id) async {
  Curd curd = Curd();
  var respons = await curd.deleterequest(
    '${APiMange.deletecart}/$id',
    {},
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}

saveOrderRespon(String user_id) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.saveOrder,
    {"user_id": "$user_id"},
    encode: true,
    myheadersres: Curd().myheaders2,
  );
  return respons;
}
