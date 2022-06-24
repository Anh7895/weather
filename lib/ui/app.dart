import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather/common/config/nav_key.dart';
import 'package:weather/common/multi_language/internationalization.dart';
import 'package:weather/datasource/data/local_user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/common/config/languages.dart';
import 'package:weather/common/config/routers_name.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/injector/injector.dart';
import 'package:weather/ui/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home/home_bloc.dart';
import '../common/utils/preference_utils.dart';

class BaseApp extends StatefulWidget {
  @override
  _BaseAppState createState() => _BaseAppState();

  static void setLocale(BuildContext context, Locale newLocale) async {
    _BaseAppState? state = context.findAncestorStateOfType<_BaseAppState>();
    state?.changeLanguage(newLocale);
    LocalUserData.getInstance.defaultLanguage = newLocale.languageCode;
    saveLanguage(newLocale.languageCode);
  }

  static saveLanguage(String language)async{
    return await PreferenceUtils.setString("default_language", language);
  }
}

class _BaseAppState extends State<BaseApp> {
  Locale? _locale  =Locale(LanguageConstants.vietnamese);
  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  getLocale() async {
    LocalUserData.getInstance.defaultLanguage = await  PreferenceUtils.getString("default_language");
    print( LocalUserData.getInstance.defaultLanguage);
    return LocalUserData.getInstance.defaultLanguage;
  }


  @override
  void initState(){
    getLocale().then((value){
      String locale ='vi';
      if(value != null && value !=''){
        locale = value;
      }
      _locale = Locale(locale);
      LocalUserData.getInstance.defaultLanguage = _locale?.languageCode;
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: ThemeColor.appStyleColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    print(_locale?.languageCode);
    return ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context,widget) => Container(
          color: Colors.grey,
          child: MultiBlocProvider(
            providers: _getProviders(),
            child: MaterialApp(
              title: S.of(context).translate('chargingStation'),
              debugShowCheckedModeBanner: false,
              initialRoute: RouteName.splashScreen,
              navigatorKey: NavKey.navKey,
              onGenerateRoute: Routes.generateRoute,
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                    brightness: Brightness.dark,
                    backgroundColor: ThemeColor.clr_appBarColor,
                    iconTheme: IconThemeData(color: ThemeColor.clr_FFFFFF),
                    textTheme: TextTheme(
                      headline1: TextStyle(color: ThemeColor.clr_FFFFFF),
                      caption: TextStyle(color: ThemeColor.clr_FFFFFF),
                    ),
                  ),
                  fontFamily: 'Inter',
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity),
              locale: _locale,
              localizationsDelegates: [
                SLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                if (locale == null) {
                  return supportedLocales.first;
                }

                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode
                  ) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              supportedLocales: const [
                Locale(LanguageConstants.vietnamese, 'VI'),
                Locale(LanguageConstants.english, 'EN'),
              ],
            ),
          ),
        ));
  }

  List<BlocProvider> _getProviders() => [
    BlocProvider<HomeBloc>(
      create: (BuildContext context) => Injector.resolve<HomeBloc>(),
    ),
  ];
}
