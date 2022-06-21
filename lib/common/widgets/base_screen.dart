import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/common/broadcast_receiver/network_receiver.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/text_style.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/datasource/data/local_user_data.dart';
import 'fatal_error_widget.dart';

class BaseScreen extends StatefulWidget {
  final String? title;
  final Widget? appBar;
  final Widget? body;
  final bool? isLoading;
  final Function(BuildContext)? onInit;
  final Function(BuildContext)? overrideBack;
  final Function(ConnectivityResult)? networkChangedListener;
  final List<Widget>? actions;
  final bool? isShowBack;
  final ScrollController? scrollController;
  final Color? backgroundColor;
  final Color? scaffoldBackgroundColor;
  final bool isShowAppBar;
  final double? appBarHeight;
  final bool? isShowCloseButton;

  const BaseScreen(
      {Key? key,
      this.title = '',
      this.isShowAppBar = false,
      this.appBar,
      @required this.body,
      this.isLoading = false,
      this.onInit,
        this.overrideBack,
      this.networkChangedListener,
      this.actions,
      this.isShowBack = false,
      this.scrollController,
      this.backgroundColor,
      this.scaffoldBackgroundColor = Colors.grey,
      this.appBarHeight,
      this.isShowCloseButton = false})
      : super(key: key);

  static showLoading(BuildContext context) {
    final _BaseScreenState state =
        context.findAncestorStateOfType<_BaseScreenState>()!;
    // state.showLoading();
  }

  static hideLoading(BuildContext context) {
    final _BaseScreenState state =
        context.findAncestorStateOfType<_BaseScreenState>()!;
    // state.hideLoading();
  }

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool _hasInitialized = false;
  bool _isLoading = false;
  double _appbarElevation = 0.0;
  // Map? _source;
  // NetworkReceiver _connectivity = NetworkReceiver.instance;
  // String networkStatus = "";

  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildFatalErrorWidget(FlutterErrorDetails error) => FatalErrorWidget(
        error: error,
      );

  @override
  void initState() {
    super.initState();
    //Init connectivity
    // _connectivity.initialise();
    //Listen network changed event by saving in map
    // _connectivity.myStream.listen((source) {
    //   setState(() => _source = source);
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasInitialized) {
      if (widget.onInit != null) {
        widget.onInit!(context);
      }
      _hasInitialized = true;
    }
  }


  @override
  void dispose() {
    super.dispose();
    // _connectivity.disposeStream();
  }

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = _buildFatalErrorWidget;
    FocusScopeNode currentFocus = FocusScope.of(context);
    // if(_source != null && _source?.keys != null){
    //   switch (_source?.keys.toList()[0]) {
    //     case ConnectivityResult.none:
    //       networkStatus = "Offline";
    //       break;
    //     case ConnectivityResult.mobile:
    //       networkStatus = "Mobile: Online";
    //       break;
    //     case ConnectivityResult.wifi:
    //       networkStatus = "WiFi: Online";
    //       break;
    //     default:
    //       networkStatus = _source?.keys.toList()[0];
    //       break;
    //   }
    //   if(widget.networkChangedListener != null){
    //     widget.networkChangedListener!(_source?.keys.toList()[0]);
    //   }
    //   print(networkStatus);
    // }
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is UserScrollNotification) {
          FocusScope.of(context).unfocus();
        }
        return false;
      },
      child: GestureDetector(
        onTap: () {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
      ),
    );
  }

  _buildCloseButton() => Padding(
        padding: EdgeInsets.only(right: 24.0),
        child: Icon(Icons.close),
      );

   _buildAppBar(BuildContext context, bool isShowAppBar) {
    if (isShowAppBar) {
      bool _hasBackBtn = (widget.isShowBack! &&
          ((Navigator.of(context).canPop()) ||
              widget.overrideBack != null));
      if (widget.appBar != null) {
        return widget.appBar!;
      } else {
        final theme = Theme.of(context);
        AppBar appBar = AppBar(
          backgroundColor: widget.scaffoldBackgroundColor,
          brightness: Brightness.dark,
          elevation: _appbarElevation,
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              child: Container(
                color: Colors.white,
              ),
              preferredSize: Size(double.infinity, height_8)),
          title: SizedBox(
            height: kToolbarHeight + height_8,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _hasBackBtn
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          child: Container(
                            width: width_40,
                            height: width_40,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                          onTap: () {
                            if (widget.overrideBack != null) {
                              widget.overrideBack!(context);
                            } else {
                              if (Navigator.of(context).canPop())
                                Navigator.of(context).pop();
                            }
                          },
                        ),
                      )
                    : Container(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            _hasBackBtn ? width_40 : width_16),
                    height: width_56,
                    alignment: Alignment.center,
                    child: Text(widget.title!,
                        style: theme.textTheme.headline6!.copyWith(
                            fontSize: fontSize_20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                (widget.actions != null && widget.actions!.length > 0)
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.actions!),
                      )
                    : Container(),
              ],
            ),
          ),
        );
        return appBar;
      }
    } else {
      return null;
    }
  }
}

Widget buildAppBarShowPartner(BuildContext context,
    { PreferredSizeWidget? bottom, required Function() onAppBarPress}) {
  return  AppBar(
    backgroundColor: Colors.white,
    elevation: 10,
    shadowColor: ThemeColor.clr_151A35.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 44,
              width: 44,
              alignment: Alignment.bottomCenter,
              child: Image.network(
                LocalUserData.getInstance.imgUrl!,
                height: 44,
                width: 44,
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("dasds",
                      style: TextStyleCommon.font18pxStyleNormal(context,
                          color: ThemeColor.clr_4C5980)),
                  Text(LocalUserData.getInstance.partnerName!,
                      style: TextStyleCommon.font24pxStyleNormal(context,
                          fontWeight: FontWeight.bold,
                          height: 1))
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            onAppBarPress();
          },
          child: Container(
            height: 44,
            width: 44,
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                'assets/icons/ic_settings_new.svg',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
      ],
    ),
    bottom: bottom ??
        PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(10),
        ),
  );
}
