import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/data.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Center(
              child: SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        height: size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                    'https://i.ibb.co/SRMgsbq/loginscreen.jpg'))),
                        width: size.width * 0.6),
                  ),
                  Expanded(
                      child: Center(
                          child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        logoDegradado(),
                        SizedBox(
                          height: 30,
                        ),
                        titulo(),
                        SizedBox(
                          height: 40,
                        ),
                        reusableTextField(
                            'Email', Icons.email, false, _emailTextController),
                        SizedBox(
                          height: 15,
                        ),
                        reusableTextField('Contraseña', Icons.lock, true,
                            _passwordTextController),
                        SizedBox(
                          height: 50,
                        ),
                        botonReusable(context, true, () {

                          SetValores.SetValoresDoctor(_emailTextController.text);
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
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error al ingresar'),
                                content: Text(
                                    'Es posible que el correo o la contraseña estén incorrectos, o que no exista un doctor con el correo ingresado. Por favor verifique sus datos.'),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                            color: AppColors.MAINCOLOR3),
                                      ))
                                ],
                              ),
                            );
                          });
                        }),
                      ],
                    ),
                    width: 500,
                  )))
                ]),
          )),
        ],
      ),
    ));
  }

  Widget logoDegradado() {
    return Image.network(
      'https://i.ibb.co/sRhR8SK/logo2.png',
      height: 250,
      width: 250,
    );
  }

  Widget titulo() {
    return Text(
      'My Online Doctor',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.MAINCOLOR3,
          fontSize: 50,
          fontWeight: FontWeight.bold),
    );
  }
}
