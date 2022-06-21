

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:weather/bloc/home/home_bloc.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/widgets/http_stream_handler.dart';
import 'package:weather/common/widgets/images/local_image_widget.dart';

import '../../bloc/base_state/base_state.dart';
import '../../common/injector/injector.dart';
import '../../common/resource/name_image.dart';
import '../../common/widgets/images/svg_image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = Injector.resolve<HomeBloc>();

  double width = 0;
  double height = 0;
  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
                body: Container(
                  child: Center(
                    child: Text('Welcome'),
                  ),
                ),
                bottomNavigationBar: Transform(
                  alignment: FractionalOffset.center,
                  transform: new Matrix4.identity()
                    ..rotateZ(180 * 3.1415927 / 180),
                  child: ClipPath(
                    clipper: ArcClipper(),
                    child: Container(
                      height: 120,
                      color: Colors.blue,
                      child: Center(child: Text("OvalBottomBorderClipper()")),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

}
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
