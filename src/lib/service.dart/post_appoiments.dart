import 'package:http/http.dart' as http;
import 'package:myonlinedoctorweb/Modules/cita.dart';
import 'package:myonlinedoctorweb/Modules/historia_medica.dart';
import 'package:myonlinedoctorweb/Modules/paciente.dart';
import 'package:myonlinedoctorweb/data.dart';

//Funcionando
class PutScheduledAppoiment {
  static putScheduledAppoiment(Cita cita) async {
    print(cita.fecha);
    print(cita.id_doctor);
    final response = await http.put(
        Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/cita/Agendar'),
        body: {
          "id_cita": cita.idCita,
          "fecha": cita.fecha.toString(),
          "id_doctor": cita.id_doctor
        });
    print(response.body);
  }

  //duda que hace esto
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

//Listo
class PostHistoriaMedica {
  static crearHistoriaMedica(Cita cita, HistoriaMedica historiaMedica) async {
    final response = await http.post(
        Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/registro/Crear'),
        body: {
          "id_registro": historiaMedica.idRegistro,
          "id_cita": cita.idCita,
          "id_doctor": cita.id_doctor,
          "motivo": cita.motivo,
          "prescripcion": historiaMedica.prescripcion,
          "historia": historiaMedica.historia,
          "plan": historiaMedica.plan,
          "examen": historiaMedica.examenes,
          "diagnostico": historiaMedica.diagnostico,
        });

    print(response.body);
  }
}

//Falta probar
class PutBloqueoPaciente {
  static bloquearPaciente(Paciente paciente) async {
    final response = await http.put(
        Uri.parse(
            "https://myonlinedoctorapi.herokuapp.com/api/paciente/Bloquear"),
        body: {
          "id_paciente": paciente.idPaciente,
          "id_doctor": id_doctor,
          "razon": "Mal comportamiento"
        });
    print(response.body);
  }
}

//Listo
class PutCancelarCitaAgendada {
  static cancelarCitaAgendada(Cita cita) async {
    final response = await http.put(
        Uri.parse(
            "https://myonlinedoctorapi.herokuapp.com/api/cita/CancelarDoctor"),
        body: {"id_cita": cita.idCita, "id_doctor": cita.id_doctor});
    print(response.body);
  }
}
