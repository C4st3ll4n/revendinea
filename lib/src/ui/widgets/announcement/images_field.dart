import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revendinea/src/store/announcement/create_store.dart';
import 'package:revendinea/src/ui/widgets/announcement/image_source_modal.dart';

class ImagesField extends StatelessWidget {
  final CreateStore controller;

  ImagesField({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(
        builder: (_) => ListView.builder(
          scrollDirection: Axis.horizontal,
          //itemCount: controller.images.length + 1,
          itemCount: controller.count,
          itemBuilder: (_, indx) {
            bool isLast = indx == controller.images.length;
            if (isLast) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: GestureDetector(
                  onTap: () {
                    if (Platform.isAndroid) {
                      showModalBottomSheet(
                        context: context,
                        builder: _buildImageSource,
                      );
                    } else {
                      showCupertinoModalPopup(
                        context: context,
                        builder: _buildImageSource,
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: FileImage(controller.images.elementAt(indx)),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildImageSource(context) {
    return ImageSourceModal(
      onImageSelected: (File img) {
        controller.images.add(img);
        Navigator.of(context).pop();
      },
    );
  }
}