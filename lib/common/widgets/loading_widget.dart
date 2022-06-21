import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: color??ThemeColor.clr_323232.withOpacity(0.3),
          child: Center(
              child: Container(
                width: width_24,
                height: width_24,
                child: CircularProgressIndicator(),
              ))),
    );
  }
}
