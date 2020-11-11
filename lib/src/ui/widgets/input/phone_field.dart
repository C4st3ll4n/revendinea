import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revendinea/src/store/announcement/create_store.dart';

class PhoneField extends StatelessWidget {
  CreateStore _createStore;

  PhoneField(this._createStore);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: EdgeInsets.all(6),
        child: CheckboxListTile(
          title: Text("Ocultar meu telefone"),
          value: _createStore.hidePhone,
          onChanged: (bool value) {
            return _createStore.setHidePhone(value);
          },
          activeColor: Colors.purple,
        ),
      ),
    );
  }
}
