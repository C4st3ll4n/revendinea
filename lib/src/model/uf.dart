const kUFId = "id";
const kUFSigla = "sigla";
const kUFNome = "nome";

class UF {
  UF({this.id, this.sigla, this.nome});

  int id;
  String sigla, nome;

  factory UF.fromJson(Map<String, dynamic> json) =>
      UF(id: json[kUFId], nome: json[kUFNome], sigla: json[kUFSigla]);

  @override
  String toString() {
    return 'UF{id: $id, sigla: $sigla, nome: $nome}';
  }
}
