import 'dart:convert';
import 'package:http/http.dart' as http;

class Paciente {
  Paciente({
    required this.idPaciente,
    required this.usuario,
    required this.contrasena,
    required this.primerNombre,
    this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.genero,
    required this.numeroMovil,
    required this.altura,
    required this.correo,
    required this.alergia,
    required this.antecendentes,
    required this.fechaNacimiento,
    required this.operacion,
    required this.peso,
    required this.estadoSuscripcion,
  });

  final String idPaciente;
  final String usuario;
  final String contrasena;
  final String primerNombre;
  final String? segundoNombre;
  final String primerApellido;
  final String segundoApellido;
  final String genero;
  final String numeroMovil;
  final String altura;
  final String correo;
  final String alergia;
  final String antecendentes;
  final String fechaNacimiento;
  final String operacion;
  final String peso;
  final String estadoSuscripcion;

  // String? imagen;

  // Este metodo esta funcionand con un id del paciente no del doctor.
  static Future<List<Paciente>> fetchPacientesPorDoctor() async {
    print('hello111');
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/paciente/Todos'));
    //print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      return list.map((e) => Paciente.fromJson(e)).toList();
      //return list;
    } else {
      return <Paciente>[];
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static Future<List<Paciente>> fetchPacientesPorId() async {
    print('hello111');
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/paciente/PorIde49421aa-6508-4902-aec2-75d519299bb5'));
    //print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> list = [];
      list.add(json.decode(response.body));
      return list.map((e) => Paciente.fromJson(e)).toList();
      //return list;
    } else {
      return <Paciente>[];
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static List<Paciente> parsePacientes(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Paciente>((json) => Paciente.fromJson(json)).toList();
  }

// se queda pegado con el primer paciente revisar....
  factory Paciente.fromJson(Map<String, dynamic> json) {
    final int alturaInt = json["_altura"]["_altura"];
    final int pesoInt = json["_peso"]["_peso"];

    return Paciente(
        idPaciente: json["_idPaciente"]["_id"],
        correo: json["_correo"]["_correo"],
        primerNombre: json["_nombre"]["_primerNombre"],
        segundoNombre: json["_nombre"]["_segundoNombre"],
        primerApellido: json["_apellido"]["_primerApellido"],
        segundoApellido: json["_apellido"]["_segundoApellido"],
        alergia: json["_alergia"]["_alergia"],
        altura: alturaInt.toString(),
        genero: json["_genero"]["_genero"],
        peso: pesoInt.toString(),
        antecendentes: json["_antecedente"]["_antecedente"],
        fechaNacimiento: json["_fechaNacimiento"]["_fechaNacimiento"],
        usuario: json["_usuario"]["_usuario"],
        contrasena: json["_password"]["_password"],
        numeroMovil: json["_numeroMovil"]["_numeroMovil"],
        operacion: json["_operacion"]["_operacion"],
        estadoSuscripcion: json["_estadoSuscripcion"]);
  }
}
