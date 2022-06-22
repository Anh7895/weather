import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/bloc/home/home_bloc.dart';
import 'package:weather/common/resource/name_image.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/text_style.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/widgets/http_stream_handler.dart';
import 'package:weather/common/widgets/images/local_image_widget.dart';
import 'package:weather/common/widgets/images/svg_image_widget.dart';

import '../../bloc/base_state/base_state.dart';
import '../../common/injector/injector.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = Injector.resolve<HomeBloc>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35.0),
            ),
          ),
          backgroundColor: ThemeColor.clr_2E335A.withOpacity(0.9),
          context: context, builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height /2.5,
          padding: EdgeInsets.only(bottom: height_15,top: height_35),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4.8,
                    child: ListView.builder(
                      itemCount: 30,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: width_15),
                      itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: height_20,horizontal: height_15),
                          margin: EdgeInsets.only(right: width_10),
                          decoration: BoxDecoration(
                            color: ThemeColor.clr_48319D.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(radius_24),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('3 AM',style: TextStyleCommon.textStyleCaption1(context),),
                              SizedBox(height: 10),
                              LocalImageWidget(
                                url: img_cloud_rain,
                                width: width_28,
                                height: width_28,
                              ),
                              SizedBox(height: 10),
                              Text('19 *',style: TextStyleCommon.textStyleCaption1(context)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: ArcClipper(),
                      child: Container(
                        height: 65,
                        color: ThemeColor.clr_262C51.withOpacity(0.5),
                        padding: EdgeInsets.symmetric(horizontal: width_20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                print('left');
                              },
                              child: SVGImageWidget(
                                url: ic_left,
                                width: width_35,
                                height: width_35,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                print('right');
                              },
                              child: SVGImageWidget(
                                url: ic_right,
                                width: width_35,
                                height: width_35,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                        clipper: RPSCustomPainter(),
                        child: Container(
                          alignment: Alignment.center,
                          color: ThemeColor.clr_262C51.withOpacity(0.7),
                          height: 90,
                          width: MediaQuery.of(context).size.width /1.2,
                          child: GestureDetector(
                            onTap: (){
                              print('click');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(500),
                              ),
                              child: SVGImageWidget(
                                url: ic_add,
                                width: width_50,
                                height: width_50,
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
    });

  }


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _bloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: HttpStreamHandler<HomeBloc, BaseState>(
        bloc: _bloc,
        listener: (context, state) async {
        },
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: ThemeColor.clr_F8F1F2,
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    LocalImageWidget(
                      width: w,
                      height: h,
                      url: img_backgound,
                    ),
                    SizedBox(
                      width: w,
                      height: h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Montreal',style: TextStyleCommon.textStyleCaption3(context),),
                          Text('40°',style: TextStyleCommon.textStyleCaption4(context),),
                          Text('Mostly Clear',style: TextStyleCommon.textStyleOpacity(context),),
                          Text('H:24° L:18°',style: TextStyleCommon.textStyleCaption1(context),),
                          LocalImageWidget(
                            url: img_house,
                            width: w /1.3,
                            height: w /1.3,
                          )

                      ],),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

}
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.01123596);
    path_0.cubicTo(0,size.height*0.01123596,size.width*0.1950690,size.height*0.1908112,size.width*0.3256410,size.height*0.2359551);
    path_0.cubicTo(size.width*0.3931769,size.height*0.2593056,size.width*0.4321897,size.height*0.2696629,size.width*0.5000000,size.height*0.2696629);
    path_0.cubicTo(size.width*0.5678103,size.height*0.2696629,size.width*0.6042590,size.height*0.2593056,size.width*0.6717949,size.height*0.2359551);
    path_0.cubicTo(size.width*0.8023667,size.height*0.1908112,size.width,size.height*0.01123596,size.width,size.height*0.01123596);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,size.height*0.01123596);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
class RPSCustomPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width*0.4210526,0);
    path_0.lineTo(size.width*0.5789474,0);
    path_0.cubicTo(size.width*0.6992481,0,size.width*0.7349662,size.height*0.2413980,size.width*0.7734286,size.height*0.4869850);
    path_0.cubicTo(size.width*0.8132519,size.height*0.7412470,size.width*0.8533835,size.height,size.width*0.9849624,size.height);
    path_0.lineTo(size.width*0.01503782,size.height);
    path_0.cubicTo(size.width*0.1466169,size.height,size.width*0.1867496,size.height*0.7412470,size.width*0.2265707,size.height*0.4869850);
    path_0.cubicTo(size.width*0.2650335,size.height*0.2413980,size.width*0.3007523,0,size.width*0.4210526,0);
    path_0.close();
    return path_0;

  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
