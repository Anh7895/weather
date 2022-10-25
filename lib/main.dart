
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_ios/shared_preferences_ios.dart';
import 'package:weather/bloc/supervisor_bloc/supervisor_bloc.dart';
import 'package:weather/common/injector/injector_config.dart';
import 'package:workmanager/workmanager.dart';
import 'common/config/default_env.dart';
import 'common/utils/preference_utils.dart';
import 'datasource/network/dio/api_client.dart';
import 'ui/app.dart';

///  workmanager để chạy các tác vụ định kỳ, chẳng hạn như tìm nạp dữ liệu từ xa một cách thường xuyên.
String? tittle;

void main() async{
  InjectorConfig.setup();

  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
// transparent statusBar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );
  Workmanager().registerPeriodicTask(
    "be.tramckrijte.workmanagerExample.rescheduledTask",
    "simplePeriodicTask",
    inputData: <String, dynamic>{
      'string': tittle.toString()
    },

    frequency: Duration(minutes: 15),
  );


  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(
    BaseApp(),
  ));

}
void callbackDispatcher() async {
  Workmanager().executeTask((task, inputData)async {
    print("Native called background task:"); //simpleTask will be emitted here.
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS) SharedPreferencesIOS.registerWith();
    /// call api
    ApiClient apiClient= ApiClient();
    final response = await apiClient.get(DefaultConfig.getWeatherNowUrl,queryParameters: {'lat': '9.915951', 'lon': '105.699334' });
    final responseCurrent = await apiClient.get(DefaultConfig.getWeatherCurrentNowUrl,queryParameters: {'lat': '9.915951', 'lon': '105.699334'});
    print('response aaaaa ${response}');
    print('responseCurrent aaaaa ${responseCurrent}');
    /// chuyển data sau call từ dạng object sang string rồi save vào share
   //c1
    await PreferenceUtils.setString('homeResponseCurrent', jsonEncode(responseCurrent['data']));
    //c2
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("homeResponse", jsonEncode(response['data']));
    return Future.value(true);/// tác vụ thành công
  });
}


