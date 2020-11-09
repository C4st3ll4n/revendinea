import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  final Function(File) onImageSelected;

  const ImageSourceModal({Key key, this.onImageSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? BottomSheet(
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlatButton(
                    onPressed: getFromCamera,
                    child: Text("Câmera"),
                  ),
                  FlatButton(
                    onPressed: getFromGalery,
                    child: Text("Galeria"),
                  ),
                ],
              );
            },
            onClosing: () {},
          )
        : CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
              onPressed: Navigator.of(context).pop,
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.red),
              ),
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: getFromCamera,
                child: Text("Câmera"),
              ),
              CupertinoActionSheetAction(
                onPressed: getFromGalery,
                child: Text("Galeria"),
              )
            ],
          );
  }

  Future<void> getFromCamera() async {
    //_imageSeletected(await _getImagePath(ImageSource.camera));
    final File image = await _getImagePath(ImageSource.camera);
    if (image == null) return;
    _imageSeletected(image);
  }

  Future<void> getFromGalery() async {
    //_imageSeletected(await _getImagePath(ImageSource.gallery));
    File img = await _getImagePath(ImageSource.gallery);
    if (img == null) return;
    _imageSeletected(img);
  }

  Future<File> _getImagePath(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile == null) return null;
    return File(pickedFile?.path) ?? null;
  }

  Future<void> _imageSeletected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Editar imagem",
        toolbarWidgetColor: Colors.white,
        toolbarColor: Colors.purple,
      ),
      iosUiSettings: IOSUiSettings(
        title: "Editar imagem",
        cancelButtonTitle: "Cancelçar",
        doneButtonTitle: "Concluir",
      ),
    );
    if (croppedFile != null) onImageSelected(croppedFile);
  }
}
