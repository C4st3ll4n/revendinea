import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revendinea/src/store/announcement/create_store.dart';
import 'package:revendinea/src/ui/widgets/announcement/category_field.dart';
import 'package:revendinea/src/ui/widgets/announcement/images_field.dart';
import 'package:revendinea/src/ui/widgets/drawer/custom_drawer.dart';
import 'package:revendinea/src/ui/widgets/input/cep_field.dart';
import 'package:revendinea/src/ui/widgets/input/phone_field.dart';

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
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.symmetric(horizontal: 16),
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagesField(controller: _createStore),
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: _createStore.setTitle,
                    decoration: InputDecoration(
                        labelText: "Titulo *",
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        errorText: _createStore.titleError),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: _createStore.setDescription,
                    decoration: InputDecoration(
                      labelText: "Descrição *",
                      labelStyle: labelStyle,
                      errorText: _createStore.descriptionError,
                      contentPadding: contentPadding,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.text,
                  ),
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
                CepField(_createStore),
                PhoneField(_createStore),
                SizedBox(
                  height: 60,
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: null,
                    child: Text(
                      "Enviar",
                      style: TextStyle(fontSize: 18),
                    ),
                    color: Colors.orange,
                    disabledColor: Colors.orange.withAlpha(120),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
