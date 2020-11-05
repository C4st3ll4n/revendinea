import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String message;

  const ErrorBox({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message == null || message.isEmpty)
      return Container(
        width: 0,
        height: 0,
      );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.red,
        title: Text(
          "$message",
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Corrija o problema e tente novamente",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.error, color: Colors.white,),
      ),
    );
  }
}
