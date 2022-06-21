import 'package:flutter/cupertino.dart';

class VehicleModel {
  int? id;
  String? note;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? engine;
  String? color;
  String? distance;
  String? picture;
  String? pathThumb;
  double? rentalPrice;
  String? rentalType = 'H';
  TextEditingController? textEditingController = TextEditingController();


  VehicleModel(
      {this.id,
        this.note,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.engine,
        this.color,
        this.distance,
        this.picture,
        this.pathThumb,
        this.rentalPrice,
        this.rentalType,
        this.textEditingController,

      }
      );

  VehicleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    engine = json['engine'];
    color = json['color'];
    distance = json['distance'];
    picture = json['picture'];
    pathThumb = json['path_thumb'];

    if(json['pivot'] != null){
      if(json['pivot']['rental_price'] != null){
        rentalPrice = num.tryParse(json['pivot']['rental_price'].toString())?.toDouble() ;
      }
      if(json['pivot']['rental_type'] != null){
        rentalType = json['pivot']['rental_type'];
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rental_type'] = this.rentalType;
    data['rental_price'] = this.textEditingController?.text;
    data['note'] = this.note;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['engine'] = this.engine;
    data['color'] = this.color;
    data['distance'] = this.distance;
    data['picture'] = this.picture;
    data['path_thumb'] = this.pathThumb;
    return data;
  }
}