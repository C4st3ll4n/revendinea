import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String helper;
  final String hint;
  final TextInputType keyboardType;
  final Function(String) action;
  String error;
  bool enable = false;

  FormInput(
      {Key key,
      this.label,
      this.helper,
      this.hint,
      this.keyboardType,
      this.action,
      this.error, this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(alignment: WrapAlignment.start,
          children: [
            Text(
              "$label",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, color: Colors.grey[900]),
            ),
            Text(
              "$helper",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.3,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textAlign: TextAlign.start,
            onChanged: action,
            enabled: enable,
            obscureText: keyboardType==TextInputType.visiblePassword?true:false,
            cursorColor: Colors.orange,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                errorText: error,
                border: OutlineInputBorder(),
                labelText: "$hint"),
            inputFormatters: keyboardType == TextInputType.phone
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ]
                : null,
          ),
        )
      ],
    );
  }
}
