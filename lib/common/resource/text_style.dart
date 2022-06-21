import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/strings.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleCommon {
  static TextStyle displayHeader(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        fontSize: 10,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color ?? ThemeColor.clr_151A35,
        fontFamily: TextConstants.fontInter);
  }

  static TextStyle labelInputText(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        fontSize: 13,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color ?? ThemeColor.clr_151A35,
        fontFamily: TextConstants.fontInter);
  }

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

  static TextStyle titleAppBar(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_16,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle textStyleSubFeature(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_16,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ThemeColor.clr_1472C9,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle titleScreenTab(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_24,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle titleHeader(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_16,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_2D1516,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle textDefault(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? fontSize_13,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ThemeColor.clr_2D1516,
      fontFamily: TextConstants.fontInter,
    );
  }


  static TextStyle nameBill(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_23,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_282828,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle normalTextBill(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? fontSize_16,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_323232,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle font16StyleNormal(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? fontSize_14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? ThemeColor.clr_3E3E3E,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle textButtonUnderline(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? fontSize_14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? ThemeColor.clr_EF4C5E,
      decoration: TextDecoration.underline,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle font12pxStyleNormal(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_12,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ThemeColor.clr_002113,
      fontFamily: TextConstants.fontInter,
      height: 2,
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

  static TextStyle font14pxStyleNormal(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle font16pxStyleNormal(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w400,
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

  static TextStyle font18pxStyleUnderline(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle dialogTitleAlert(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_16,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_323232,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle dialogContentAlert(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }

  static Future<TextStyle> overallContent(BuildContext context,
      {Color? color, FontWeight? fontWeight}) async {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 36,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle overallContent48px(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: 48,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle overallTitle(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .bodyText1!
        .copyWith(
      fontSize: 13,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle textTitleHL1(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle buttonText14px(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ThemeColor.clr_151A35,
      fontFamily: TextConstants.fontInter,
    );
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

  static TextStyle textStyleNormalTitle = TextStyle(
      color: ThemeColor.clr_136849,
      fontSize: fontSize_16,
      fontWeight: FontWeight.w700);

  static TextStyle textStyleWhiteNormalTitle = TextStyle(
      color: Colors.white,
      fontSize: fontSize_16,
      fontWeight: FontWeight.w700);

  static TextStyle textStyleSmallTitle = TextStyle(
      color: ThemeColor.clr_136849,
      fontSize: fontSize_14,
      fontWeight: FontWeight.w700);

  static TextStyle textStyleAppbar = TextStyle(
      color: ThemeColor.clr_FFFFFF,
      fontSize: fontSize_16,
      fontWeight: FontWeight.w700);

  static TextStyle textStyleWhiteSmallTitle = TextStyle(
      color: Colors.white,
      fontSize: fontSize_14,
      fontWeight: FontWeight.w700);

  static TextStyle textStyleWhiteSmallContent = TextStyle(
      color: Colors.white,
      fontSize: fontSize_14,
      fontWeight: FontWeight.normal);

  static TextStyle textStyleSmallContent = TextStyle(
      color: ThemeColor.clr_136849,
      fontSize: fontSize_14,
      fontWeight: FontWeight.normal);

  static TextStyle textStyleBodyInform(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_16,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ThemeColor.clr_2D1516,
      fontFamily: TextConstants.fontInter,
    );
  }

//FeedBackStation
  static TextStyle textStyleChooseCard(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ThemeColor.clr_2D1516,
      fontFamily: TextConstants.fontInter,
    );
  }

  static TextStyle textStyleUnChooseCard(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      fontSize: fontSize_14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ThemeColor.clr_FFFFFF,
      fontFamily: TextConstants.fontInter,
    );
  }
}