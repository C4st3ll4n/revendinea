import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/Category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @observable
  Category category;

  @action
  setCategory(Category newCategory) => category = newCategory;

  @computed
  int get maxImg => 5;
  int get count => images.length < maxImg ? images.length + 1 : images.length;
  //controller.images.length + 1,
}
