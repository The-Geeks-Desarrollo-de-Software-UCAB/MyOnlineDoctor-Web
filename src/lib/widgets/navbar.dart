import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';
import '../constants/style.dart';
import '../data.dart';

import '../constants/screenbreakpoint.dart';
import 'custom_text.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  final screenBreakPoint = ScreenBreakPoint();

  return AppBar(
    leading: !screenBreakPoint.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Image.network(
                  "https://i.ibb.co/sRhR8SK/logo2.png",
                  width: 30,
                ),
              )
            ],
          )
        : IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              key.currentState?.openDrawer();
            },
          ),
    elevation: 0,
    title: Row(
      children: [
        Visibility(
            child: CustomText(
                text: 'My DashBoard',
                color: lightGrey,
                size: 20,
                weight: FontWeight.bold)),
        Expanded(child: Container()),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: active.withOpacity(.7))),
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, color: active.withOpacity(.7))),
            Positioned(
                top: 7,
                right: 7,
                child: Container(
                    width: 12,
                    height: 12,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: light, width: 2))))
          ],
        ),
        Container(width: 1, height: 22, color: lightGrey),
        const SizedBox(
          width: 24,
        ),
        CustomText(
          text: "Dr.$nombre_doctor ${apellido_doctor}",
          color: lightGrey,
          size: null,
          weight: null,
        ),
        const SizedBox(width: 16),
        Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(2),
                child: CircleAvatar(
                    backgroundColor: light,
                    child: Icon(Icons.person_outline, color: active)))),
      ],
    ),
    iconTheme: IconThemeData(color: active),
    backgroundColor: Colors.transparent,
  );
}
