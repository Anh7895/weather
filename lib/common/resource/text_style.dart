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
    );
  }
  static TextStyle textStyleCaption22(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 11,
        letterSpacing: 0.06599999964237213,
        fontWeight: FontWeight.normal,
    );
  }
  static TextStyle textStyleCaption11(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 12,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
    );
  }
  static TextStyle textStyleFootnote(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 13,
        letterSpacing: -0.07800000160932541,
        fontWeight: FontWeight.normal,
        height: 1.3846153846153846
    );
  }
  static TextStyle textStyleSubheadline(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 15,
        letterSpacing: -0.23999999463558197,
        fontWeight: FontWeight.normal,
        height: 1.3333333333333333
    );
  }
  static TextStyle textStyleCallout(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 16,
        letterSpacing: -0.3199999928474426,
        fontWeight: FontWeight.normal,
        height: 1.3125
    );
  }
  static TextStyle textStyleBody(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 17,
        letterSpacing: -0.40799999237060547,
        fontWeight: FontWeight.normal,
        height: 1.2941176470588236
    );
  }
  static TextStyle textStyleHeadline(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 17,
        letterSpacing: -0.40799999237060547,
        fontWeight: FontWeight.normal,
        height: 1.2941176470588236
    );
  }
  static TextStyle textStyleTitle3(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 20,
        letterSpacing: 0.3799999952316284,
        fontWeight: FontWeight.normal,
        height: 1.2
    );
  }
  static TextStyle textStyleTitle2(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 22,
        letterSpacing: 0.3499999940395355,
        fontWeight: FontWeight.normal,
        height: 1.2727272727272727
    );
  }
  static TextStyle textStyleTitle1(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 28,
        letterSpacing: 0.36399999260902405,
        fontWeight: FontWeight.normal,
        height: 1.2142857142857142
    );
  }
  static TextStyle textStyleLargeTitle(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 34,
        letterSpacing: 0.37400001287460327,
        fontWeight: FontWeight.normal,
        height: 1.2058823529411764
    );
  }
  static TextStyle textStyleCaption22Bold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      color: ThemeColor.clr_FFFFFF,
      fontSize: 11,
      letterSpacing: 0.06599999964237213,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle textStyleCaption11Bold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
      color: ThemeColor.clr_FFFFFF,
      fontSize: 12,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle textStyleFootnoteBold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 13,
        letterSpacing: -0.07800000160932541,
        fontWeight: FontWeight.bold,
        height: 1.3846153846153846
    );
  }
  static TextStyle textStyleSubheadlineBold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 15,
        letterSpacing: -0.23999999463558197,
        fontWeight: FontWeight.bold,
        height: 1.3333333333333333
    );
  }
  static TextStyle textStyleCalloutBold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 16,
        letterSpacing: -0.3199999928474426,
        fontWeight: FontWeight.bold,
        height: 1.3125
    );
  }
  static TextStyle textStyleBodyBold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 17,
        letterSpacing: -0.40799999237060547,
        fontWeight: FontWeight.bold,
        height: 1.2941176470588236
    );
  }
  static TextStyle textStyleHeadlineBold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 17,
        letterSpacing: -0.40799999237060547,
        fontWeight: FontWeight.bold,
        height: 1.2941176470588236
    );
  }
  static TextStyle textStyleTitle3Bold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 20,
        letterSpacing: 0.3799999952316284,
        fontWeight: FontWeight.bold,
        height: 1.2
    );
  }
  static TextStyle textStyleTitle2Bold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 22,
        letterSpacing: 0.3499999940395355,
        fontWeight: FontWeight.bold,
        height: 1.2727272727272727
    );
  }
  static TextStyle textStyleTitle1Bold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 28,
        letterSpacing: 0.36399999260902405,
        fontWeight: FontWeight.bold,
        height: 1.2142857142857142
    );
  }
  static TextStyle textStyleLargeTitleBold(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return Theme
        .of(context)
        .textTheme
        .headline1!
        .copyWith(
        color: ThemeColor.clr_FFFFFF,
        fontSize: 34,
        letterSpacing: 0.37400001287460327,
        fontWeight: FontWeight.bold,
        height: 1.2058823529411764
    );
  }
}