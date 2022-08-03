import 'dart:convert';
import 'package:http/http.dart' as http;

class Paciente {
  Paciente(
      {required this.id_paciente,
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
      this.imagen});

  String id_paciente;
  String usuario;
  String contrasena;
  String primerNombre;
  String? segundoNombre;
  String primerApellido;
  String segundoApellido;
  String genero;
  String numeroMovil;
  String altura;
  String correo;
  String alergia;
  String antecendentes;
  DateTime fechaNacimiento;
  String operacion;
  String peso;
  String estadoSuscripcion;

  String? imagen;

  // Este metodo esta funcionand con un id del paciente no del doctor.
  static Future<List<Paciente>> fetchPacientesPorDoctor() async {
    print('hello111');
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/paciente/Todos'));
    print(response.body);
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
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> list = []; // aqui hay un error.
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
    print("Entre ala factory pro lo menos");
    print(json["_idPaciente"]["_id"]);
    print(json["_nombre"]["_primerNombre"]);
    print(json["_nombre"]["_segundoNombre"]);
    print(json["_apellido"]["_primerApellido"]);
    print(json["_apellido"]["_segundoApellido"]);
    print(json["_alergia"]["_alergia"]);
    print(json["_peso"]["_peso"]);
    print(json["_altura"]["_altura"]);
    print(DateTime.parse(json["_fechaNacimiento"]["_fechaNacimiento"]));

    final paciente = Paciente(
        id_paciente: json["_idPaciente"]["_id"],
        primerNombre: json["_nombre"]["_primerNombre"],
        segundoNombre: json["_nombre"]["_segundoNombre"],
        primerApellido: json["_apellido"]["_primerApellido"],
        segundoApellido: json["_apellido"]["_segundoApellido"],
        alergia: json["_alergia"]["_alergia"],
        genero: json["_genero"]["_genero"],
        altura: json["_altura"]["_altura"],
        peso: json["_peso"]["_peso"],
        antecendentes: json["_antecedente"]["_antecedente"],
        correo: json["_correo"]["_correo"],
        fechaNacimiento:
            DateTime.parse(json["_fechaNacimiento"]["_fechaNacimiento"]),
        usuario: json["_usuario"]["_usuario"],
        contrasena: json["_password"]["_password"],
        numeroMovil: json["_numeroMovil"]["_numeroMovil"],
        operacion: json["_operacion"]["_operacion"],
        estadoSuscripcion: json["_estadoSuscripcion"]);

    print("se creo el paciente");
    return paciente;
  }
}
