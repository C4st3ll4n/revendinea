import 'package:revendinea/src/model/city.dart';
import 'package:revendinea/src/model/uf.dart';

const String kAddressUF = "uf";
const String kAddressCEP = "cep";
const String kAddressBairro = "bairro";
const String kAddressCidade = "localidade";

class Address {
  Address({this.uf, this.city, this.cep, this.bairro});

  UF uf;
  City city;

  String cep;
  String bairro;

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(cep: json[kAddressCEP], bairro: json[kAddressBairro]);

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, cep: $cep, bairro: $bairro}';
  }


}
