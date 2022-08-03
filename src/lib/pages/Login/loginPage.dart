import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/helpers/botonReusable.dart';
import 'package:myonlinedoctorweb/helpers/reusableTextField.dart';
import 'package:myonlinedoctorweb/layout.dart';
import 'package:myonlinedoctorweb/pages/Dashboard.dart/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 350),
            child: Center(
                child: SingleChildScrollView(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(children: [Text('aaaaa')]),
                      width: 500,
                    ),
                    Container(
                      child: Column(
                        children: [
                          logoDegradado(),
                          titulo(),
                          SizedBox(
                            height: 40,
                          ),
                          reusableTextField('Email', Icons.email, false,
                              _emailTextController),
                          SizedBox(
                            height: 15,
                          ),
                          reusableTextField('Contraseña', Icons.lock, true,
                              _passwordTextController),
                          SizedBox(
                            height: 50,
                          ),
                          botonReusable(context, true, () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SiteLayout(),
                                  ));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                          }),
                        ],
                      ),
                      width: 500,
                    )
                  ]),
            )),
          )
        ],
      ),
    ));
  }

  Widget logoDegradado() {
    return Image.network(
      'https://i.ibb.co/sRhR8SK/logo2.png',
      height: 150,
      width: 150,
    );
  }

  Widget titulo() {
    return Text(
      'My Online Doctor',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.MAINCOLOR3,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
  }
}
