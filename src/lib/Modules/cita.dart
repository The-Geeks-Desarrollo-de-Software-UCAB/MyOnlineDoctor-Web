import 'dart:convert';
//import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'doctor.dart';
import 'paciente.dart';

import 'package:flutter/material.dart';

enum AppoimentState { CANCELADA, RECHAZADA, AGENDADA, SOLICITADA }

class Cita {
  Cita({
    required this.idCita,
    this.fecha,
    required this.duracion,
    required this.tipoCita,
    required this.estadoCita,
    required this.motivo,
    required this.calificacion,
    required this.doctor,
    required this.paciente,
  });

  String idCita;
  DateTime? fecha;
  int duracion;
  String tipoCita;
  String estadoCita;
  String motivo;
  dynamic calificacion;
  Doctor doctor;
  Paciente paciente;

  static Future<List<Cita>> fetchCitasAgendadas() async {
    print('hello111');
    final response = await http.get(Uri.parse(
        'http://localhost:3000/api/cita/AceptadasDoctor088e361d-3ddf-46f4-8059-3406e189e2a9'));
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
    print(response.body);
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

  factory Cita.fromJson(Map<String, dynamic> json) => Cita(
        idCita: json["id_cita"],
        fecha: DateTime.parse(json["fecha"]),
        duracion: json["duracion"],
        tipoCita: json["tipoCita"],
        estadoCita: json["estadoCita"],
        motivo: json["motivo"],
        calificacion: json["calificacion"],
        doctor: Doctor.fromJson(json["doctor"]),
        paciente: Paciente.fromJson(json["paciente"]),
      );
}
