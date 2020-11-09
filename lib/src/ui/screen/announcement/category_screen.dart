import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:revendinea/src/model/Category.dart';
import 'package:revendinea/src/store/announcement/category_store.dart';
import 'package:revendinea/src/ui/widgets/ErrorBox.dart';

class CategoryScreen extends StatelessWidget {
  final Category selected;
  final bool showAll;
  final CategoryStore _categoryStore = GetIt.I<CategoryStore>();

  CategoryScreen({Key key, this.selected, this.showAll = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(
            builder: (_) {
              if (_categoryStore.error != null) {
                return ErrorBox(
                  message: _categoryStore.error,
                );
              } else if (_categoryStore.categories.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final List<Category> categories = showAll
                    ? _categoryStore.allCategories
                    : _categoryStore.categories;
                return ListView.separated(
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    Category category = categories[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop(category);
                        //_categoryStore.setCategory(category);
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        color: selected == category
                            ? Colors.purple.withAlpha(50)
                            : null,
                        child: Text(
                          "${category.description}",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: selected == category
                                  ? FontWeight.bold
                                  : null),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, _c) {
                    return Divider(
                      height: 0.1,
                      color: Colors.purple,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
