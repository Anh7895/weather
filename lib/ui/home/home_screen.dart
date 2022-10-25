import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/bloc/home/home_bloc.dart';
import 'package:weather/bloc/home/home_event.dart';
import 'package:weather/common/resource/name_image.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/text_style.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/widgets/http_stream_handler.dart';
import 'package:weather/common/widgets/images/local_image_widget.dart';
import 'package:weather/common/widgets/images/svg_image_widget.dart';
import 'package:weather/datasource/data/model/request/home_request.dart';
import 'package:weather/datasource/data/model/request/home_request_current.dart';
import '../../bloc/base_state/base_state.dart';
import '../../common/injector/injector.dart';
import 'components/bottom_center_custom_painters.dart';
import 'components/bottom_custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = Injector.resolve<HomeBloc>();

  // save data dạng object vào local

  // PermissionStatus _permissionStatus = PermissionStatus.denied;

  // LocationPermission? permission;
  // Position? position;

  @override
  void initState() {
    super.initState();
    requestLocation();

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

  Future updateData() async {}

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
    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever) {
      _bloc.add(GetDataHomeEvent(
          homeRequest: HomeRequest(lat: '9.915951', lon: ' 105.699334')));
      _bloc.add(GetDataCurrentHomeEvent(
        homeCurrentRequest:
            HomeCurrentRequest(lat: '9.915951', lon: ' 105.699334'),
      ));
    } else if (_permissionGranted == PermissionStatus.granted) {
      _locationData = await location
          .getLocation(); // lấy lat lon thì phải cho hàm getLocation vào trong grandted
      _bloc.add(GetDataHomeEvent(
        homeRequest: HomeRequest(
            lat: '${_locationData.latitude}',
            lon: '${_locationData.longitude}'),
      ));
      _bloc.add(GetDataCurrentHomeEvent(
        homeCurrentRequest: HomeCurrentRequest(
            lat: '${_locationData.latitude}',
            lon: '${_locationData.longitude}'),
      ));
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
    return Scaffold(
      extendBody: true,
      backgroundColor: ThemeColor.clr_F8F1F2,
      resizeToAvoidBottomInset: false,
      body: HttpStreamHandler<HomeBloc, BaseState>(
        bloc: _bloc,
        listener: (context, state) async {},
        builder: (context, state) {
          print(_bloc.homeResponseCurrent?.location?.name);
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: RefreshIndicator(
              color: ThemeColor.clr_282828,
              backgroundColor: ThemeColor.clr_FFFFFF,
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 1));
                Location location = Location();
                LocationData _locationData;
                _locationData = await location.getLocation();
                if (_locationData.latitude != null &&
                    _locationData.longitude != null) {
                  _bloc.add(GetDataHomeEvent(
                      homeRequest: HomeRequest(
                          lat: "${_locationData.latitude}",
                          lon: "${_locationData.longitude}")));
                  _bloc.add(GetDataCurrentHomeEvent(
                      homeCurrentRequest: HomeCurrentRequest(
                          lat: "${_locationData.latitude}",
                          lon: "${_locationData.longitude}")));
                }
                else {

                }
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  width: w,
                  height: h,
                  child: Stack(
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
                                    '${_bloc.homeResponseCurrent?.location?.name}',
                                    style: TextStyleCommon.textStyleCaption3(
                                        context),
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
                            SizedBox(
                              height: height_5,
                            ),
                            _bloc.homeResponseCurrent?.temperature?.value !=
                                    null
                                ? Text(
                                    '${(_bloc.homeResponseCurrent?.temperature?.value)!.round()}'

                                        /// làm tròn data[double] trong flutter
                                        +
                                        '${_bloc.homeResponseCurrent?.temperature?.unit}',
                                    style: TextStyleCommon.textStyleCaption4(
                                        context),
                                  )
                                : Shimmer.fromColors(
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
                            SizedBox(
                              height: height_5,
                            ),
                            _bloc.homeResponseCurrent?.weatherState
                                        ?.description !=
                                    null
                                ? Text(
                                    '${_bloc.homeResponseCurrent?.weatherState?.description}',
                                    style: TextStyleCommon.textStyleOpacity(
                                        context),
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
                            SizedBox(
                              height: height_5,
                            ),
                            (_bloc.homeResponseCurrent?.temperature
                                            ?.minTemperature !=
                                        null &&
                                    _bloc.homeResponseCurrent?.temperature
                                            ?.maxTemperature !=
                                        null)
                                ? Text(
                                    'H:' +
                                        '${_bloc.homeResponseCurrent?.temperature?.minTemperature!.round()}' + // lấy data trong list
                                        '°' +
                                        '   L:' +
                                        '${_bloc.homeResponseCurrent?.temperature?.maxTemperature!.round()}' +
                                        '°',
                                    style: TextStyleCommon.textStyleCaption1(
                                        context),
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
                                                      indicatorColor: Colors
                                                          .white
                                                          .withOpacity(0.5),
                                                      indicatorSize:
                                                          TabBarIndicatorSize
                                                              .tab,
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
                                                          child:
                                                              ListView.builder(
                                                            itemCount: _bloc
                                                                .homeResponse
                                                                ?.hourlyConverts
                                                                ?.length,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left:
                                                                        width_15),
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return _bloc
                                                                          .homeResponse
                                                                          ?.hourlyConverts?[
                                                                              index]
                                                                          .temp?.convertTempFormatC?.value !=
                                                                      null
                                                                  ? Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              width_10,
                                                                          horizontal:
                                                                              height_15),
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              width_10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: ThemeColor
                                                                            .clr_48319D
                                                                            .withOpacity(0.2),
                                                                        borderRadius:
                                                                            BorderRadius.circular(radius_24),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '${_bloc.homeResponse?.hourlyConverts?[index].forecastTime?.hour24h}' +
                                                                                ':' + '${_bloc.homeResponse?.hourlyConverts?[index].forecastTime?.minutes}' +
                                                                                '${_bloc.homeResponse?.hourlyConverts?[index].forecastTime?.format}',
                                                                            style:
                                                                                TextStyleCommon.textStyleSubheadline(context),
                                                                          ),
                                                                          SizedBox(
                                                                              height: height_10),
                                                                          LocalImageWidget(
                                                                            url:
                                                                                img_cloud_rain,
                                                                            width:
                                                                                width_28,
                                                                            height:
                                                                                width_28,
                                                                          ),
                                                                          SizedBox(
                                                                              height: height_10),
                                                                          Text(
                                                                              '${_bloc.homeResponse?.hourlyConverts?[index].temp?.convertTempFormatC?.value!.round()}' + '${_bloc.homeResponse?.hourlyConverts?[index].temp?.convertTempFormatC?.unit}',
                                                                              style: TextStyle(fontSize: 16, color: ThemeColor.clr_FFFFFF)),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Shimmer
                                                                      .fromColors(
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                EdgeInsets.only(right: width_10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(radius_24),
                                                                            ),
                                                                            width:
                                                                                width_50,
                                                                            height:
                                                                                height_104,
                                                                          ),
                                                                          baseColor: Colors.grey[
                                                                              500]!,
                                                                          highlightColor:
                                                                              Colors.grey[100]!);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child:
                                                              ListView.builder(
                                                            itemCount: _bloc
                                                                .homeResponse
                                                                ?.dailyConverts
                                                                ?.length,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left:
                                                                        width_15),
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return _bloc
                                                                          .homeResponse
                                                                          ?.dailyConverts?[
                                                                              index]
                                                                          .temperature !=
                                                                      null
                                                                  ? Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              width_10,
                                                                          horizontal:
                                                                              height_15),
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              width_10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: ThemeColor
                                                                            .clr_48319D
                                                                            .withOpacity(0.2),
                                                                        borderRadius:
                                                                            BorderRadius.circular(radius_24),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '${_bloc.homeResponse?.dailyConverts?[index].forecastTime?.toString().substring(0, 3)}',
                                                                            style:
                                                                                TextStyleCommon.textStyleSubheadline(context),
                                                                          ),
                                                                          SizedBox(
                                                                              height: height_10),
                                                                          LocalImageWidget(
                                                                            url:
                                                                                img_cloud_rain,
                                                                            width:
                                                                                width_28,
                                                                            height:
                                                                                width_28,
                                                                          ),
                                                                          SizedBox(
                                                                              height: height_10),
                                                                          Text(
                                                                              '${_bloc.homeResponse?.dailyConverts?[index].temperature?.dailyTemperatureFormatC?.day!.round()}' + '${_bloc.homeResponse?.dailyConverts?[index].temperature?.dailyTemperatureFormatC?.unit}',
                                                                              style: TextStyle(fontSize: 16, color: ThemeColor.clr_FFFFFF)),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Shimmer
                                                                      .fromColors(
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                EdgeInsets.only(right: width_10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(radius_24),
                                                                            ),
                                                                            width:
                                                                                width_50,
                                                                            height:
                                                                                height_104,
                                                                          ),
                                                                          baseColor: Colors.grey[
                                                                              500]!,
                                                                          highlightColor:
                                                                              Colors.grey[100]!);
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height_20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width_24),
                                  child: Column(
                                    children: [
                                      // air quality
                                      Container(
                                        padding: EdgeInsets.all(width_20),
                                        height: height_200,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.clr_48319D
                                              .withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: ThemeColor.clr_48319D
                                                .withOpacity(0.9),
                                          ),
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
                                                      color: ThemeColor
                                                          .clr_FFFFFF
                                                          .withOpacity(0.6)),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              '3- Low Health Risk',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: ThemeColor.clr_FFFFFF),
                                            ),
                                            Container(
                                              height: 10,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.1),
                                                gradient:
                                                    LinearGradient(colors: [
                                                  ThemeColor.clr_1D3AF2,
                                                  ThemeColor.clr_EF4C5E,
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),

                                              /// https://help.syncfusion.com/flutter/slider/shapes#thumb-shape
                                              child: SliderTheme(
                                                data: SliderTheme.of(context)
                                                    .copyWith(
                                                  trackHeight: 0.0,

                                                  /// color đường kẻ dưới thumb
                                                  thumbShape:
                                                      RoundSliderThumbShape(
                                                    enabledThumbRadius: 5.0,
                                                  ),

                                                  /// thay đổi hình dạng kích thước của thumb
                                                ),
                                                child: Slider(
                                                  min: 0,
                                                  max: 5,
                                                  activeColor: Colors.red,
                                                  inactiveColor: Colors.red,
                                                  thumbColor:
                                                      ThemeColor.clr_FFFFFF,
                                                  onChanged: (value) {},
                                                  value: 2,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'See more',
                                                    style: TextStyle(
                                                        color: ThemeColor
                                                            .clr_FFFFFF
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
                                      SizedBox(
                                        height: height_20,
                                      ),
                                      // UV and Sunrise
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_160,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '${_bloc.homeResponse?.hourlyConverts?[0].uvIndex}',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                                Container(
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 0.1),
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      ThemeColor.clr_1D3AF2,
                                                      ThemeColor.clr_EF4C5E,
                                                    ]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),

                                                  /// https://help.syncfusion.com/flutter/slider/shapes#thumb-shape
                                                  child: SliderTheme(
                                                    data:
                                                        SliderTheme.of(context)
                                                            .copyWith(
                                                      trackHeight: 0.0,

                                                      /// color đường kẻ dưới thumb
                                                      thumbShape:
                                                          RoundSliderThumbShape(
                                                        enabledThumbRadius: 5.0,
                                                      ),

                                                      /// thay đổi hình dạng kích thước của thumb
                                                    ),
                                                    child: Slider(
                                                      min: 0,
                                                      max: 1,
                                                      activeColor: Colors.red,
                                                      inactiveColor: Colors.red,
                                                      thumbColor:
                                                          ThemeColor.clr_FFFFFF,
                                                      onChanged: (value) {},
                                                      value: double.parse("${_bloc
                                                          .homeResponse
                                                          ?.hourlyConverts?[0]
                                                          ?.uvIndex ?? 0}") , // xử lý đoạn check data null khi data trả về
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width_20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_160,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '${_bloc.homeResponse?.weatherConvert?.location?.sunriseTime?.substring(10,18)}',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                                Text(
                                                  'Sunset : ' +
                                                '${_bloc.homeResponse?.weatherConvert?.location?.sunsetTime?.substring(10,18)}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height_20,
                                      ),
                                      // Wind
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_160,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
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
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: height_25,),
                                                Text(
                                                  '${_bloc.homeResponseCurrent?.wind?.speed}' +
                                                      ' ' +
                                                      '${_bloc.homeResponseCurrent?.wind?.unit}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width_20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_170,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
                                                ),
                                                _bloc
                                                            .homeResponse
                                                            ?.weatherConvert
                                                            ?.rain
                                                            ?.oneHourLevel !=
                                                        null
                                                    ? Text(
                                                        '${_bloc.homeResponse?.weatherConvert?.rain?.oneHourLevel}'
                                                        ' mm in last hour',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: ThemeColor
                                                                .clr_FFFFFF),
                                                      )
                                                    : Text(
                                                        ' 0 mm in last hour',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: ThemeColor
                                                                .clr_FFFFFF),
                                                      ),
                                                _bloc
                                                            .homeResponse
                                                            ?.weatherConvert
                                                            ?.rain
                                                            ?.unit !=
                                                        null
                                                    ? Text(
                                                        '${_bloc.homeResponse?.weatherConvert?.rain?.unit}'
                                                        ' mm expected in next 24h',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: ThemeColor
                                                                .clr_FFFFFF),
                                                      )
                                                    : Text(
                                                        '0 mm expected in next 24h',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: ThemeColor
                                                                .clr_FFFFFF),
                                                      )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height_20,
                                      ),
                                      //  Feelslike
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_160,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
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
                                                      width: width_5,
                                                    ),
                                                    Text(
                                                      'Feelslike',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height_5,
                                                ),
                                                Text(
                                                  '${_bloc.homeResponse?.weatherConvert?.temperature?.convertTempModelFormatC?.feelsLike?.round()}' +
                                                      '${_bloc.homeResponse?.weatherConvert?.temperature?.convertTempModelFormatC?.unit}',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                                SizedBox(
                                                  height: height_20,
                                                ),
                                                Text(
                                                  'simular to the actual temperature',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width_20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_170,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
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
                                                      'Humidity',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height_5,
                                                ),
                                                Text(
                                                  '${_bloc.homeResponse?.weatherConvert?.humidity?.value}' +
                                                      '${_bloc.homeResponse?.weatherConvert?.humidity?.unit}',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                                SizedBox(
                                                  height: height_20,
                                                ),
                                                Text(
                                                  'The dew point is 17 right now ',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: ThemeColor
                                                          .clr_FFFFFF),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height_20,
                                      ),
                                      // visibility
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_160,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
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
                                                      'Visibility',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height_10,
                                                ),
                                                _bloc
                                                            .homeResponse
                                                            ?.hourlyConverts?[0]
                                                            .visibilityInMetres !=
                                                        null
                                                    ? Text(
                                                        ' ${double.parse(' ${_bloc..homeResponse
                                                            ?.hourlyConverts?[0]
                                                            .visibilityInMetres}') / 1000}' +
                                                            ' km',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: ThemeColor
                                                                .clr_FFFFFF),
                                                      )
                                                    : Text(
                                                        '0 km',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: ThemeColor
                                                                .clr_FFFFFF),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width_20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: height_160,
                                            width: width_160,
                                            decoration: BoxDecoration(
                                              color: ThemeColor.clr_48319D
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: ThemeColor.clr_48319D
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            child: Column(
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
                                                      'Pressure',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ThemeColor
                                                              .clr_FFFFFF
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  ],
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
                ),
              ),
            ),
          );
        },
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
                      padding: EdgeInsets.symmetric(horizontal: width_20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: GestureDetector(
                              onTap: () {
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
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

