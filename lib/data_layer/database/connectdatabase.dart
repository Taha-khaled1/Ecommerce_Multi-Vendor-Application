// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:pisti/application_layer/ShardFunction/checkenternet.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/main.dart';
// headers: <String, String>{'Content-Type': 'application/json'},
// String _basicAuth = 'Basic ${base64Encode(utf8.encode('wael:wael1'))}';

class Curd {
  Map<String, String> myheaders = {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };
  Map<String, String> myheaders2 = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${sharedPreferences.getString('access_token').toString()}',
  };

  Map<String, String> myheaders3 = {
    'Authorization':
        'Bearer ${sharedPreferences.getString('access_token').toString()}',
  };
  getrequest(String url) async {
    try {
      Response respos = await http.get(Uri.parse(url), headers: myheaders3);
      print('============');
      print(respos.body);
      print(respos.statusCode);
      print('============');
      if (respos.statusCode == 200 || respos.statusCode == 201) {
        dynamic body = jsonDecode(respos.body);
        print(' body :  $body');
        return body;
      } else {
        print('erorr');
      }
    } catch (e) {
      // ignore: avoid_print
      print('$e');
    }
  }

  deleterequest(String url, Map data,
      {bool? encode, Map<String, String>? myheadersres}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.delete(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheadersres,
        );
        print(respos.body);
        print(respos.statusCode);
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print('serverfailure');
          return StatusRequest.none;
        }
      } else {
        print('offline');
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('Catch : $e');
      return StatusRequest.serverfailure;
    }
  }

  postrequest(String url, Map data,
      {bool? encode, Map<String, String>? myheadersres}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.post(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheadersres,
        );
        print(respos.body);
        print(respos.statusCode);
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print('serverfailure');
          return StatusRequest.none;
        }
      } else {
        print('offline');
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('Catch : $e');
      return StatusRequest.serverfailure;
    }
  }

  putrequest(String url, Map data, {bool? encode}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.put(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheaders2,
        );
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print(respos.body);
          return StatusRequest.serverfailure;
        }
      } else {
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('ERorr $e');
      return StatusRequest.erorr;
    }
  }

  putrequestforFile(
    String url,
    Map data,
    File file,
  ) async {
    MultipartRequest requst = http.MultipartRequest('Put', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    MultipartFile multefile = http.MultipartFile('uploads/', stream, length,
        filename: basename(file.path));
    requst.headers.addAll(myheaders2);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    Response response = await http.Response.fromStream(myrequest);
    print('-----------------------------------------');
    print(response.body);
    print(response.statusCode);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('erorrrrrr');
    }
  }

  strequestforFile(
    String url,
    namepost,
    Map data,
    File file,
  ) async {
    MultipartRequest requst = http.MultipartRequest('Post', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    MultipartFile multefile = http.MultipartFile(namepost, stream, length,
        filename: basename(file.path));
    requst.headers.addAll(myheaders);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    Response response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {}
  }
}
