class Expediente {
  int id;
  String codMatricula;
  String horaFimExpediente;
  String horaFimAlmoco;
  int countTimes;
  String createdAt;
  String horaIniAlmoco;
  String horaIniExpedient;

  Expediente({
    this.id,
    this.codMatricula,
    this.createdAt,
    this.countTimes,
    this.horaFimAlmoco,
    this.horaFimExpediente,
    this.horaIniAlmoco,
    this.horaIniExpedient,
  });

  factory Expediente.fromJson(Map<String, dynamic> json) => Expediente(
    id: json["id"],
    codMatricula: json["cod_matricula"],
    createdAt: json["created_at"],
      countTimes:json["count_times"],
      horaFimAlmoco:json["hora_fim_almoco"],
      horaFimExpediente:json["hora_fim_expediente"],
      horaIniExpedient:json["hora_ini_expediente"],
      horaIniAlmoco:json["hora_fim_almoco"]

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cod_matricula":codMatricula,
    "created_at":createdAt,
    "count_times":countTimes,
    "hora_fim_almoco":horaFimAlmoco,
    "hora_fim_expediente":horaFimExpediente,
   "hora_ini_expediente":horaIniExpedient,
   "hora_fim_almoco":horaIniAlmoco

  };




}
