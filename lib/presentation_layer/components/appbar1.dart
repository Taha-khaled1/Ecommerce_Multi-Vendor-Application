import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';

PreferredSizeWidget appbar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: BackButton(
      color: ColorManager.kPrimary,
    ),
  );
}
