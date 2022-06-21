import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:flutter/material.dart';

class ItemServiceWidget extends StatelessWidget {
  final String? title;
  final Icon? image;
  final bool? isSelected;
  const ItemServiceWidget({Key? key, this.title, this.image, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: width_8, bottom: height_8),
      decoration: BoxDecoration(
          color: isSelected!? ThemeColor.clr_FFFFFF: null,
          borderRadius: BorderRadius.all(Radius.circular(radius_8)),
          border: Border.all(color: ThemeColor.clr_FFFFFF, width: 1)),
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              image?.icon,
              color: isSelected!? ThemeColor.clr_323232:ThemeColor.clr_FFFFFF,
            ),
            Text(
              title ?? '',
              style: TextStyle(
                  color: isSelected!? ThemeColor.clr_323232:ThemeColor.clr_FFFFFF,
                  fontSize: fontSize_13,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

