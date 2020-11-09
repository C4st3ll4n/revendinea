import 'dart:io';

import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final File image;
  final VoidCallback onDelete;

  const ImageDialog({Key key, this.image, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(image),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              child: Text(
                "Remover",
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
