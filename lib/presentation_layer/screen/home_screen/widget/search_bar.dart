import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.kBackgroundColor,
  }) : super(key: key);
  final Color kBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        style: const TextStyle(height: 1.3, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: kBackgroundColor,
          hintStyle: TextStyle(color: Colors.black, fontSize: 18),
          hintText: 'ابحث عن منتجك...',
          prefixIcon: InkWell(
            onTap: () {
              Get.toNamed(
                Routes.moreproduct,
                arguments: [15],
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/Frame 3.svg',
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
