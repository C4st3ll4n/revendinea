import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/Category.dart';
import 'package:revendinea/src/model/address.dart';
import 'package:revendinea/src/store/cep_store.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  _CreateStore() {
    autorun((_) {
      print(hidePhone);
    });
  }

  CepStore cepStore = CepStore();

  @computed
  Address get address => cepStore.address;
  @computed
  bool get addressValid => address != null;
  @computed
  String get addressError {
    if (addressValid)
      return null;
    else
      return "Campo obrigatório";
  }

  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError {
    if (imagesValid)
      return null;
    else
      return "Insira pelo menos uma imagem";
  }

  @observable
  String title = "";

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title != null && title.length > 6;

  String get titleError {
    if (title == null || titleValid)
      return null;
    else if (title.isEmpty)
      return "Titulo não pode estar vazio";
    else
      return "Titulo muito pequeno";
  }

  @observable
  String description = "";

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description != null && description.length > 16;
  @computed
  String get descriptionError {
    if (description == null || descriptionValid)
      return null;
    else if (title.isEmpty)
      return "Descrição não pode estar vazia";
    else
      return "Descrição muito pequena";
  }

  @observable
  Category category;

  @computed
  bool get categoryValid => category != null;

  String get categoryError {
    if (categoryValid)
      return null;
    else
      return "Campo obrigatório";
  }

  @observable
  bool hidePhone = true;

  @action
  setHidePhone(bool newValue) {
    hidePhone = newValue;
  }

  @action
  setCategory(Category newCategory) => category = newCategory;

  @computed
  int get maxImg => 5;
  int get count => images.length < maxImg ? images.length + 1 : images.length;
  //controller.images.length + 1,
}
