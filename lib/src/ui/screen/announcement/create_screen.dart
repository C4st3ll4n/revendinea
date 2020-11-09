import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revendinea/src/store/announcement/create_store.dart';
import 'package:revendinea/src/ui/widgets/announcement/category_field.dart';
import 'package:revendinea/src/ui/widgets/announcement/images_field.dart';
import 'package:revendinea/src/ui/widgets/drawer/custom_drawer.dart';

class CreateScreen extends StatelessWidget {
  CreateStore _createStore = CreateStore();

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = TextStyle(
        fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w800);

    EdgeInsets contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Criar Anúncio"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 16),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagesField(controller: _createStore),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Titulo *",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Descrição *",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              maxLines: null,
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixText: "R\$",
                labelText: "Preço *",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true)
              ],
            ),
            CategoryField(_createStore),
          ],
        ),
      ),
    );
  }
}
