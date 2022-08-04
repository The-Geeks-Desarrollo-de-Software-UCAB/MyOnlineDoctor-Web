import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/constants/style.dart';

Widget botonReusable(BuildContext context, bool isLogin, Function onTap) {
  return ElevatedButton(
    child: Text(isLogin ? 'ENTRAR' : 'REGISTRATE'),
    onPressed: () => {
      onTap()
      /*  Navigator.push(
          context, MaterialPageRoute(builder: (context) => DoctoresPage()))*/
    },
    style: ElevatedButton.styleFrom(
        primary: AppColors.MAINCOLOR3,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 22),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );
}
