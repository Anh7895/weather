import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/strings.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/material.dart';

class TextStyleCommon {

  static TextStyle bottomButton(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }


  static TextStyle textStyleButton(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? fontSize_16,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }


  static TextStyle font18pxStyleNormal(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 18,
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }


  static TextStyle font24pxStyleNormal(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? height}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        fontSize: 24,
        fontWeight: fontWeight ?? FontWeight.w300,
        color: color ?? ThemeColor.clr_151A35,
        fontFamily: TextConstants.fontInter,
        height: height);
  }

  static TextStyle dialogContentAlertLight(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? Colors.black,
      fontFamily: TextConstants.fontInter,
    );
  }


  static TextStyle textStyleWhiteSmallTitle = TextStyle(
      color: Colors.white,
      fontSize: fontSize_14,
      fontWeight: FontWeight.w700);


  static TextStyle textStyleCaption1(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_14,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }
  static TextStyle textStyleCaption2(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_18,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }
  static TextStyle textStyleCaption3(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_25,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }
  static TextStyle textStyleCaption4(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_60,
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }
  static TextStyle textStyleOpacity(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_14,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeColor.clr_EBEBF599,
      fontFamily: TextConstants.fontInter,
    );
  }
}