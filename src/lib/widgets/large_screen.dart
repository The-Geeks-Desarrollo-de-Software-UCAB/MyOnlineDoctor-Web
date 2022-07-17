import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Expanded(
        child: SideMenu(),
      ),
      Expanded(flex: 5, child: Container(color: Colors.blue))
    ]);
  }
}
