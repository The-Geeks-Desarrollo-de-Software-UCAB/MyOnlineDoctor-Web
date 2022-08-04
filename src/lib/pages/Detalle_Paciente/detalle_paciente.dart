import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/historia_medica.dart';
import 'package:myonlinedoctorweb/Modules/paciente.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';
import 'package:myonlinedoctorweb/widgets/historia_medica_card.dart';
import '../../constants/style.dart';

class DetallePaciente extends StatelessWidget {
  Paciente paciente;
  DetallePaciente({Key? key, required this.paciente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = ScreenSize.screenSize(context);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          AppColors.MAINCOLOR1,
          AppColors.MAINCOLOR2,
        ],
      )),
      child: Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(height: 30, color: Colors.transparent),
          CustomText(
            text:
                "${paciente.primerNombre} ${paciente.segundoNombre} ${paciente.primerApellido} ${paciente.segundoApellido}",
            size: 30,
            weight: FontWeight.bold,
            color: Colors.white,
          ),
          const Divider(height: 30, color: Colors.transparent),
          Container(
            width: 900,
            height: 40,
            child: const CustomText(
              text: "Datos Personales: ",
              size: 25,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Divider(height: 10, color: Colors.transparent),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text: "Correo: ${paciente.correo}",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text: "Telefono: ${paciente.numeroMovil}",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text:
                    "Fecha Nacimiento:: ${DateTime.parse(paciente.fechaNacimiento)}",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          const Divider(height: 30, color: Colors.transparent),
          Container(
            width: 900,
            height: 40,
            child: const CustomText(
              text: "Medidas Del Paciente: ",
              size: 25,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Divider(height: 10, color: Colors.transparent),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text: "Peso: ${paciente.peso} kg",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text: "Altura: ${paciente.altura} cm",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text: "Genero: ${paciente.genero}",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          const Divider(height: 30, color: Colors.transparent),
          Container(
            width: 900,
            height: 40,
            child: const CustomText(
              text: "Informacion Medica: ",
              size: 25,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text: "Antecedentes: ${paciente.antecendentes}",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          Container(
              width: 900,
              height: 30,
              child: CustomText(
                text: "Operacion: ${paciente.operacion}",
                size: 20,
                weight: FontWeight.normal,
                color: Colors.white,
              )),
          Expanded(
            child: Row(
              children: [
                FutureBuilder(
                    future: HistoriaMedica.fetchHistoriasMedicas(
                        paciente), // historia medica
                    builder: (BuildContext context,
                        AsyncSnapshot<List<HistoriaMedica>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        print(snapshot.data);
                        print("cree el objeto");
                        List<HistoriaMedica> snap = snapshot.data ?? [];
                        return listHistoriaMedicaCard(context, snap, _width);
                      }
                    })
              ],
            ),
          )
        ],
      )),
    );
  }
}

Widget listHistoriaMedicaCard(
    BuildContext context, List<HistoriaMedica> historiaMedica, double width) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: historiaMedica.length,
      itemBuilder: ((context, index) {
        return Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            child: HistoriaMedicaCard(
              historiaMedica: historiaMedica[index],
            ));
      }));
}
