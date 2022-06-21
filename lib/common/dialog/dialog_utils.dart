import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/strings.dart';
import 'package:weather/common/utils/file_manager.dart';

Future<void> showAddPhotoDialog(BuildContext context, {Function(String?)? handlePickedFile}){
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: width_15),
            child: Text(
              TextConstants.textSelectAPhoto,
              style: TextStyle(color: Colors.black),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  onTap: () async {
                    final file = await pickImage(ImageSource.camera);
                    if(handlePickedFile == null){
                      Navigator.pop(context);
                      return;
                    }
                    handlePickedFile(await compressFile(file));
                    Navigator.pop(context);
                  },
                  title: Text(TextConstants.textTakePhoto),
                ),
                ListTile(
                  onTap: () async {
                    final file = await pickImage(ImageSource.gallery);
                    if(handlePickedFile == null){
                      Navigator.pop(context);
                      return;
                    }
                    handlePickedFile(await compressFile(file));
                    Navigator.pop(context);
                  },
                  title: Text(TextConstants.textChooseFromLibrary),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Padding(
                padding: EdgeInsets.all(height_8),
                child: new Text(
                  'Cancel'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        );
      });
}