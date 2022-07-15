import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:weather/bloc/home/home_bloc.dart';
import 'package:weather/bloc/home/home_event.dart';
import 'package:weather/common/resource/name_image.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/text_style.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/utils/preference_utils.dart';
import 'package:weather/common/widgets/http_stream_handler.dart';
import 'package:weather/common/widgets/images/local_image_widget.dart';
import 'package:weather/common/widgets/images/svg_image_widget.dart';
import 'package:weather/datasource/data/local_user_data.dart';
import 'package:weather/datasource/data/model/request/home_request.dart';
import 'package:weather/datasource/data/model/request/home_request_current.dart';

import '../../bloc/base_state/base_state.dart';
import '../../common/injector/injector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = Injector.resolve<HomeBloc>();

  // save data dạng object vào local
  Future getDataHomeLocal() async {
    print('run getDataHomeLocal');
    await LocalUserData.getInstance.getDataHome(); /// lấy data api getweather
    await LocalUserData.getInstance.getDataHomeCurrent();///get data home current
  }
  //get data home current
  // PermissionStatus _permissionStatus = PermissionStatus.denied;

  // LocationPermission? permission;
  // Position? position;

  @override
  void initState() {
    super.initState();
    requestLocation();
  getDataHomeLocal();
    //geolocator
    // getLocationData().then((value) => () {
    //       position = value;
    //     });
  }

  // permission_handler

  // Future<void> requestLocationPermission() async {
  //   final serviceStatusLocation = await Permission.locationWhenInUse.isGranted ;// cấp quyền vị trí
  //   bool isLocation = serviceStatusLocation == ServiceStatus.enabled;
  //   final status = await Permission.locationWhenInUse.request();
  //
  //   if (status == PermissionStatus.granted) {
  //     // quyền đc cấp thì add event + lat và lon để lấy vị trí
  //     _bloc.add(GetDataHomeEvent(
  //         homeRequest: HomeRequest(
  //             appid: '36c6afeee531eb6d4daaf6265cc4739d',
  //             lat: '',
  //             lon: '',),
  //     ));
  //
  //     // quyền được cấp
  //   } else if (status == PermissionStatus.denied) {
  //     // còn không được cấp quyền thì lấy mặc định là
  //     _bloc.add(GetDataHomeEvent(
  //             homeRequest: HomeRequest(
  //                 appid: '36c6afeee531eb6d4daaf6265cc4739d',
  //                 lat: '9.915951',
  //                 lon: '105.699334')
  //         ));
  //     // bị từ chối
  //   } else if (status == PermissionStatus.permanentlyDenied) {
  //     // người dùng không đồng ý và không cho hỏi lại nữa thì dùng default hàm này
  //     _bloc.add(GetDataHomeEvent(
  //             homeRequest: HomeRequest(
  //                 appid: '36c6afeee531eb6d4daaf6265cc4739d',
  //                 lat: '9.915951',
  //                 lon: '105.699334')
  //         ));
  //     // vĩnh viễn bị từ chối
  //     await openAppSettings(); // mở app setting
  //   }
  //
  // }
  // location
  Future<void> requestLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    // kiểm tra xem vị trí thiết bị đã được bật chưa hoặc người dùng đã tắt nó theo cách thủ công
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      // Hiển thị lời nhắc gốc cho phép người dùng kích hoạt vị trí nhanh chóng bằng cách
      // gọi đến requestServiece();
      if (!_serviceEnabled) {
        return null;
      }
    }
    // chắc chắn dịch vụ vị trí đã được bật thì kiểm tra xem ứng dụng có các quyền cần thiết
    // để sử dụng nó hay không bằng cách call hasPermission(); nó sẽ trả về PermissionStatus();
    //PermissionStatus là một enum có thể có một trong ba giá trị sau:
    // PermissionStatus.granted: quyền cho các dịch vụ vị trí đã được cấp
    // PermissionStatus.denied: quyền cho các dịch vụ vị trí đã bị từ chối
    // PermissionStatus.deniedForever: quyền cho các dịch vụ vị trí đã bị người dùng từ chối vĩnh viễn.
    // Điều này chỉ áp dụng cho iOS. Không có hộp thoại nào được hiển thị trong trường hợp này requestPermission()
    _permissionGranted = await location.hasPermission();
    _permissionGranted = await location
        .requestPermission(); // vào app sẽ hiển thị hỏi người dùng có cấp quyền không
    LocationData _locationData;

    print(_permissionGranted);
    if (_permissionGranted == PermissionStatus.denied) {
      _bloc.add(GetDataHomeEvent(
          homeRequest: HomeRequest(
              appid: '36c6afeee531eb6d4daaf6265cc4739d',
              lat: '9.915951',
              lon: '105.699334')));
      _bloc.add(GetDataCurrentHomeEvent(
        homeCurrentRequest: HomeCurrentRequest(
            lat: '9.915951',
            lon: '105.699334'),));
    } else if (_permissionGranted == PermissionStatus.granted) {
      _locationData = await location
          .getLocation(); // lấy lat lon thì phải cho hàm getLocation vào trong grandted
      _bloc.add(GetDataHomeEvent(
        homeRequest: HomeRequest(
            appid: '36c6afeee531eb6d4daaf6265cc4739d',
            lat: '${_locationData.latitude}',
            lon: '${_locationData.longitude}'),

      ));
      _bloc.add(GetDataCurrentHomeEvent(
          homeCurrentRequest: HomeCurrentRequest(
              lat: '${_locationData.latitude}',
              lon: '${_locationData.longitude}'),));

    } else if (_permissionGranted == PermissionStatus.deniedForever) {
      _bloc.add(GetDataHomeEvent(
          homeRequest: HomeRequest(
              appid: '36c6afeee531eb6d4daaf6265cc4739d',
              lat: '9.915951',
              lon: '105.699334')));
      _bloc.add(GetDataCurrentHomeEvent(
        homeCurrentRequest: HomeCurrentRequest(
            lat: '9.915951',
            lon: '105.699334'),));
    }


  }

  // getting current location - lấy vị trí hiện tại

  //geolocator
  // Future<Position> getLocationData() async {
  //   permission = await Geolocator
  //       .requestPermission(); // yêu cầu truy cập vào vị trí của thiết bị
  //   var position = await GeolocatorPlatform.instance.getCurrentPosition(
  //       locationSettings: LocationSettings()); // tìm nạp vị trí của người dùng
  //   return position;
  // }

  // Future<Position> determinePosition() async {
  //   bool? serviceEnabled;
  //   LocationPermission? permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     return Future.error('Location permissions are denied');
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  //   print(position);
  //
  //   return await Geolocator.getCurrentPosition();
  // }

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
    return HttpStreamHandler<HomeBloc, BaseState>(
      bloc: _bloc,
      listener: (context, state) async {},
      builder: (context, state) {
        return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              extendBody: true,
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
                        _bloc.homeResponseCurrent?.location?.name != null
                            ? Text(
                          '${_bloc.homeResponseCurrent?.location?.name}' ,
                                style:
                                    TextStyleCommon.textStyleCaption3(context),
                              )
                            : Shimmer.fromColors(
                                child: Container(
                                  width: width_200,
                                  height: height_20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                                baseColor: Colors.grey[500]!,
                                highlightColor: Colors.grey[100]!),
                        SizedBox(height: height_5,),
                        _bloc.homeResponseCurrent?.temperature?.value != null ?
                        Text(
                          '${(_bloc.homeResponseCurrent?.temperature?.value)!.round()}' /// làm tròn data[double] trong flutter
                              + '${_bloc.homeResponseCurrent?.temperature?.unit}',
                          style: TextStyleCommon.textStyleCaption4(context),
                        ):Shimmer.fromColors(
                            child: Container(
                              width: width_200,
                              height: height_40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),

                            ),
                            baseColor: Colors.grey[500]!,
                            highlightColor: Colors.grey[100]!),
                        SizedBox(height: height_5,),
                        _bloc.homeResponseCurrent?.weatherState?.description != null ?
                        Text(
                          '${_bloc.homeResponseCurrent?.weatherState?.description}',
                          style: TextStyleCommon.textStyleOpacity(context),):Shimmer.fromColors(
                            child: Container(
                              width: width_200,
                              height: height_20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[500]!,
                            highlightColor: Colors.grey[100]!),
                        SizedBox(height: height_5,),
                        (_bloc.homeResponseCurrent?.temperature?.minTemperature != null &&
                            _bloc.homeResponseCurrent?.temperature?.maxTemperature != null)
                            ? Text(
                                'H:' +
                                    '${_bloc.homeResponseCurrent?.temperature?.minTemperature!.round()}' + // lấy data trong list
                                    '°' +
                                    '   L:' +
                                    '${_bloc.homeResponseCurrent?.temperature?.maxTemperature!.round()}'+
                                    '°',
                                style:
                                    TextStyleCommon.textStyleCaption1(context),
                              )
                            : Shimmer.fromColors(
                                child: Container(
                                  width: width_200,
                                  height: height_20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                                baseColor: Colors.grey[500]!,
                                highlightColor: Colors.grey[100]!),
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
                    minChildSize: 0.23,
                    maxChildSize: 0.4,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            ClipRRect(

                              borderRadius: BorderRadius.circular(50),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 15.0,
                                  sigmaY: 15.0,
                                ),
                                child: Container(
                                  height: height_300,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height_15,
                                      ),
                                      SVGImageWidget(
                                        url: ic_bottom_sheet,
                                        width: width_5,
                                        height: height_5,
                                      ),
                                      Container(
                                        height: height_250,
                                        child: DefaultTabController(
                                          length: 2,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height_30,
                                                child: TabBar(
                                                  indicatorColor: Colors.white
                                                      .withOpacity(0.5),
                                                  indicatorSize:
                                                      TabBarIndicatorSize.tab,
                                                  tabs: [
                                                    Tab(
                                                        child: Text(
                                                      'Hourly Forecast',
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )),
                                                    Tab(
                                                      child: Text(
                                                        'Weekly Forecast',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: height_20,
                                              ),
                                              Container(
                                                height: height_150,
                                                child: TabBarView(
                                                  children: [
                                                    SizedBox(
                                                      child: ListView.builder(
                                                        itemCount: _bloc.homeResponse?.hourlyConverts?.length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width_15),
                                                        itemBuilder:
                                                            (context, index) {
                                                          return _bloc.homeResponse?.hourlyConverts?[index].temperature != null
                                                              ? Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          height_20,
                                                                      horizontal:
                                                                          height_15),
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              width_10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ThemeColor
                                                                        .clr_48319D
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            radius_24),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        '${_bloc.homeResponse?.hourlyConverts?[index].forecastTime?.hour}'+ ' '+'${_bloc.homeResponse?.hourlyConverts?[index].forecastTime?.format}',
                                                                        style: TextStyleCommon.textStyleSubheadline(
                                                                            context),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              height_10),
                                                                      LocalImageWidget(
                                                                        url:
                                                                            img_cloud_rain,
                                                                        width:
                                                                            width_28,
                                                                        height:
                                                                            width_28,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              height_10),

                                                                      Text(
                                                                          '${_bloc.homeResponse?.hourlyConverts?[index].temperature?.value!.round()}' + '${_bloc.homeResponse?.hourlyConverts?[index].temperature?.unit}',
                                                                          style: TextStyle(fontSize: 16, color: ThemeColor.clr_FFFFFF)
                                                                              ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : Shimmer
                                                                  .fromColors(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                width_10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(radius_24),
                                                                        ),
                                                                        width:
                                                                            width_50,
                                                                        height:
                                                                            height_104,
                                                                      ),
                                                                      baseColor:
                                                                          Colors.grey[
                                                                              500]!,
                                                                      highlightColor:
                                                                          Colors
                                                                              .grey[100]!);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      child: ListView.builder(
                                                        itemCount: _bloc.homeResponse?.dailyConverts?.length,
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        padding:
                                                        EdgeInsets.only(
                                                            left: width_15),
                                                        itemBuilder:
                                                            (context, index) {
                                                          return _bloc.homeResponse?.dailyConverts?[index].temperature != null
                                                              ? Container(
                                                            padding: EdgeInsets.symmetric(
                                                                vertical:
                                                                height_20,
                                                                horizontal:
                                                                height_15),
                                                            margin: EdgeInsets
                                                                .only(
                                                                right:
                                                                width_10),
                                                            decoration:
                                                            BoxDecoration(
                                                              color: ThemeColor
                                                                  .clr_48319D
                                                                  .withOpacity(
                                                                  0.2),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  radius_24),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Text(
                                                                  '${_bloc.homeResponse?.dailyConverts?[index].forecastTime?.toString().substring(0,3)}',
                                                                  style: TextStyleCommon.textStyleSubheadline(
                                                                      context),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                    height_10),
                                                                LocalImageWidget(
                                                                  url:
                                                                  img_cloud_rain,
                                                                  width:
                                                                  width_28,
                                                                  height:
                                                                  width_28,
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                    height_10),
                                                                Text(
                                                                    '${_bloc.homeResponse?.dailyConverts?[index].temperature?.day!.round()}' + ' C',
                                                                    style:
                                                                    TextStyleCommon.textStyleTitle3(context)),
                                                              ],
                                                            ),
                                                          )
                                                              : Shimmer
                                                              .fromColors(
                                                              child:
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right:
                                                                    width_10),
                                                                decoration:
                                                                BoxDecoration(
                                                                  color:
                                                                  Colors.white,
                                                                  borderRadius:
                                                                  BorderRadius.circular(radius_24),
                                                                ),
                                                                width:
                                                                width_50,
                                                                height:
                                                                height_104,
                                                              ),
                                                              baseColor:
                                                              Colors.grey[
                                                              500]!,
                                                              highlightColor:
                                                              Colors
                                                                  .grey[100]!);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height_15,
                                      ),
                                      SizedBox(
                                        height: height_15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height_20,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width_24),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(width_20),
                                    height: height_160,
                                    decoration: BoxDecoration(
                                      color: ThemeColor.clr_48319D
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(color:  ThemeColor.clr_48319D
                          .withOpacity(0.9),),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            LocalImageWidget(
                                              url: ic_snowflakes,
                                              width: width_20,
                                              height: height_20,
                                            ),
                                            SizedBox(
                                              width: width_10,
                                            ),
                                            Text(
                                              'AIR QUALITY',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: ThemeColor.clr_FFFFFF
                                                      .withOpacity(0.6)),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          '3- Low Health Risk',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: ThemeColor.clr_FFFFFF),
                                        ),

                                        Container(
                                          height: 10,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black, width: 0.1),
                                            gradient: LinearGradient(colors: [
                                              ThemeColor.clr_1D3AF2,
                                              ThemeColor.clr_EF4C5E,
                                            ]),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          /// https://help.syncfusion.com/flutter/slider/shapes#thumb-shape
                                          child: SliderTheme(
                                            data: SliderTheme.of(context).copyWith(
                                              trackHeight: 0.0, /// color đường kẻ dưới thumb
                                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0, ),  /// thay đổi hình dạng kích thước của thumb
                                            ),
                                            child:   Slider(
                                              activeColor: Colors.red,
                                              inactiveColor: Colors.red,
                                              thumbColor:ThemeColor.clr_FFFFFF,
                                              onChanged: (value){
                                              },
                                              value: 0.3 ,
                                            ),
                                          ),
                                        ),


                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'See more',
                                                style: TextStyle(
                                                    color: ThemeColor.clr_FFFFFF
                                                        .withOpacity(0.8),
                                                    fontSize: 16),
                                              ),
                                              Icon(
                                                Icons.navigate_next,
                                                color: ThemeColor.clr_FFFFFF
                                                    .withOpacity(0.3),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: height_20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20.0),
                                        height: height_150,
                                        width: width_148,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.clr_48319D
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20.0),
                                          border: Border.all(color:  ThemeColor.clr_48319D
                                              .withOpacity(0.9),),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                LocalImageWidget(
                                                  url: ic_uv,
                                                  width: width_20,
                                                  height: height_20,
                                                ),
                                                SizedBox(
                                                  width: width_10,
                                                ),
                                                Text(
                                                  'UV INDEX',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ThemeColor.clr_FFFFFF
                                                          .withOpacity(0.6)),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              '4 Moderate',maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: ThemeColor.clr_FFFFFF),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(width: width_20,),
                                      Container(
                                        padding: EdgeInsets.all(20.0),
                                        height: height_150,
                                        width: width_148,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.clr_48319D
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20.0),
                                          border: Border.all(color:  ThemeColor.clr_48319D
                                              .withOpacity(0.9),),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                LocalImageWidget(
                                                  url: ic_sunrise,
                                                  width: width_20,
                                                  height: height_20,
                                                ),
                                                SizedBox(
                                                  width: width_10,
                                                ),
                                                Text(
                                                  'SUNRISE',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ThemeColor.clr_FFFFFF
                                                          .withOpacity(0.6)),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              '5:28 AM',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: ThemeColor.clr_FFFFFF),
                                            ),
                                            const Text(
                                              'Sunset : 7:25PM',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: ThemeColor.clr_FFFFFF),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height_20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20.0),
                                        height: height_150,
                                        width: width_148,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.clr_48319D
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20.0),
                                          border: Border.all(color:  ThemeColor.clr_48319D
                                              .withOpacity(0.9),),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                LocalImageWidget(
                                                  url: ic_wind,
                                                  width: width_20,
                                                  height: height_20,
                                                ),
                                                SizedBox(
                                                  width: width_10,
                                                ),
                                                Text(
                                                  'Wind',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ThemeColor.clr_FFFFFF
                                                          .withOpacity(0.6)),
                                                ),
                                              ],
                                            ),


                                          ],
                                        ),
                                      ),
                                      SizedBox(width: width_20,),
                                      Container(
                                        padding: EdgeInsets.all(20.0),
                                        height: height_150,
                                        width: width_148,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.clr_48319D
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20.0),
                                          border: Border.all(color:  ThemeColor.clr_48319D
                                              .withOpacity(0.9),),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                LocalImageWidget(
                                                  url: ic_rainfall,
                                                  width: width_20,
                                                  height: height_20,
                                                ),
                                                SizedBox(
                                                  width: width_10,
                                                ),
                                                Text(
                                                  'RainFall',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ThemeColor.clr_FFFFFF
                                                          .withOpacity(0.6)),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              '1.8 mm in last hour',maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: ThemeColor.clr_FFFFFF),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height_104,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              bottomNavigationBar: Align(
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
                              padding:
                                  EdgeInsets.symmetric(horizontal: width_20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: GestureDetector(
                                      onTap: () {
                                        print('click');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(500),
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
            ));
      },
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
