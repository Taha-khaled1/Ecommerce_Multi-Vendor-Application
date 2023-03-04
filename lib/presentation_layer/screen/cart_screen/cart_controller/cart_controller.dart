import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/data_layer/function_resbon.dart/shope_res.dart';
import 'package:pisti/domain_layer/models/cart_list_models.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:quickalert/quickalert.dart';

class CartController extends GetxController {
  double totelPrice = 0;
  double totelTex = 0;
  int count = 0;
  CartListModels? cartListModels;
  List<CartItems> carModelsdemo = [];

  getCartList(int idCato) async {
    carModelsdemo.clear();
    totelPrice = 0;
    totelTex = 0;
    try {
      var response = await getCartListRes(idCato);

      for (var i = 0; i < response.length; i++) {
        cartListModels = await CartListModels.fromJson(response[i]);
        for (int q = 0; q < cartListModels!.cartItems!.length; q++) {
          totelPrice += cartListModels!.cartItems![q].price!.toDouble() *
              cartListModels!.cartItems![q].quantity!.toDouble();
          totelTex += cartListModels!.cartItems![q].tax!.toDouble() *
              cartListModels!.cartItems![q].quantity!.toDouble();
          carModelsdemo.add(cartListModels!.cartItems![q]);
        }
      }
      update();
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
  }

  StatusRequest statusRequest = StatusRequest.none;
  deletecarts(BuildContext context, int id) async {
    statusRequest = StatusRequest.loading;
    update();

    var respon = await deleteFromCartRespon(id);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        if (respon['result'].toString() == 'true') {
          showDilog(context, 'تم حذف المنتج بنجاح');
          carModelsdemo.removeWhere(
            (element) => element.id == id,
          );
        } else {
          showDilog(
            context,
            'لم يتم حذف المنج ربما يوجد خطاء',
            type: QuickAlertType.info,
          );
        }
      } else {
        showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
      }
    } catch (e) {
      print('catch $e');
      showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
    }

    update();
  }

  icrasingCount(int count, double price) {
    count++;
    totelPrice += price;
    update();
  }

  decrasingCount(int count, double price) {
    if (count > 1) {
      count--;
      totelPrice -= price;
      update();
    }
  }

  StatusRequest statusRequest1 = StatusRequest.none;
  saveOrder(BuildContext context, String id) async {
    statusRequest1 = StatusRequest.loading;
    update();

    var respon = await saveOrderRespon(id);
    statusRequest1 = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest1) {
        if (respon['result'].toString() == 'true') {
          carModelsdemo.clear();
          Get.offAndToNamed(Routes.sucssRoute);
        } else {
          showDilog(
            context,
            'عربة التسوق فارغه او الكميه غير متوفره',
            type: QuickAlertType.info,
          );
        }
      } else {
        showDilog(
          context,
          'يوجد مشكله بحساب المستخد يرجي التواصل مع الدعم',
          type: QuickAlertType.error,
        );
      }
    } catch (e) {
      print('catch $e');
      showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
    }

    update();
  }
}
