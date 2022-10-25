import 'package:flutter/material.dart';

import '../../../common/resource/theme_color.dart';

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