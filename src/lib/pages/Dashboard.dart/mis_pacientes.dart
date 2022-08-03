import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';

import '../../constants/style.dart';

class MisPacientes extends StatelessWidget {
  const MisPacientes({Key? key}) : super(key: key);

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
                      text: 'Mama Coco', //nombre del paciente
                      size: 20,
                      weight: FontWeight.bold,
                      color: active,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 2, top: 15),
                      child: CustomText(
                        text: 'Genero : F', //nombre edad del paciente
                        size: 18,
                        weight: FontWeight.normal,
                        color: lightGrey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 45),
                      child: CustomText(
                        text: 'Altura : 150 cm', //nombre edad del paciente
                        size: 18,
                        weight: FontWeight.normal,
                        color: lightGrey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 23, top: 4),
                      child: CustomText(
                        text: 'Peso : 80 kg', //nombre edad del paciente
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
