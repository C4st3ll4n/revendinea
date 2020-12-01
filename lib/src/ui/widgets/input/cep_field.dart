import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revendinea/src/store/announcement/create_store.dart';
import 'package:revendinea/src/store/cep_store.dart';

class CepField extends StatelessWidget {
  final CepStore _cepStore;
  final CreateStore createStore;

  CepField(this.createStore) : _cepStore = createStore.cepStore;

  @override
  Widget build(BuildContext context) {
    EdgeInsets contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          onChanged: _cepStore.setCep,
          decoration: InputDecoration(
              labelText: "CEP *",
              errorText: createStore.addressError,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18),
              contentPadding: contentPadding),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter()
          ],
        ),
        Observer(
          builder: (_) {
            if (_cepStore.address == null &&
                _cepStore.error == null &&
                !_cepStore.loading) {
              return Container();
            } else if (_cepStore.address == null && _cepStore.error == null) {
              return LinearProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.purple),
              );
            } else if (_cepStore.error != null) {
              return Container(
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  "${_cepStore.error}",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              final addres = _cepStore.address;
              return Container(
                color: Colors.purple.withAlpha(150),
                height: 50,
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  "Localização:${addres.bairro}, ${addres.city.nome} - ${addres.uf.sigla}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
