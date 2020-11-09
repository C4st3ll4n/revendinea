import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @computed
  int get maxImg => 5;
  int get count => images.length < maxImg ? images.length + 1 : images.length;
  //controller.images.length + 1,
}
