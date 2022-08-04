import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctorweb/Modules/paciente.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';

class PacientesCard extends StatelessWidget {
  const PacientesCard({Key? key, required this.paciente}) : super(key: key);
  final Paciente paciente;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 250,
        //color: Colors.white,
        child: Stack(
          children: [
            Positioned(
                top: 35,
                left: 65,
                child: Material(
                    child: Container(
                  height: 250,
                  width: 450,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                ))),
            Positioned(
                top: 0,
                left: 80,
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.0fefT1x-jwqZkaFEnKmjrgHaHa?pid=ImgDet&w=750&h=750&rs=1'))),
                  ),
                )),
            Positioned(
                top: 45,
                left: 250,
                child: Container(
                  height: 230,
                  width: 250,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      CustomText(
                        text:
                            "${paciente.primerNombre} ${paciente.primerApellido}",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                      const Divider(height: 20, color: Colors.transparent),
                      CustomText(
                        text: "Altura: ${paciente.altura} cm",
                        size: 16,
                        weight: FontWeight.bold,
                        color: lightGrey,
                      ),
                      const Divider(height: 10, color: Colors.transparent),
                      CustomText(
                        text: "Peso: ${paciente.peso} kg",
                        size: 16,
                        weight: FontWeight.bold,
                        color: lightGrey,
                      ),
                      const Divider(height: 10, color: Colors.transparent),
                      CustomText(
                        text: "Genero: ${paciente.genero}",
                        size: 16,
                        weight: FontWeight.bold,
                        color: lightGrey,
                      ),
                      const Divider(height: 10, color: Colors.transparent),
                      CustomText(
                        text: "Telefono: ${paciente.numeroMovil}",
                        size: 16,
                        weight: FontWeight.bold,
                        color: lightGrey,
                      ),
                      const Divider(height: 25, color: Colors.transparent),
                      ElevatedButton(
                          onPressed: () {
                            print('ver mas');
                          },
                          child: const CustomText(
                              text: "Ver mas",
                              size: 15,
                              weight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  ),
                )),
            Positioned(
                top: 225,
                left: 115,
                child: ElevatedButton(
                    onPressed: () {
                      print('Bloquear');
                    },
                    child: const CustomText(
                        text: "Bloquear",
                        size: 15,
                        weight: FontWeight.bold,
                        color: Colors.white)))
          ],
        ));
  }
}
