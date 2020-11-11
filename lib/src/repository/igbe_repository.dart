import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:revendinea/src/model/city.dart';
import 'package:revendinea/src/model/uf.dart';
import 'package:revendinea/src/repository/interface/ILocalidadeRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IBGERepository implements ILocalidadeRepository {
  IBGERepository() {
    //Dio().interceptors.add(LogInterceptor());
  }
  @override
  Future<List<UF>> getUF() async {
    const String kSharedUF = "UF_LIST";
    const String endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/";

    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey(kSharedUF)) {
      final j = json.decode(preferences.getString(kSharedUF));
      final ufList = j.map<UF>((json) {
        return UF.fromJson(json);
      }).toList()
        ..sort(
          (UF a, UF b) => a.nome.toLowerCase().compareTo(
                b.nome.toLowerCase(),
              ),
        );
      return ufList;
    }
    try {
      //Dio().interceptors.add(LogInterceptor());
      final response = await Dio().get<List>(endpoint);

      if (response.statusCode.toString().startsWith("2")) {
        preferences.setString(kSharedUF, jsonEncode(response.data));
        final List<UF> ufList = response.data.map<UF>((json) {
          return UF.fromJson(json);
        }).toList()
          ..sort(
            (UF a, UF b) => a.nome.toLowerCase().compareTo(
                  b.nome.toLowerCase(),
                ),
          );
        return ufList;
      } else {
        Future.error("Request fail");
      }
    } on DioError {
      return Future.error(
          "Impossível de conectar a API\nVocê está conectado ?");
    }
  }

  @override
  Future<List<City>> getCity(UF uf) async {
    final String endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios";
    try {
      final response = await Dio().get<List>(endpoint);
      if (response.statusCode.toString().startsWith("2")) {
        final List<City> cityList = response.data.map<City>((json) {
          return City.fromJson(json);
        }).toList()
          ..sort(
            (a, b) => a.nome.toLowerCase().compareTo(
                  b.nome.toLowerCase(),
                ),
          );
        return cityList;
      } else {
        Future.error("Falha ao buscar cidade");
      }
    } on DioError {
      return Future.error(
          "Impossível de conectar a API\nVocê está conectado ?");
    }
  }
}
