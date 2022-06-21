import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:weather/common/resource/sizes.dart';

import '../../../datasource/data/local_user_data.dart';

class WebImageWidget extends StatelessWidget {
  final String? urlImage;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;

  const WebImageWidget(
      {Key? key,
      this.urlImage,
      this.width,
      this.height,
      this.boxFit,
      this.borderRadius,
      this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> getAuthenticationHeader() {
      return {
        'X-Auth-Token':'${LocalUserData.getInstance.chat_token}',
        'X-User-Id':'${LocalUserData.getInstance.chat_id}',
      };
    }
    return CachedNetworkImage(
      imageUrl: urlImage??"",
      httpHeaders: getAuthenticationHeader(),
      errorWidget: (context, url, error) => Icon(Icons.error, size: 56,),
      imageBuilder: (context, imageProvider) => Container(
        height: height?? MediaQuery.of(context).size.height,
        width: width?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius:
              borderRadius != null ? borderRadius : BorderRadius.circular(10),
          image: DecorationImage(
              image: imageProvider,
              fit: boxFit != null ? boxFit : BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => Container(
        height: height?? MediaQuery.of(context).size.height,
        child: Center(
          child: placeholder?? Container(
            width: height_32,
            height: height_32,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
