import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Especialidades {
  final int id;
  final String nombre;

  Especialidades({required this.id, required this.nombre});

  List<Object?> get props => [id, nombre];

  static Future<List<Especialidades>> fetchEspecialidades() async {
    const url =
        'https://myonlinedoctorapi.herokuapp.com/api/doctor/Especialidades';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Especialidades> list = parseEspecialidades(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
  }

  static List<Especialidades> parseEspecialidadesLista(List<dynamic> response) {
    List<Especialidades> list = [];

    for (var item in response) {
      list.add(Especialidades(id: 0, nombre: item['_especialidad']));
    }
    return list;
  }

  static List<Especialidades> parseEspecialidades(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Especialidades>((json) => Especialidades.fromJson(json))
        .toList();
  }

  factory Especialidades.fromJson(Map<dynamic, dynamic> json) {
    return Especialidades(id: json["id_especialidad"], nombre: json["nombre"]);
  }
}
