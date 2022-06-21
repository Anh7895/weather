
import 'package:weather/common/resource/name_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/injector/injector.dart';
import 'package:weather/common/widgets/http_stream_handler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/base_state/base_state.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../bloc/dashboard/dashboard_event.dart';
import '../../bloc/dashboard/dashboard_state.dart';

class DashboardScreen extends StatefulWidget {
  final int? index;

  const DashboardScreen({Key? key, this.index}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ///Init home bloc
  DashboardBloc _bloc = Injector.resolve<DashboardBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(ChangePageEvent(currentIndex: widget.index ?? 0));
  }

  @override
  void dispose() {
    _bloc.controller.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HttpStreamHandler<DashboardBloc, BaseState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is InitDataPageState) {
        } else if (state is ChangePageState) {
          _bloc.controller.jumpToPage(state.currentIndex);
        }
      },
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius_20),
                  topRight: Radius.circular(radius_20),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 0.5), //(x,y)
                      blurRadius: 5.00,
                      color: Colors.grey,
                      spreadRadius: 1.00),
                ],
              ),
              child: buildBottomNavigationBar(),
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(),
                Container(),
                Container(),
                Container(),
              ],
              controller: _bloc.controller,
            ));
      },
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _bloc.currentIndex,
      onTap: (int index) {
        _bloc.add(ChangePageEvent(currentIndex: index));
      },
      selectedIconTheme: IconThemeData(color: ThemeColor.clr_136849),
      selectedItemColor: ThemeColor.clr_136849,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: ThemeColor.clr_136849),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(ic_salary, color: ThemeColor.clr_136849),
          icon: SvgPicture.asset(ic_salary),
          label: "Lương",
        ),
        BottomNavigationBarItem(
          activeIcon:
              SvgPicture.asset(ic_calendar, color: ThemeColor.clr_136849),
          icon: SvgPicture.asset(ic_calendar),
          label: "Chấm công",
        ),
        BottomNavigationBarItem(
          activeIcon:
              SvgPicture.asset(ic_notification, color: ThemeColor.clr_136849),
          icon: SvgPicture.asset(ic_notification),
          label: "Thông báo",
        ),
        BottomNavigationBarItem(
          activeIcon:
              SvgPicture.asset(ic_account_circle, color: ThemeColor.clr_136849),
          icon: SvgPicture.asset(ic_account_circle),
          label: "Cá nhân",
        )
      ],
    );
  }
}
