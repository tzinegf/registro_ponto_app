
class RelatorioMonth {

  int user_id ;
  String dataRespectiva;
  String hora_ini;
  String hora_saida_intervalo;
  String hora_retorno_intervalo;
  String hora_saida;
  String  horasTrab1Turno;
  String  horasTrab2Turno;
  String  horasTrabTotais;






  RelatorioMonth({
    this.user_id ,
    this.dataRespectiva,
    this.hora_ini,
    this.hora_saida_intervalo,
    this.hora_retorno_intervalo,
    this.hora_saida,
    this.horasTrab1Turno,
    this.horasTrab2Turno,
    this.horasTrabTotais,

  });

  factory RelatorioMonth.fromJson(Map<String, dynamic> json) => RelatorioMonth(
   user_id : json["user_id"],
      dataRespectiva: json["DataRespectiva"],
     hora_ini: json["hora_ini"],
     hora_saida_intervalo: json["hora_saida_intervalo"],
    hora_retorno_intervalo: json["hora_retorno_intervalo"],
     hora_saida: json["hora_saida"],
   horasTrab1Turno: json["horasTrab1Turno"],
   horasTrab2Turno: json["horasTrab2Turno"],
   horasTrabTotais: json["horasTrabTotais"]


  );

  Map<String, dynamic> toJson() => {

    "user_id":user_id,
    "DataRespectiva":dataRespectiva,
   "hora_ini":hora_ini,
   "hora_saida_intervalo":hora_saida_intervalo,
    "hora_retorno_intervalo":hora_retorno_intervalo,
    "hora_saida":hora_saida,
   "horasTrab1Turno":horasTrab1Turno,
    "horasTrab2Turno":horasTrab2Turno,
    "horasTrabTotais":horasTrabTotais
  };
}
