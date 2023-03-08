import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:pisti/application_layer/constant/myapp.dart';
import 'package:pisti/data_layer/database/connectSqlflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

SqlDb? sqlDb;
late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  sqlDb = SqlDb();
  runApp(
    const MyApp(),
  );
}
