class Activity {
  Activity({
    this.nombre,
    this.cupo,
    this.fechaInicio,
    this.horasOtorgadas,
    this.idAdministrador,
    this.idActividad,
    this.rFacultad,
    this.rYear,
    this.rBeca,
    this.descripcion,
    this.idCertificador,
    this.estado,
  });

  String? nombre;
  int? cupo;
  DateTime? fechaInicio;
  int? horasOtorgadas;
  int? idAdministrador;
  int? idActividad;
  String? rFacultad;
  String? rYear;
  String? rBeca;
  String? descripcion;
  int? idCertificador;
  String? estado;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        nombre: json["Nombre"],
        cupo: json["Cupo"],
        fechaInicio: DateTime.parse(json["Fecha_Inicio"]),
        horasOtorgadas: json["Horas_Otorgadas"],
        idAdministrador: json["ID_Administrador"],
        idActividad: json["ID_Actividad"],
        rFacultad: json["R_Facultad"],
        rYear: json["R_Year"],
        rBeca: json["R_Beca"],
        descripcion: json["Descripcion"],
        idCertificador: json["ID_Certificador"],
        estado: json["Estado"],
      );

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Cupo": cupo,
        "Fecha_Inicio":
            "${fechaInicio!.year.toString().padLeft(4, '0')}-${fechaInicio!.month.toString().padLeft(2, '0')}-${fechaInicio!.day.toString().padLeft(2, '0')}",
        "Horas_Otorgadas": horasOtorgadas,
        "ID_Administrador": idAdministrador,
        "ID_Actividad": idActividad,
        "R_Facultad": rFacultad,
        "R_Year": rYear,
        "R_Beca": rBeca,
        "Descripcion": descripcion,
        "ID_Certificador": idCertificador,
        "Estado": estado,
      };
}
