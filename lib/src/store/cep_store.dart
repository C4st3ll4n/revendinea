import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/address.dart';
import 'package:revendinea/src/repository/cep_repository.dart';
import 'package:revendinea/src/repository/igbe_repository.dart';

part 'cep_store.g.dart';

class CepStore = _CepStore with _$CepStore;

abstract class _CepStore with Store {
  _CepStore() {
    autorun((_) {
      if (isValid) {
        _searchCEP();
      } else {
        _reset();
      }
    });
  }

  @observable
  Address address;

  @observable
  String cep = "", error;

  @observable
  bool loading;

  @action
  setCep(String newCep) => cep = newCep;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');
  bool get isValid => clearCep.length >= 8;

  @action
  Future<void> _searchCEP() async {
    loading = true;

    try {
      address = await CepRepository(IBGERepository()).getAddress(cep);
      error = null;
    } catch (e) {
      error = e.toString();
      address = null;
    }

    loading = false;
  }

  @action
  void _reset() {
    loading = true;

    error = null;
    address = null;

    loading = false;
  }
}
