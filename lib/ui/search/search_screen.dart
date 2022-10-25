import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/widgets/images/local_image_widget.dart';
import 'package:weather/common/widgets/images/svg_image_widget.dart';
import '../../common/resource/name_image.dart';
import '../../common/resource/theme_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      backgroundColor: ThemeColor.clr_F8F1F2,
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              ThemeColor.clr_2E335A,
              ThemeColor.clr_1C1B33,
            ]),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height_30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: ThemeColor.clr_FFFFFF,
                        )),
                    Text(
                      'Weather',
                      style:
                          TextStyle(color: ThemeColor.clr_FFFFFF, fontSize: 20),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: SVGImageWidget(
                    url: svg_ic_circle_dot,
                  ),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: width_20),
              color: Colors.transparent,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: ThemeColor.clr_FFFFFF,
                  ),
                  suffixIcon: Icon(
                    Icons.keyboard_voice_sharp,
                    color: ThemeColor.clr_FFFFFF,
                  ),
                  hintText: "Search for a city or airport",
                  hintStyle: TextStyle(color: ThemeColor.clr_FFFFFF),
                ),
              ),
            ),
           Expanded(child:  ListView.separated(
               scrollDirection: Axis.vertical,
               physics: AlwaysScrollableScrollPhysics(),
               shrinkWrap: true,
               padding: EdgeInsets.all(20.0),
               itemBuilder: (context, index)  => Stack(
                 children: [
                   LocalImageWidget(
                     url: ic_background,
                     width: double.infinity,
                     height: height_200,
                   ),
                   
                  const Align(
                    alignment: Alignment.topRight,
                    child:  LocalImageWidget(
                      url: ic_wind,
                      width: 100,
                      height: 100,
                    ),
                  ),
                 ],
               ),
               separatorBuilder: (BuildContext context, int index) => Divider(height: 30,) ,
               itemCount: 4),),

          ],
        ),

      ]),
    );
  }
}
