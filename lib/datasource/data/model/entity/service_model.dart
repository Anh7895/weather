import 'package:flutter/cupertino.dart';

class ServiceStationModel {
  String? key;
  String? name;
  Icon? imageAssets;
  String? note;
  bool? isSelected;

  ServiceStationModel(
      {this.key, this.name, this.imageAssets, this.note, this.isSelected});

}
