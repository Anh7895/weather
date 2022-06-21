import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/datasource/data/model/response/business_detail_model.dart';
import 'package:weather/datasource/data/model/response/login_response.dart';
import 'package:weather/datasource/data/model/response/user_model.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }


  static Future<String> getString(String key, [String? defValue]) async{
    var prefs = await _instance;
    return prefs.getString(key) ?? defValue ?? "";
  }

  static Future<bool> removeValue({String? key}) async {
    var prefs = await _instance;
      return prefs.remove(key??'');
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }


  static int getInt(String key, [int? defValue]) {
    return _prefsInstance!.getInt(key) ?? defValue ?? 1;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }



  static Future<bool> saveUserLogin(BusinessDetailModel? userModel) async {
    var prefs = await _instance;
    try {
      await prefs.setString(
        "user",
        jsonEncode(userModel?.toJson()),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<BusinessDetailModel> getUser() async {
    var prefs = await _instance;
    try {
      String? userPrefs = prefs.getString("user");
      if (userPrefs == null || userPrefs.isEmpty) return BusinessDetailModel();
      BusinessDetailModel userModel =
      BusinessDetailModel.fromJson(jsonDecode(userPrefs));
      return userModel;
    } catch (e) {
      print(e);
      return BusinessDetailModel();
    }
  }

  Future<int> deleteUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userLogin");
    return 1;
  }
}
