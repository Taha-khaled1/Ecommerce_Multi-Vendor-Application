import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/data_layer/database/connectSqlflite.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';

class AddressController extends GetxController {
  String? city, country, post, phone;

  List<AdressModel> aresslist = [];
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  void addadress(BuildContext context) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();

      try {
        int respons = await sqlDb!.insertData(
          '''
       INSERT INTO adress
       (country,city,phone,postal_code)
       VALUES
      ('$country','$city','$phone','$post') ''',
        );
        Get.back();
        Get.back();
        showDilog(context, 'تم اضافة العنوان بنجاح');
      } catch (e) {
        print(e);
      }
    }
  }
}

class AdressModel {
  final String country;
  final String city;
  final String phone;
  final String postal_code;

  AdressModel({
    required this.country,
    required this.city,
    required this.phone,
    required this.postal_code,
  });
}
