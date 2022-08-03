import 'dart:convert';
//import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'doctor.dart';
import 'paciente.dart';

import 'package:flutter/material.dart';

enum AppoimentState { CANCELADA, RECHAZADA, AGENDADA, SOLICITADA }

class Cita {
  Cita(
      {required this.idCita,
      this.fecha,
      required this.duracion,
      required this.tipoCita,
      required this.estadoCita,
      required this.motivo,
      this.calificacion,
      required this.id_doctor,
      required this.id_paciente});

  String idCita;
  dynamic fecha;
  int duracion;
  String tipoCita;
  String estadoCita;
  String motivo;
  dynamic calificacion;
  String id_doctor; // cambiar esto por que solo me aparece el id
  String id_paciente; // cambiar por que solo me aparece el id

  static Future<List<Cita>> fetchCitasAgendadas() async {
    print('hello111');
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/cita/AceptadasDoctore49421aa-6508-4902-aec2-75d519299bb6'));
    print(response.body);
    if (response.statusCode == 200) {
      List<Cita> list = parseCitas(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  /*static Future<List<Cita>> fetchCitasSolicitadas() async {
    print('hello111');
    final response = await http.get(Uri.parse(
        'http://localhost:3000/api/cita/SolicitadasDoctor088e361d-3ddf-46f4-8059-3406e189e2a9'));
    print(response.body);
    if (response.statusCode == 200) {
      List<Cita> list = parseCitas(response.body);
      print(list);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }*/
  static Future<List<Cita>> fetchCitasSolicitadas() async {
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/cita/SolicitadasDoctore49421aa-6508-4902-aec2-75d519299bb6'));

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      return list.map((e) => Cita.fromJson(e)).toList();
    } else {
      return <Cita>[];
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static List<Cita> parseCitas(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Cita>((json) => Cita.fromJson(json)).toList();
  }

  factory Cita.fromJson(Map<String, dynamic> json) {
    return Cita(
      idCita: json["_identificador"]["_id"],
      fecha: json["_fecha"]["_fecha"] ?? "No Asignada",
      duracion: json["_duracion"]["_duracion"],
      tipoCita: json["_tipo"],
      estadoCita: json["_estado"],
      motivo: json["_motivo"]["_motivo"],
      calificacion: json["_calificacion"]["_puntuacion"] ?? 0,
      id_doctor: json["_identificadorDoctor"]["_id"],
      id_paciente: json["_identificadorPaciente"]["_id"],
    );
  }
}
