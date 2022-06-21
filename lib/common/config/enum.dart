import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/cupertino.dart';

import '../../datasource/data/local_user_data.dart';

///Enum

///Invoice Type
enum InvoiceType { outstanding, paid, overdue }

enum NotificationType {
  SYSTEM,
  STATION_LIKED,
  STATION_REPLIED,
  STATION_RATED,
  APP_FEEDBACK,
  STATION_FEEDBACK,
  REQUEST_PROCESSED,
  REQUEST_RECEIVED,
  STATION_UPDATE
}

enum MessageType{SEND, RECEIVER, OTHER}

enum SocialType{
  FACEBOOK,
  APPLE,
  GOOGLE
}

enum LoginType{
  SOCIAL,
  ACCOUNT
}

enum ColorType {
  MauDo,
  MauTrang,
  MauDen,
  MauVang,
  MauXanhDam,
  MauXanhLa,
  MauTim,
  MauXam,
}
extension ColorExtension on ColorType {

  Color get color {
    switch (this) {
      case ColorType.MauDo:
        return ThemeColor.clr_BF0000;
      case ColorType.MauTrang:
        return ThemeColor.clr_FFFFFF;
      case ColorType.MauDen:
        return ThemeColor.clr_263238;
      case ColorType.MauVang:
        return ThemeColor.clr_FABB05;
      case ColorType.MauXanhDam:
        return ThemeColor.clr_1B1B4E;
      case ColorType.MauXanhLa:
        return ThemeColor.clr_4584BF;
      case ColorType.MauTim:
        return ThemeColor.clr_8C80F8;
      case ColorType.MauXam:
        return ThemeColor.clr_EAEAEA;
      default:
        return ThemeColor.clr_BF0000;
    }
  }

}
