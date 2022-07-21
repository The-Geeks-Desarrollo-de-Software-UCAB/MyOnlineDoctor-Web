// import 'package:myonlinedoctorweb/constants/move_appoiment.dart';

// import '../Modules/cita.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// //Esto me va a traer las citas por asignar de un doctor
// class GetRequestedAppoiment {

//   static Future<List<Cita>> getAppoiment() async {
//     final response = await http.get(Uri.parse(
//         'http://localhost:3000/api/cita/SolicitadasDoctor069bce9d-7c11-46d8-8632-e0923247ed93'));

//     final List<Cita> appoiments = [];

//     if (response.statusCode == 200) {
//       String body = utf8.decode(response.bodyBytes);
//       final jsonAppoiments = jsonDecode(body);
//       for (var value in jsonAppoiments) {
//         print(value["paciente"]["primerNombre"]);
//         print(value["motivo"]);

//         appoiments.add(Cita(value["paciente"]["primerNombre"], value["motivo"],
//             value["id_cita"], value["estadoCita"]));
//       }
//     } else {
//       throw Exception("Fallo la conexion");
//     }

//     return appoiments;
//   }
// }

// //Test
// class GetAppoimentMock {
//   Future<List<Cita>> getAppoiment() async {
//     final response = await Future.delayed(
//         const Duration(seconds: 2),
//         () =>
//             '[{"paciente":"Patricio", "motivo":"Lesion muscular","id_cita":"prueba 1"},{"paciente":"Pablo","motivo": "Se cayo","id_cita":"prueba 2"},{"paciente":"Rafael","motivo": "Picazon","id_cita":"prueba 3"},{"paciente":"DuaLipa","motivo": "exceso de belleza","id_cita":"prueba 4"}]');

//     final List<Cita> appoiment = <Cita>[];

//     final List<dynamic> jsonAppoiments = jsonDecode(response);
//     print('estoy decodificando');
//     // punto de control.

//     for (var appoiments in jsonAppoiments) {
//       appoiment.add(Cita(appoiments["paciente"], appoiments["motivo"],
//           appoiments["id_cita"], AppoimentState.SOLICITADA));
//     }
//     appoimentsForSchedule = appoiment;
//     return appoiment;
//   }
// }
