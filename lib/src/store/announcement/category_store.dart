import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/Category.dart';
import 'package:revendinea/src/repository/CategoryRepository.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  _CategoryStore() {
    _loadCategories();
  }

  @observable
  String error;

  @action
  setError(String newError) => error = newError;

  ObservableList<Category> categories = ObservableList();

  @computed
  List<Category> get allCategories =>
      List.from(categories)..insert(0, Category("*", "Todas"));

  Future<void> _loadCategories() async {
    try {
      final List<Category> repoCategories =
          await CategoryRepository().getList();
      categories.clear();
      categories.addAll(repoCategories);
    } catch (e) {
      print(e);
      setError(e.toString());
    }
  }
}
