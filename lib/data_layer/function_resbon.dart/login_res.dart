// ignore_for_file: file_names
import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

getAllcatogeryRespon(String email, String pass) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(APiMange.login, {
    "email": email,
    "password": pass,
  });
  return respons;
}
