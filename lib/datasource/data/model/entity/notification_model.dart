import 'package:weather/common/config/enum.dart';
import 'package:flutter/material.dart';

class NotificationModel {

  String? id;
  String? type;
  dynamic createdAt;
  bool? isRead;

  String? title;
  String? titleHtml;
  String? body;
  String? image;
  dynamic idNavigatorDetail;
  String? stationRequestType;
  dynamic rateId;
  dynamic stationId;
  dynamic replyId;

  NotificationModel({
    this.id,
    this.type,
    this.createdAt,
    this.isRead,
    this.title,
    this.titleHtml,
    this.body,
    this.image,
    this.stationRequestType,
    this.idNavigatorDetail,
    this.rateId,
    this.stationId,
    this.replyId,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    var rawReadAt = json['read_at'];
    isRead = rawReadAt != null;
    var data = json["data"];
    type = data == null ? null : data["type"];
    title = data == null ? null : data["title"];
    titleHtml = data == null ? null : data["title_html"];
    body = data == null ? null : data["body"];
    image = data == null ? null : data["image"];
    idNavigatorDetail = data == null ? null : data["id_navigator_detail"];
    rateId = data == null ? null : data["rate_id"];
    stationRequestType = data == null ? null : data["station_request_type"];
    stationId = data == null ? null : data["station_id"];
    replyId = data == null ? null : data["reply_id"];
  }

  NotificationModel.fromStatusBarNoti(json) {
    var data = json;
    print("data $data");
    type = data == null ? null : data["type"];
    title = data == null ? null : data["title"];
    titleHtml = data == null ? null : data["title_html"];
    body = data == null ? null : data["body"];
    image = data == null ? null : data["image"];
    idNavigatorDetail = data == null ? null : data["id_navigator_detail"];
    stationRequestType = data == null ? null : data["station_request_type"];
    rateId = data == null ? null : data["rate_id"];
    stationId = data == null ? null : data["station_id"];
    replyId = data == null ? null : data["reply_id"];
  }

  NotificationModel copyWith({
    String? id,
    String? type,
    dynamic createdAt,
    bool? isRead,
    String? title,
    String? titleHtml,
    String? body,
    String? image,
    String? stationRequestType,
    dynamic idNavigatorDetail,
    dynamic rateId,
    dynamic stationId,
    dynamic replyId,
  }) {
    return new NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      title: title ?? this.title,
      titleHtml: titleHtml ?? this.titleHtml,
      body: body ?? this.body,
      image: image ?? this.image,
      stationRequestType: stationRequestType ?? this.stationRequestType,
      idNavigatorDetail: idNavigatorDetail ?? this.idNavigatorDetail,
      rateId: rateId ?? this.rateId,
      stationId: stationId ?? this.stationId,
      replyId: replyId ?? this.replyId,
    );
  }
}

extension TypeNotification on NotificationType{
  Icon get icon {
    switch (this){
      case NotificationType.SYSTEM:
        return Icon(
          Icons.notifications,
          color: Color(0XFF1F87FE),
          size: 20,
        );
      case NotificationType.STATION_LIKED:
        return Icon(
          Icons.favorite,
          color: Color(0XFFEF4C5E),
          size: 20,
        );
      case NotificationType.STATION_REPLIED:
        return Icon(
          Icons.reply,
          color: Color(0XFF1F87FE),
          size: 20,
        );
      case NotificationType.STATION_RATED:
        return Icon(
          Icons.grade,
          color: Color(0XFFFFD705),
          size: 20,
        );
      case NotificationType.APP_FEEDBACK:
        return Icon(
          Icons.notifications,
          color: Color(0XFF1F87FE),
          size: 20,
        );
      case NotificationType.STATION_FEEDBACK:
        return Icon(
          Icons.email,
          color: Color(0XFFFBBC05),
          size: 20,
        );
      case NotificationType.REQUEST_PROCESSED:
        return Icon(
          Icons.ev_station,
          color: Color(0XFF1F87FE),
          size: 20,
        );
      case NotificationType.REQUEST_RECEIVED:
        return Icon(
          Icons.notifications,
          color: Color(0XFF1F87FE),
          size: 20,
        );
      case NotificationType.STATION_UPDATE:
        return Icon(
          Icons.create,
          color: Color(0XFF1F87FE),
          size: 20,
        );
      default:
        return Icon(
          Icons.notifications,
          color: Color(0XFF1F87FE),
          size: 20,
        );
    }
  }


}

