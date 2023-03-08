import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/resources/routes_pages.dart';
import 'package:pisti/presentation_layer/resources/theme_manager.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      getPages: getPage,
      home: MyHomePage(title: 'title'),
    );
  }
}
