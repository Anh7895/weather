import 'package:weather/common/resource/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final double? height, width;
  final EdgeInsets? padding, margin;
  final Color? backgroundColor, colorText;
  final String? title;
  final TextStyle? style;
  final VoidCallback? onPressed;

  const BaseButton(
      {Key? key,
      this.height,
      this.width,
      this.padding,
      this.margin,
      this.title,
      this.backgroundColor,
      this.colorText,
      this.style,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        margin: margin ??
            EdgeInsets.symmetric(vertical: width_4, horizontal: width_8),
        padding: padding ?? EdgeInsets.all(height_8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? ThemeColor.clr_E7EFFF,
            borderRadius: BorderRadius.all(Radius.circular(radius_8))),
        child: Text(
          "$title",
          style: style ?? TextStyleCommon.textStyleWhiteSmallTitle,
        ),
      ),
    );
  }
}
