import 'dart:ui';

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
    // WidgetsBinding.instance?.addPostFrameCallback((_) async {
    //   showModalBottomSheet(
    //       isDismissible: false,
    //       enableDrag: false,
    //       barrierColor: Colors.transparent,
    //       shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.vertical(
    //           top: Radius.circular(35.0),
    //         ),
    //       ),
    //       backgroundColor: ThemeColor.clr_2E335A.withOpacity(0.9),
    //       context: context, builder: (BuildContext context) {
    //     return Container(
    //       height: 90,
    //       padding: EdgeInsets.only(top: height_35),
    //       child: Stack(
    //         children: [
    //           Align(
    //             alignment: Alignment.bottomCenter,
    //             child: Transform.scale(
    //               scale: 1.01,
    //               child: CustomPaint(
    //                 painter: BottomCenterCustomPainters(),
    //                 child: Container(
    //                   height: 65,
    //                   padding: EdgeInsets.symmetric(horizontal: width_20),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       GestureDetector(
    //                         onTap: (){
    //                           print('left');
    //                         },
    //                         child: SVGImageWidget(
    //                           url: ic_left,
    //                           width: width_35,
    //                           height: width_35,
    //                         ),
    //                       ),
    //                       GestureDetector(
    //                         onTap: (){
    //                           print('right');
    //                         },
    //                         child: SVGImageWidget(
    //                           url: ic_right,
    //                           width: width_35,
    //                           height: width_35,
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Align(
    //             alignment: Alignment.bottomCenter,
    //             child: Stack(
    //               children: [
    //                 CustomPaint(
    //                     painter: BottomCustomPainter(),
    //                     child: Container(
    //                       alignment: Alignment.center,
    //                       height: 90,
    //                       width: MediaQuery.of(context).size.width /1.2,
    //                       child: GestureDetector(
    //                         onTap: (){
    //                           print('click');
    //                         },
    //                         child: Container(
    //                           decoration: BoxDecoration(
    //                             color: Colors.white,
    //                             borderRadius: BorderRadius.circular(500),
    //                           ),
    //                           child: SVGImageWidget(
    //                             url: ic_add,
    //                             width: width_50,
    //                             height: width_50,
    //                           ),
    //                         ),
    //                       ),
    //                     )
    //                 ),
    //               ],
    //             )
    //           ),
    //         ],
    //       ),
    //     );
    //   });
    // });
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
        listener: (context, state) async {},
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
                          Text(
                            'Montreal',
                            style: TextStyleCommon.textStyleCaption3(context),
                          ),
                          Text(
                            '40°',
                            style: TextStyleCommon.textStyleCaption4(context),
                          ),
                          Text(
                            'Mostly Clear',
                            style: TextStyleCommon.textStyleOpacity(context),
                          ),
                          Text(
                            'H:24° L:18°',
                            style: TextStyleCommon.textStyleCaption1(context),
                          ),
                          LocalImageWidget(
                            url: img_house,
                            width: w / 1.3,
                            height: w / 1.3,
                          )
                        ],
                      ),
                    ),

                    DraggableScrollableSheet(
                      initialChildSize: 0.4,
                      minChildSize: 0.2,
                      maxChildSize: 0.4,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Stack(
                          children: [
                            SingleChildScrollView(
                              controller: scrollController,
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Container(
                                height: h,
                                child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 15.0,
                                        sigmaY: 15.0,
                                      ),
                                      child:Column(children: [
                                        SizedBox(height: height_15,),
                                        SVGImageWidget(
                                          url: ic_bottom_sheet,
                                          width: width_5,
                                          height: height_5,
                                        ),
                                        SizedBox(height: height_15,),
                                        SizedBox(
                                          height: h / 5,
                                          child: ListView.builder(
                                            itemCount: 30,
                                            scrollDirection: Axis.horizontal,
                                            padding:
                                            EdgeInsets.only(left: width_15),
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: height_20,
                                                    horizontal: height_15),
                                                margin: EdgeInsets.only(
                                                    right: width_10),
                                                decoration: BoxDecoration(
                                                  color: ThemeColor.clr_48319D
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      radius_24),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '3 AM',
                                                      style: TextStyleCommon
                                                          .textStyleSubheadline(
                                                          context),
                                                    ),
                                                    SizedBox(height: 10),
                                                    LocalImageWidget(
                                                      url: img_cloud_rain,
                                                      width: width_28,
                                                      height: width_28,
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text('19°',
                                                        style: TextStyleCommon
                                                            .textStyleTitle3(
                                                            context)),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],),
                                    ),

                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 90,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Transform.scale(
                                        scale: 1.01,
                                        child: CustomPaint(
                                          painter: BottomCenterCustomPainters(),
                                          child: Container(
                                            height: 65,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width_20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    print('left');
                                                  },
                                                  child: SVGImageWidget(
                                                    url: ic_left,
                                                    width: width_35,
                                                    height: width_35,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
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
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Stack(
                                          children: [
                                            CustomPaint(
                                                painter: BottomCustomPainter(),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 90,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.2,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      print('click');
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(500),
                                                      ),
                                                      child: SVGImageWidget(
                                                        url: ic_add,
                                                        width: width_50,
                                                        height: width_50,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

class BottomCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4210526, 0);
    path_0.lineTo(size.width * 0.5789474, 0);
    path_0.cubicTo(
        size.width * 0.6992481,
        0,
        size.width * 0.7349662,
        size.height * 0.2413980,
        size.width * 0.7734286,
        size.height * 0.4869850);
    path_0.cubicTo(
        size.width * 0.8132519,
        size.height * 0.7412470,
        size.width * 0.8533835,
        size.height,
        size.width * 0.9849624,
        size.height);
    path_0.lineTo(size.width * 0.01503782, size.height);
    path_0.cubicTo(
        size.width * 0.1466169,
        size.height,
        size.width * 0.1867496,
        size.height * 0.7412470,
        size.width * 0.2265707,
        size.height * 0.4869850);
    path_0.cubicTo(size.width * 0.2650335, size.height * 0.2413980,
        size.width * 0.3007523, 0, size.width * 0.4210526, 0);
    path_0.close();

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..color = Color(0xFF7582F4);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4210526, size.height * 0.002500000);
    path_1.lineTo(size.width * 0.5789474, size.height * 0.002500000);
    path_1.cubicTo(
        size.width * 0.6388083,
        size.height * 0.002500000,
        size.width * 0.6775526,
        size.height * 0.06249740,
        size.width * 0.7061579,
        size.height * 0.1530060);
    path_1.cubicTo(
        size.width * 0.7338722,
        size.height * 0.2406970,
        size.width * 0.7520789,
        size.height * 0.3570410,
        size.width * 0.7706541,
        size.height * 0.4757500);
    path_1.cubicTo(
        size.width * 0.7712895,
        size.height * 0.4798130,
        size.width * 0.7719248,
        size.height * 0.4838790,
        size.width * 0.7725639,
        size.height * 0.4879470);
    path_1.lineTo(size.width * 0.7729474, size.height * 0.4904180);
    path_1.cubicTo(
        size.width * 0.7927180,
        size.height * 0.6166520,
        size.width * 0.8127068,
        size.height * 0.7442740,
        size.width * 0.8440789,
        size.height * 0.8404790);
    path_1.cubicTo(
        size.width * 0.8705714,
        size.height * 0.9217320,
        size.width * 0.9051767,
        size.height * 0.9805450,
        size.width * 0.9545451,
        size.height * 0.9975000);
    path_1.lineTo(size.width * 0.04545639, size.height * 0.9975000);
    path_1.cubicTo(
        size.width * 0.09482556,
        size.height * 0.9805450,
        size.width * 0.1294274,
        size.height * 0.9217320,
        size.width * 0.1559233,
        size.height * 0.8404790);
    path_1.cubicTo(
        size.width * 0.1872951,
        size.height * 0.7442730,
        size.width * 0.2072820,
        size.height * 0.6166510,
        size.width * 0.2270515,
        size.height * 0.4904170);
    path_1.lineTo(size.width * 0.2274383, size.height * 0.4879470);
    path_1.cubicTo(
        size.width * 0.2280752,
        size.height * 0.4838790,
        size.width * 0.2287117,
        size.height * 0.4798130,
        size.width * 0.2293474,
        size.height * 0.4757510);
    path_1.cubicTo(
        size.width * 0.2479226,
        size.height * 0.3570410,
        size.width * 0.2661278,
        size.height * 0.2406970,
        size.width * 0.2938417,
        size.height * 0.1530060);
    path_1.cubicTo(
        size.width * 0.3224466,
        size.height * 0.06249740,
        size.width * 0.3611925,
        size.height * 0.002500000,
        size.width * 0.4210526,
        size.height * 0.002500000);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.001879699;
    paint_1_stroke.color = Color(0xff7582F4).withOpacity(0.5);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = ThemeColor.clr_262C51;
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomCenterCustomPainters extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.01123596);
    path_0.cubicTo(
        0,
        size.height * 0.01123596,
        size.width * 0.1950690,
        size.height * 0.1908112,
        size.width * 0.3256410,
        size.height * 0.2359551);
    path_0.cubicTo(
        size.width * 0.3931769,
        size.height * 0.2593056,
        size.width * 0.4321897,
        size.height * 0.2696629,
        size.width * 0.5000000,
        size.height * 0.2696629);
    path_0.cubicTo(
        size.width * 0.5678103,
        size.height * 0.2696629,
        size.width * 0.6042590,
        size.height * 0.2593056,
        size.width * 0.6717949,
        size.height * 0.2359551);
    path_0.cubicTo(size.width * 0.8023667, size.height * 0.1908112, size.width,
        size.height * 0.01123596, size.width, size.height * 0.01123596);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.01123596);
    path_0.close();

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..color = Color(0xFF7582F4);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.01123596);
    path_1.lineTo(size.width * 0.0001317892, size.height * 0.008486978);
    path_1.lineTo(size.width * -0.0006410256, size.height * 0.007775539);
    path_1.lineTo(size.width * -0.0006410256, size.height * 0.01123596);
    path_1.lineTo(size.width * -0.0006410256, size.height);
    path_1.lineTo(size.width * -0.0006410256, size.height * 1.002809);
    path_1.lineTo(0, size.height * 1.002809);
    path_1.lineTo(size.width, size.height * 1.002809);
    path_1.lineTo(size.width * 1.000641, size.height * 1.002809);
    path_1.lineTo(size.width * 1.000641, size.height);
    path_1.lineTo(size.width * 1.000641, size.height * 0.01123596);
    path_1.lineTo(size.width * 1.000641, size.height * 0.007784764);
    path_1.lineTo(size.width * 0.9998692, size.height * 0.008485472);
    path_1.lineTo(size.width, size.height * 0.01123596);
    path_1.cubicTo(
        size.width * 0.9998692,
        size.height * 0.008485472,
        size.width * 0.9998692,
        size.height * 0.008486135,
        size.width * 0.9998667,
        size.height * 0.008487483);
    path_1.lineTo(size.width * 0.9998615, size.height * 0.008493584);
    path_1.lineTo(size.width * 0.9998333, size.height * 0.008518022);
    path_1.lineTo(size.width * 0.9997256, size.height * 0.008615438);
    path_1.lineTo(size.width * 0.9993000, size.height * 0.009001247);
    path_1.cubicTo(
        size.width * 0.9989231,
        size.height * 0.009342146,
        size.width * 0.9983590,
        size.height * 0.009848820,
        size.width * 0.9976205,
        size.height * 0.01051170);
    path_1.cubicTo(
        size.width * 0.9961410,
        size.height * 0.01183742,
        size.width * 0.9939564,
        size.height * 0.01378798,
        size.width * 0.9911256,
        size.height * 0.01628663);
    path_1.cubicTo(
        size.width * 0.9854692,
        size.height * 0.02128393,
        size.width * 0.9772410,
        size.height * 0.02847371,
        size.width * 0.9669564,
        size.height * 0.03724258);
    path_1.cubicTo(
        size.width * 0.9463923,
        size.height * 0.05478067,
        size.width * 0.9176103,
        size.height * 0.07863494,
        size.width * 0.8847513,
        size.height * 0.1038997);
    path_1.cubicTo(
        size.width * 0.8190256,
        size.height * 0.1544337,
        size.width * 0.7370000,
        size.height * 0.2105933,
        size.width * 0.6717436,
        size.height * 0.2331551);
    path_1.cubicTo(
        size.width * 0.6042154,
        size.height * 0.2565022,
        size.width * 0.5677872,
        size.height * 0.2668539,
        size.width * 0.5000000,
        size.height * 0.2668539);
    path_1.cubicTo(
        size.width * 0.4322128,
        size.height * 0.2668539,
        size.width * 0.3932179,
        size.height * 0.2565011,
        size.width * 0.3256923,
        size.height * 0.2331551);
    path_1.cubicTo(
        size.width * 0.2604385,
        size.height * 0.2105933,
        size.width * 0.1790523,
        size.height * 0.1544337,
        size.width * 0.1139679,
        size.height * 0.1039004);
    path_1.cubicTo(
        size.width * 0.08142821,
        size.height * 0.07863584,
        size.width * 0.05296846,
        size.height * 0.05478169,
        size.width * 0.03264359,
        size.height * 0.03724382);
    path_1.cubicTo(
        size.width * 0.02248121,
        size.height * 0.02847494,
        size.width * 0.01435272,
        size.height * 0.02128528,
        size.width * 0.008765077,
        size.height * 0.01628798);
    path_1.cubicTo(
        size.width * 0.005971256,
        size.height * 0.01378933,
        size.width * 0.003812667,
        size.height * 0.01183888,
        size.width * 0.002352662,
        size.height * 0.01051312);
    path_1.cubicTo(
        size.width * 0.001622659,
        size.height * 0.009850270,
        size.width * 0.001067303,
        size.height * 0.009343607,
        size.width * 0.0006945179,
        size.height * 0.009002719);
    path_1.lineTo(size.width * 0.0002732564, size.height * 0.008616921);
    path_1.lineTo(size.width * 0.0001671764, size.height * 0.008519517);
    path_1.lineTo(size.width * 0.0001406000, size.height * 0.008495079);
    path_1.lineTo(size.width * 0.0001339682, size.height * 0.008488978);
    path_1.cubicTo(
        size.width * 0.0001325074,
        size.height * 0.008487629,
        size.width * 0.0001317892,
        size.height * 0.008486978,
        0,
        size.height * 0.01123596);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.001282051;
    paint_1_stroke.color = Color(0xff7582F4).withOpacity(0.5);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = ThemeColor.clr_262C51;
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
