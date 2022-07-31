import 'package:get/get.dart';
import '../routing/routes.dart';
import 'package:flutter/material.dart';
import '../constants/style.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = dashBoardPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case dashBoardPageRoute:
        return _customIcon(Icons.home, itemName);

      case "Citas por Agendar":
        return _customIcon(Icons.schedule, itemName);

      case historiaMedica:
        return _customIcon(Icons.text_snippet_outlined, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: active);

    return Icon(icon, color: isHovering(itemName) ? active : lightGrey);
  }
}
