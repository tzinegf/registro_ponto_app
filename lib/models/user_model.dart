
class User {
  int id;
  String codMatricula;
  String nome;
  String cpf;
  String cargo;
  String rua;
  String bairro;
  String cidade;
  String telefone1;
  String telefone2;
  bool ativo;
  String horaIniExpedient;
  String horaIniAlmoco;
  String horaFimAlmoco;
  String horaFimExpediente;


  User({
    this.id,
    this.codMatricula,
    this.nome,
    this.cpf,
    this.cargo,
    this.rua,
    this.bairro,
    this.cidade,
    this.telefone1,
    this.telefone2,
    this.ativo,
    this.horaFimAlmoco,
    this.horaFimExpediente,
    this.horaIniAlmoco,
    this.horaIniExpedient,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        codMatricula: json["cod_matricula"],
        nome: json["nome"],
        cpf: json["cpf"],
        rua: json["rua"],
        bairro: json["bairro"],
        cargo: json["cargo"],
        cidade: json["cidade"],
        telefone1: json["telefone1"],
        telefone2: json["telefone2"],
        ativo: json["ativo"],
        horaFimAlmoco: json["hora_fim_almoco"],
        horaFimExpediente: json["hora_fim_expediente"],
        horaIniAlmoco: json["hora_ini_almoco"],
        horaIniExpedient: json["hora_ini_expediente"],

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ativo":ativo,
        "nome": nome,
        "cpf": cpf,
        "rua": rua,
        "bairro": bairro,
        "cargo": cargo,
        "cidade": cidade,
        "telefone1": telefone1,
        "telefone2": telefone2,
        "hora_fim_almoco": horaFimAlmoco,
        "cod_matricula": codMatricula,
        "hora_fim_expediente": horaFimExpediente,
        "hora_ini_almoco": horaIniAlmoco,
        "hora_ini_expediente": horaIniExpedient,
      };
}
