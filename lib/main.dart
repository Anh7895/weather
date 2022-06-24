import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/supervisor_bloc/supervisor_bloc.dart';
import 'package:weather/common/injector/injector_config.dart';
import 'package:weather/common/resource/theme_color.dart';

import 'ui/app.dart';

void main() async{
  InjectorConfig.setup();

  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(
    BaseApp(),
  ));

}
