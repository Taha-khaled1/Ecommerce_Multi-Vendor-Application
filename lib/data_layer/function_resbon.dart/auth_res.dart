import 'package:pisti/data_layer/database/connectdatabase.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';

LogOutRes() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.logout,
    // {
    //   'Authorization':
    //       'Bearer ${sharedPreferences.getString('token').toString()}'
    // },
    // encode: true,
    //  myheadersres: Curd().myheaders2,
  );
  return respons;
}

// ChangepassRes(oldpass, newpass, newpassConfirm) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.changePassword,
//     {
//       "old_password": oldpass,
//       "new_password": newpass,
//       "new_password_confirmation": newpassConfirm
//     },
//     encode: true,
//     myheadersres: Curd().myheaders,
//   );
//   print(respons);
//   return respons;
// }

// userDataResp() async {
//   Curd curd = Curd();
//   var respons = await curd.getrequest(
//     APiMange.userData,
//     encode: true,
//     myheadersres: Curd().myheaders,
//   );
//   print(respons);
//   return respons;
// }

// ChangeUserDataRes(String name, String country, String phone) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.changeuserData,
//     {"name": name, "country": country, "phone": phone},
//     encode: true,
//     myheadersres: Curd().myheaders,
//   );

//   return respons;
// }

// logInResponse(String pass, String email) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.login,
//     {
//       "email": email,
//       "password": pass,
//     },
//     encode: true,
//     myheadersres: Curd().myheaders,
//   );
//   return respons;
// }

// RegisterResponse({
//   required String email,
//   required String password,
//   required String country,
//   required String name,
//   required String phone,
// }) async {
//   print(country);
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.register,
//     {
//       "email": email,
//       "password": password,
//       "name": name,
//       "country": country,
//       "phone": phone
//     },
//     encode: true,
//     myheadersres: Curd().myheaders2,
//   );
//   return respons;
// }

// forgetPassResponse(email) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.forgotPassword,
//     {
//       "email": email,
//     },
//     encode: true,
//     myheadersres: Curd().myheaders2,
//   );
//   return respons;
// }

// verfayforgetPassResponse(email, otp) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.verfyemail,
//     {
//       "otp": otp,
//       "email": email,
//     },
//     encode: true,
//     myheadersres: Curd().myheaders2,
//   );
//   return respons;
// }

// resetPassResponse(email, otp, pass) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.resetPass,
//     {
//       "otp": otp,
//       "password": pass,
//       "email": email,
//     },
//     encode: true,
//     myheadersres: Curd().myheaders2,
//   );
//   return respons;
// }
