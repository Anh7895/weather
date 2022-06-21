import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/material.dart';

class LocalImageWidget extends StatelessWidget {
  ///The height image
  final double? height;

  ///The width image
  final double? width;

  ///The url local image
  final String? url;

  final BoxFit? boxFit;

  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;

  const LocalImageWidget(
      {Key? key,
        this.height,
        this.width,
        this.url,
        this.boxFit,
        this.margin,
        this.padding,
        this.child,
        this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?? MediaQuery.of(context).size.height,
      width: width?? MediaQuery.of(context).size.width,
      margin: margin??EdgeInsets.all(0),
      padding: padding?? EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius:
        borderRadius != null ? borderRadius : BorderRadius.circular(0),
        image: DecorationImage(
          image: AssetImage(
            url!,
          ),
          fit: boxFit != null ? boxFit : BoxFit.cover,
        ),
      ),
      child: child??null,
    );
  }
}
