import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class DecodeParam {
  final File file;
  final SendPort sendPort;

  DecodeParam(this.file, this.sendPort);
}

class ResizeConfig {
  final int width;
  final int height;
  final int quality;

  ResizeConfig(this.width, this.height, this.quality);
}

//Writing to a text file
Future<File?> writeTextFile(String text, String fileName,
    {Function(Exception)? handleException}) async {
  try {
    final File file = File('$_localPath/$fileName');
    File result = await file.writeAsString(text);
    return result;
  } on FileSystemException catch (exception) {
    // if rename fails, copy the source file and then delete it
    print("Couldn't write file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't write file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

//Reading from a text file
Future<String> read(String filePath,
    {Function(Exception)? handleException}) async {
  String text = "";
  try {
    final File file = File(filePath);
    text = await file.readAsString();
  } on FileSystemException catch (exception) {
    // if rename fails, copy the source file and then delete it
    print("Couldn't read file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't read file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
  return text;
}

// Find the correct local path
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

void decodeIsolate(DecodeParam param) {
  // Read an image from file (webp in this case).
  // decodeImage will identify the format of the image and use the appropriate
  // decoder.
  var image = decodeImage(param.file.readAsBytesSync());
  // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
  if (image != null) {
    var thumbnail = copyResize(image, width: 120);
    param.sendPort.send(thumbnail);
  }
}

// Decode and process an image file in a separate thread (isolate) to avoid
// stalling the main UI thread.
Future<File?> resizeImage({String? filePath, String? newFilePath}) async {
  var receivePort = ReceivePort();

  if (filePath != null) {
    await Isolate.spawn(
        decodeIsolate, DecodeParam(File(filePath), receivePort.sendPort));
  }

// Get the processed image from the isolate.
  var image = await receivePort.first;
  if (newFilePath != null) {
    return await File(newFilePath).writeAsBytes(encodePng(image));
  }
}

Future<File?> copyFile(File sourceFile, String newPath,
    {Function(Exception)? handleException}) async {
  try {
    // prefer using rename as it is probably faster
    // return await sourceFile.rename(newPath);
    final newFile = await sourceFile.copy(newPath);
    return newFile;
  } on FileSystemException catch (exception) {
    print("Couldn't copy file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't copy file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

Future<File?> moveFile(File sourceFile, String newPath,
    {Function(Exception)? handleException}) async {
  try {
    // prefer using rename as it is probably faster
    return await sourceFile.rename(newPath);
  } on FileSystemException catch (exception) {
    print("Couldn't move file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't move file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

Future<String?> createFolderInAppDocDir(String folderName,
    {Function(Exception)? handleException}) async {
  //Get this App Document Directory
  try {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
    Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
      await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  } on FileSystemException catch (exception) {
    print("Couldn't create folder $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't create folder $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

Future<String?> createFolderIfNotExist(String folderName,
    {Function(Exception)? handleException}) async {
  //Get this App Document Directory
  try {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
    Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists delete it
      await _appDocDirFolder.delete(recursive: true);
    }
    final Directory _appDocDirNewFolder =
    await _appDocDirFolder.create(recursive: true);
    return _appDocDirNewFolder.path;
  } on FileSystemException catch (exception) {
    print("Couldn't create folder $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't create folder $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

Future<File?> decodeImageBase64(String encodedStr,
    {Function(Exception)? handleException}) async {
  try {
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime
            .now()
            .millisecondsSinceEpoch
            .toString() + ".pdf");
    await file.writeAsBytes(bytes);
    return file;
  } on FileSystemException catch (exception) {
    print("Couldn't decode base64 $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't decode base64 $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

String? encodeBase64(String filePath, {Function(Exception)? handleException}) {
  try {
    final bytes = File(filePath).readAsBytesSync();

    String img64 = base64Encode(bytes);
    return img64;
  } on FileSystemException catch (exception) {
    print("Couldn't encode base64 $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't encode base64 $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

Future<File?> compressedFileImage({File? file,
  ResizeConfig? config,
  Function(Exception)? handleException}) async {
  try {
    // set witch and height in file
    int targetWidth;
    int targetHeight;
    if (file == null || config == null) {
      return null;
    }
    ImageProperties properFile =
    await FlutterNativeImage.getImageProperties(file.path);

    var imFile = await decodeImageFromList(file.readAsBytesSync());

    if (properFile.width == imFile.width) {
      targetWidth = config.width;
      targetHeight = properFile.height! * config.width ~/ properFile.width!;
    } else {
      targetHeight = config.width;
      targetWidth = properFile.width! * targetHeight ~/ properFile.height!;
    }

    //crop file image
    File compressedFile = await FlutterNativeImage.compressImage(
      file.path,
      quality: config.quality,
      targetWidth: targetWidth,
      targetHeight: targetHeight,
    );
    String? directory = await createFolderInAppDocDir("BaseFolder");
    if (directory != null) {
      File(directory).deleteSync(recursive: true);
    }
    // return
    return compressedFile;
  } on FileSystemException catch (exception) {
    print("Couldn't compress file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  } on Exception catch (exception) {
    print("Couldn't compress file $exception");
    if (handleException != null) {
      handleException(exception);
    }
  }
}

Future<String?> pickImage(ImageSource imageSource,
    {double? maxWidth,
      double? maxHeight,
      int? imageQuality,
      CameraDevice preferredCameraDevice = CameraDevice.rear}) async {
  final ImagePicker _picker = ImagePicker();
  XFile? image = await _picker.pickImage(
      source: imageSource,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality
      preferredCameraDevice: preferredCameraDevice
  );
  return image?.path;
}

Future<List<PickedFile>?> pickMultiImage(ImageSource imageSource,
    {double? maxWidth,
      double? maxHeight,
      int? imageQuality,
      CameraDevice preferredCameraDevice = CameraDevice.rear}) async {
  final ImagePicker _picker = ImagePicker();
  List<PickedFile>? images = await _picker.getMultiImage(
      imageQuality: imageQuality
  );

  List<String> listPathImage = [];
  images?.forEach((element) {
    listPathImage.add(element.path);
  });
  return images;
}

Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  return result?.files.single.path;
}

Future<String?> pickCustomFile({FileType type = FileType.any,
  List<String>? allowedExtensions}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: type,
    allowedExtensions: allowedExtensions,
  );
  return result?.files.single.path;
}
Future<String?> compressFile(String? path) async{
  print("aaaaaaaaaaaaaaaaaaaaaaaaa $path");
  if(path == null)
    return null;

  File compressedFile = await FlutterNativeImage.compressImage(path,
    quality: 5,);
  print("aaaaaaaaaaaaaaaaaaaaaaaaa ${await compressedFile.length()}");
  print("aaaaaaaaaaaaaaaaaaaaaaaaa $path");
  return compressedFile.path;
}
Future<MultipartFile?> compressImage(File? selected) async {
  File? compressedImage = await FlutterNativeImage.compressImage(selected!.path,
    quality: 100,);
  int? quality = 100;
  int byte = selected.lengthSync();
  print("${byte}byte");
  double t_quality = 102400000/byte;

  if(t_quality >100) t_quality = 100;

  if(byte > 1024000 && byte < 2048000){
    quality = 60;
  }else if(byte > 2024000 && byte < 3048000){
    quality = 50;
  }else if(byte > 3048000 && byte < 4024000){
    quality = 40;
  }else if(byte > 4024000 && byte < 5048000){
    quality = 30;
  }else if(byte > 5024000 ){
    quality = 20;
  }

  print("Size in ${selected.lengthSync()}");

  MultipartFile? multipartFileAvatar;
  if (selected.lengthSync() > 1024000 ) {
    compressedImage = await FlutterNativeImage.compressImage(selected.path,
      percentage: quality, quality: 70);
    multipartFileAvatar = await MultipartFile.fromFile(compressedImage.path);
  } else {
    multipartFileAvatar = await MultipartFile.fromFile(compressedImage.path);
  }
  print("Size out ${multipartFileAvatar.length}");
  return multipartFileAvatar;
}


