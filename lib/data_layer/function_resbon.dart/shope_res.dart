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
    myheadersres: myheaders3,
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
    myheadersres: myheaders2,
    encode: true,
  );
  return respons;
}
