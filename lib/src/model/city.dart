const kCityId = "id";
const kCityNome = "nome";

class City {
  City({this.id, this.nome});

  int id;
  String nome;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json[kCityId],
        nome: json[kCityNome],
      );

  @override
  String toString() {
    return 'City{id: $id, nome: $nome}';
  }
}
