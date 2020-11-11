import 'package:dio/dio.dart';
import 'package:revendinea/src/model/address.dart';
import 'package:revendinea/src/model/city.dart';
import 'package:revendinea/src/model/uf.dart';
import 'package:revendinea/src/repository/interface/ILocalidadeRepository.dart';

class CepRepository {
  ILocalidadeRepository repository;

  CepRepository(this.repository);

  Future<Address> getAddress(String cep) async {
    if (cep == null || cep.isEmpty) {
      return Future.error("CEP inválido !");
    }

    final formatedCep = cep.trim().replaceAll(RegExp('[^0-9]'), '');
    if (formatedCep.length != 8) return Future.error("CEP inválido !");

    final endpoint = "http://viacep.com.br/ws/$formatedCep/json/";

    final response = await Dio().get(endpoint);

    if (response.statusCode.toString().startsWith("2")) {
      if (response.data.containsKey('erro') && response.data['erro'])
        return Future.error("CEP não existe");

      try {
        final List<UF> ufList = await repository.getUF();

        final Address address = Address.fromJson(response.data);
        address.city = City(nome: response.data[kAddressCidade]);

        address.uf = ufList.firstWhere(
            (element) => element.sigla == response.data[kAddressUF]);
        return address;
      } catch (e) {
        return Future.error("Falha ao buscar CEP");
      }
    } else {
      return Future.error("Error");
    }
  }
}
