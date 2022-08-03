import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:myonlinedoctorweb/Modules/cita.dart';
import 'package:myonlinedoctorweb/Modules/historia_medica.dart';

class PutScheduledAppoiment {
  static putScheduledAppoiment(Cita cita, String id_doctor) async {
    final response = await http.put(
        Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/cita/Agendar'),
        body: {
          "id_cita": cita.idCita,
          "fecha": DateTime.now().toString(),
          "id_doctor": id_doctor
        });
    print(response.body);
  }

  static putAceptada(Cita cita, String id_doctor) async {
    final response = await http.put(
        Uri.parse(
            'https://myonlinedoctorapi.herokuapp.com/api/cita/AceptarFecha'),
        body: {
          "id_cita": cita.idCita,
          "id_paciente": "fdbf1a1a-be97-4337-a029-f45df5a2e0",
        });
    print(response.body);
  }
}

class PutDeclineAppoiment {
  static putRechazada(Cita cita) async {
    final response = await http.put(
        Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/cita/Rechazar'),
        body: {"id_cita": cita.idCita, "id_doctor": cita.id_doctor});
    print(response.body);
  }
}

class PutHistoriaMedica {
  // a esto le tengo que pasar los datos del formulario.
  static crearHistoriaMedica(Cita cita, HistoriaMedica historiaMedica) async {
    //falta que me traiga las citas.
    final response = await http.post(
        Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/cita/Crear'),
        body: {
          "id_cita": cita.idCita,
          "id_doctor": cita.id_doctor,
          "motivo": cita.motivo,
          "prescripcion": historiaMedica.prescripcion,
          "historia": historiaMedica.historia,
          "plan": historiaMedica.plan,
          "examen": historiaMedica.examenes,
          "diagnostico": historiaMedica.diagnostico,
        });
  }
}
