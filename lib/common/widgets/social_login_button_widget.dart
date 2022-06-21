import 'package:flutter/material.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  /// The text name Social
  final String? loginName;

  /// The image asset Svg Logo Social
  final String? imageAssetsSvg;

  /// The image asset Png Logo Social
  final String? imageAssetsPng;

  /// The callback that is be called when the button is press
  final doLogin;

  /// The widget replaces default widget
  final Widget? customWidget;

  /// The width of the button.
  final double? width;

  /// The width of the button.
  final double? height;

  /// The size of Icon
  final double? size;

  /// The style text name
  final TextStyle? styleName;

  /// The color card background
  final Color colorBackground;

  const SocialLoginButton(
      {Key? key,
      this.imageAssetsSvg,
      this.loginName,
      this.imageAssetsPng,
      required this.doLogin,
      this.customWidget,
      this.width = 56,
      this.height = 56,
      this.size = 24,
      this.styleName,
      this.colorBackground = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: doLogin,
        child: customWidget == null
            ? Card(
                elevation: 2,
                color: colorBackground,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(46))),
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: height,
                  width: width,
                  child: imageAssetsPng != null
                      ? Image.asset(
                          imageAssetsPng!,
                          width: size,
                          height: size,
                        )
                      : SvgPicture.asset(
                          imageAssetsSvg!,
                          width: size,
                          height: size,
                        ),
                ),
              )
            : customWidget);
  }
}
