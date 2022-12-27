import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';

class ButtonChange extends StatelessWidget {
  const ButtonChange({
    Key? key,
    required this.icon,
    this.onTap,
    this.x,
    required this.size,
  }) : super(key: key);
  final IconData icon;
  final void Function()? onTap;
  final bool? x;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: x == null ? Alignment.topCenter : Alignment.center,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: ColorManager.grey2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
    );
  }
}
