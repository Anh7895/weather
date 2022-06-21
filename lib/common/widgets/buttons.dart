
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/common/resource/strings.dart';
import 'package:weather/common/resource/text_style.dart';
import 'package:weather/common/resource/theme_color.dart';

///
/// A [Widget] provides a button with common UI style
class BottomButton extends StatelessWidget {
  final Color? backgroundColor;
  final onPressed;
  final EdgeInsets? padding;
  final double? cornerRadius;
  final String? title;
  final Color? titleColor;
  final Size? size;
  final double? elevation;

  const BottomButton(
      {Key? key,
      this.backgroundColor = ThemeColor.clr_F36F21,
      this.cornerRadius = 8,
      this.padding ,
      required this.onPressed,
      this.title = "",
      this.titleColor = Colors.white,
      this.size,
      this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding??EdgeInsets.all(2),
      child: Material(
        shadowColor: backgroundColor,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius??10)),
        child: SizedBox(
          width: size!.width,
          height: size!.height,
          child: RaisedButton(
              elevation: 2.0,
              child: Text(title!,
                  style: TextStyleCommon.bottomButton(context,
                      color: titleColor ?? Colors.white,
                      fontWeight: FontWeight.bold)),
              color: backgroundColor,
              disabledColor: ThemeColor.clr_ECECEC,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                 /* side: BorderSide(color: backgroundColor)*/),
              onPressed: onPressed),
        ),
      ),
    );
  }
}
