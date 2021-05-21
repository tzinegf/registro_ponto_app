
class Relatorio {

  String nome;
  int user_id ;
  int
  usuarioAtivo;
 String existeRegistroPonto;
  String hora_ini;
  String hora_saida_intervalo;
  String hora_retorno_intervalo;
  String hora_saida;
  String  horasTrab1Turno;
  String  horasTrab2Turno;
  String  horasTrabTotais;


  Relatorio({
    this.nome,
    this.user_id ,
    this.usuarioAtivo,
    this.existeRegistroPonto,
    this.hora_ini,
    this.hora_saida_intervalo,
    this.hora_retorno_intervalo,
    this.hora_saida,
    this.horasTrab1Turno,
    this.horasTrab2Turno,
    this.horasTrabTotais,

  });

  factory Relatorio.fromJson(Map<String, dynamic> json) => Relatorio(

   nome : json["nome"],
   user_id : json["user_id"],
  usuarioAtivo: json["usuarioAtivo"],
   existeRegistroPonto: json["existeRegistroPonto"],
     hora_ini: json["hora_ini"],
     hora_saida_intervalo: json["hora_saida_intervalo"],
    hora_retorno_intervalo: json["hora_retorno_intervalo"],
     hora_saida: json["hora_saida"],
   horasTrab1Turno: json["horasTrab1Turno"],
   horasTrab2Turno: json["horasTrab2Turno"],
   horasTrabTotais: json["horasTrabTotais"]


  );

  Map<String, dynamic> toJson() => {
   "nome":nome,
    "user_id":user_id,
    "usuarioAtivo":usuarioAtivo,
    "existeRegistroPonto":existeRegistroPonto,
   "hora_ini":hora_ini,
   "hora_saida_intervalo":hora_saida_intervalo,
    "hora_retorno_intervalo":hora_retorno_intervalo,
    "hora_saida":hora_saida,
   "horasTrab1Turno":horasTrab1Turno,
    "horasTrab2Turno":horasTrab2Turno,
    "horasTrabTotais":horasTrabTotais
  };
}
