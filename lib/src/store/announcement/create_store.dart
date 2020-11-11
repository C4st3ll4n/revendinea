import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/Category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  _CreateStore() {
    autorun((_) {
      print(hidePhone);
    });
  }

  ObservableList images = ObservableList();

  @observable
  Category category;

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
