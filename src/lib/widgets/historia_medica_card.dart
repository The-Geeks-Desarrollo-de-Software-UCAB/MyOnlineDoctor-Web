import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/historia_medica.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';

class HistoriaMedicaCard extends StatelessWidget {
  HistoriaMedica historiaMedica;

  HistoriaMedicaCard({Key? key, required this.historiaMedica})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                width: 800,
                height: 100,
                child: Center(
                  child: CustomText(
                    text: "Diagnostico: ${historiaMedica.diagnostico}",
                    size: 20,
                    weight: FontWeight.bold,
                    color: active,
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 20),
                width: 800,
                height: 100,
                child: Center(
                  child: CustomText(
                    text: "Plan: ${historiaMedica.plan}",
                    size: 20,
                    weight: FontWeight.bold,
                    color: active,
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 20),
                width: 800,
                height: 100,
                child: Center(
                  child: CustomText(
                    text: "Historia: ${historiaMedica.historia}",
                    size: 20,
                    weight: FontWeight.bold,
                    color: active,
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 20),
                width: 800,
                height: 100,
                child: Center(
                  child: CustomText(
                    text: "Examenes: ${historiaMedica.examenes}",
                    size: 20,
                    weight: FontWeight.bold,
                    color: active,
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 20),
                width: 800,
                height: 100,
                child: Center(
                  child: CustomText(
                    text: "Prescripcion: ${historiaMedica.prescripcion}",
                    size: 20,
                    weight: FontWeight.bold,
                    color: active,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
