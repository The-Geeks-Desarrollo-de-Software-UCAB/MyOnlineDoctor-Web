import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myonlinedoctorweb/Modules/paciente.dart';

class HistoriaMedica {
  String idRegistro;
  String historia;
  String diagnostico;
  String plan;
  String examenes;
  String prescripcion;

  HistoriaMedica(
      {required this.idRegistro,
      required this.historia,
      required this.diagnostico,
      required this.examenes,
      required this.plan,
      required this.prescripcion});

  static Future<List<HistoriaMedica>> fetchHistoriasMedicas(
      Paciente paciente) async {
    print('Prueba Historia Medica');
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/registro/PorPacientee49421aa-6508-4902-aec2-75d519299bb5'));

    print(response.body);
    if (response.statusCode == 200) {
      List<HistoriaMedica> list = parseCitas(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static List<HistoriaMedica> parseCitas(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<HistoriaMedica>((json) => HistoriaMedica.fromJson(json))
        .toList();
  }

  factory HistoriaMedica.fromJson(Map<String, dynamic> json) {
    return HistoriaMedica(
        diagnostico: json["_diagnostico"]["_diagnostico"],
        examenes: json["_examen"]["_examen"],
        historia: json["_historia"]["_historia"],
        idRegistro: json["_identificador"]["_id"],
        plan: json["_historia"]["_historia"],
        prescripcion: json["_prescripcion"]["_prescripcion"]);
  }
}
