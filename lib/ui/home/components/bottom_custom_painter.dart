import 'package:flutter/material.dart';

import '../../../common/resource/theme_color.dart';

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