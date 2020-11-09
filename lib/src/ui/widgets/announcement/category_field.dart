import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revendinea/src/model/Category.dart';
import 'package:revendinea/src/store/announcement/create_store.dart';
import 'package:revendinea/src/ui/screen/announcement/category_screen.dart';

class CategoryField extends StatelessWidget {
  final CreateStore controller;

  CategoryField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          onTap: () async {
            final Category categoria = await showDialog(
              context: context,
              builder: (_) => CategoryScreen(
                showAll: false,
                selected: controller.category ?? null,
              ),
            );

            if (categoria != null) controller.setCategory(categoria);
          },
          subtitle: Text(
            controller.category?.description ?? "",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          title: Text(
            "Categoria *",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w800,
                fontSize: controller?.category?.description == null ? 18 : 12),
          ),
          trailing: Icon(Icons.keyboard_arrow_down_outlined),
        );
      },
    );
  }
}
