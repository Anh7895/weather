import 'package:weather/common/multi_language/internationalization.dart';
import 'package:weather/common/resource/name_image.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/utils/preference_utils.dart';
import 'package:weather/common/widgets/images/local_image_widget.dart';
import 'package:weather/datasource/data/local_user_data.dart';
import 'package:weather/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/locale.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getLanguage();
    getStation();
    getToken().then((value) {
      if(value != null && value != ''){
        Future.delayed(Duration(seconds: 1), () {

        });
      }else{
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false);
        });
      }
    });
    super.initState();
  }

  Future getToken() async {
    return LocalUserData.getInstance.accessToken =
        await PreferenceUtils.getString("access_token");
  }

  Future getLanguage() async {
    String defaultLan = await PreferenceUtils.getString("default_language");
    LocalUserData.getInstance.defaultLanguage =
        defaultLan == '' ? 'vi' : defaultLan;
  }

  Future getStation() async {
    // await LocalUserData.getInstance.getPersonal();
    await LocalUserData.getInstance.getSearchContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LocalImageWidget(
                  //   url: png_ic_logo,
                  //   width: width_214,
                  //   height: height_184,
                  //   boxFit: BoxFit.fill,
                  // ),
                  Text("${S.of(context).translate('getData')} ")
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Copy right by AOE Corp",
                      style: TextStyle(
                          color: ThemeColor.clr_898A8D,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Version 2.6.2",
                      style: TextStyle(
                          color: ThemeColor.clr_898A8D, fontSize: fontSize_10),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height_8,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
