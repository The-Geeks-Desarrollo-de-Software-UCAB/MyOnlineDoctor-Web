import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myonlinedoctorweb/constants/controllers.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.hoverItem("not Hovering");
      },
      child: Obx(() => Container(
          color: menuController.isHovering(itemName)
              ? lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Container(width: 6, height: 40, color: active),
              ),
              SizedBox(width: _width / 80),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: menuController.returnIconFor(itemName)),
              if (!menuController.isActive(itemName))
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color:
                      menuController.isHovering(itemName) ? active : lightGrey,
                  size: 16,
                  weight: FontWeight.normal,
                ))
              else
                Flexible(
                    child: CustomText(
                        text: itemName,
                        size: 18,
                        color: active,
                        weight: FontWeight.bold))
            ],
          ))),
    );
  }
}
