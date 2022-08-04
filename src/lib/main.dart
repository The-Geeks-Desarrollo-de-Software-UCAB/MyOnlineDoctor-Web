import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myonlinedoctorweb/constants/move_appoiment.dart';
import 'package:myonlinedoctorweb/controllers/menu_controller.dart';
import 'package:myonlinedoctorweb/controllers/navigation_controller.dart';
import 'package:myonlinedoctorweb/firebase_options.dart';
import 'package:myonlinedoctorweb/layout.dart';
import 'package:myonlinedoctorweb/locator.dart';
import 'package:myonlinedoctorweb/pages/Lista_Doctores/doctorProvider.dart';
import 'package:myonlinedoctorweb/pages/Login/loginPage.dart';
import 'package:myonlinedoctorweb/service.dart/especialidadesProvider.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'service.dart/get_appoiments.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(MenuController());
  Get.put(NavigationController());
  setupLocator();
  runApp(const MyOnlineDoctor());
}

class MyOnlineDoctor extends StatelessWidget {
  const MyOnlineDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SetValores.SetValoresDoctor('nkrojn0');
    print(id_doctor);
    print(nombre_doctor);
    print(apellido_doctor);
    print('Vicente');

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => EspecialidadesProvider(), lazy: false),
          ChangeNotifierProvider(
              create: (_) => DoctoresProvider(), lazy: false),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "MyOnlineDoctor",
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                textTheme:
                    GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
                        .apply(bodyColor: Colors.black),
                pageTransitionsTheme: const PageTransitionsTheme(builders: {
                  TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
                }),
                primaryColor: Colors.blue),
            home: const LoginPage()));
  }
}
