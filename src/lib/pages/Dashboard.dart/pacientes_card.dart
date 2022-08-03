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
        height: 550,
        width: 400,
        child: Stack(
          children: [
            Positioned(
                top: 35,
                left: 20,
                child: Material(
                    child: Container(
                  height: 200,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10)),
                  ),
                ))),
            Positioned(
                top: 0,
                left: 30,
                child: Card(
                    elevation: 10.0,
                    shadowColor: lightGrey.withOpacity(0.5),
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
                                    'https://th.bing.com/th/id/OIP.FtL1P-FmI0OBlvjZI5ftRwAAAA?pid=ImgDet&w=474&h=474&rs=1')))))),
            Positioned(
                top: 45,
                left: 180,
                child: Container(
                  width: 180,
                  height: 150,
                  child: Column(children: [
                    CustomText(
                      text: paciente.primerNombre +
                          paciente.primerApellido, //nombre del paciente
                      size: 20,
                      weight: FontWeight.bold,
                      color: active,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 2, top: 15),
                      child: CustomText(
                        text:
                            'Genero : ${paciente.genero}', //nombre edad del paciente
                        size: 18,
                        weight: FontWeight.normal,
                        color: lightGrey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 45),
                      child: CustomText(
                        text:
                            'Altura : ${paciente.altura} cm', //nombre edad del paciente
                        size: 18,
                        weight: FontWeight.normal,
                        color: lightGrey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 23, top: 4),
                      child: CustomText(
                        text:
                            'Peso : ${paciente.peso} kg', //nombre edad del paciente
                        size: 18,
                        weight: FontWeight.normal,
                        color: lightGrey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 9),
                      child: ElevatedButton(
                          onPressed: () {
                            //traer toda la info de un paciente
                          },
                          child: const CustomText(
                            text: "Ver mas",
                            size: 16,
                            color: Colors.white,
                            weight: FontWeight.bold,
                          )),
                    )
                  ]),
                ))
          ],
        ));
  }
}
