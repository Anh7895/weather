class StatisticModel {
  int? id;
  int? userId;
  String? serviceType;
  String? timeStart;
  String? timeEnd;
  String? unit;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? stationId;
  int? vehicleId;
  String? chargerId;
  Vehicle? vehicle;
  String? charger;

  StatisticModel(
      {this.id,
        this.userId,
        this.serviceType,
        this.timeStart,
        this.timeEnd,
        this.unit,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.stationId,
        this.vehicleId,
        this.chargerId,
        this.vehicle,
        this.charger});

  StatisticModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceType = json['service_type'];
    timeStart = json['time_start'];
    timeEnd = json['time_end'];
    unit = json['unit'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stationId = json['station_id'];
    vehicleId = json['vehicle_id'];
    chargerId = json['charger_id'];
    vehicle =
    json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
    charger = json['charger'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_type'] = this.serviceType;
    data['time_start'] = this.timeStart;
    data['time_end'] = this.timeEnd;
    data['unit'] = this.unit;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['station_id'] = this.stationId;
    data['vehicle_id'] = this.vehicleId;
    data['charger_id'] = this.chargerId;
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
    }
    data['charger'] = this.charger;
    return data;
  }
}

class Vehicle {
  int? id;
  Null? note;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? name;
  String? engine;
  String? color;
  String? distance;
  String? picture;
  String? pathThumb;

  Vehicle(
      {this.id,
        this.note,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.engine,
        this.color,
        this.distance,
        this.picture,
        this.pathThumb});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    engine = json['engine'];
    color = json['color'];
    distance = json['distance'];
    picture = json['picture'];
    pathThumb = json['path_thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['name'] = this.name;
    data['engine'] = this.engine;
    data['color'] = this.color;
    data['distance'] = this.distance;
    data['picture'] = this.picture;
    data['path_thumb'] = this.pathThumb;
    return data;
  }
}