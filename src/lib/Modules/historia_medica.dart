class HistoriaMedica {
  String id_registro;
  String historia;
  String diagnostico;
  String plan;
  String examenes;
  String prescripcion;

  HistoriaMedica(
      {required this.id_registro,
      required this.historia,
      required this.diagnostico,
      required this.examenes,
      required this.plan,
      required this.prescripcion});
}
