import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import '../../../main.dart';

class Midelware extends GetMiddleware {
  @override
  // ignore: overridden_fields
  final int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences.getString('step').toString() == '2'.toString()) {
      return RouteSettings(name: Routes.homeRoute);
    }
    if (sharedPreferences.getString('step').toString() == '1'.toString()) {
      return RouteSettings(name: Routes.loginRoute);
    }
    return null;
  }
}
