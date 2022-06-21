import 'dart:convert';

import 'package:weather/common/utils/preference_utils.dart';
import 'package:flutter/material.dart';


class LocalUserData {
  static final LocalUserData _singleton = LocalUserData._internal();

  factory LocalUserData() => _singleton;

  LocalUserData._internal();

  static LocalUserData get getInstance => _singleton;

  String? partnerPhoneNumber;
  String? imgUrl;
  String? partnerName;
  String? accessToken = '';
  String? deviceToken = '';
  String? chat_id = '';
  String? chat_token = '';
  int? user_id ;
  String? refreshToken;
  String? defaultLanguage = /*"En"*/ "vi";
  bool isFavorite = false;
  bool isFilter = false;
  bool isFree = false;
  bool isReady = false;


  List<String> historySearch = [];


  ///Add data to history search
  addListSearch(String? textSearch) {
    if (historySearch.length > 10) {
      historySearch.removeLast();
    }
    if (historySearch.length == 0) {
      historySearch.add(textSearch ?? '');
      return;
    }
    historySearch.insert(0, textSearch ?? '');
  }

  changeFavorite({required bool favorite}){
    isFavorite = favorite;
    print("Favorite Station $isFavorite");
    return isFavorite;
  }

  ///Handle get service key selected

  ///Handle remove service select
  removeServiceSelect(){
    isFavorite = false;
    isFilter= false;
    isFree = false;
    isReady = false;
  }

  ///Init data service station

  ///Handle save station to storage

  ///Handle save personal to storage
  // Future savePersonal(PersonalModel personalModel) async {
  //
  //
  //   try {
  //     PreferenceUtils.removeValue(key: 'personal');
  //     await PreferenceUtils.setString("personal", jsonEncode(personalModel));
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  ///Handle get station to storage

  ///Handle get station to storage
  // Future<PersonalModel> getPersonal() async {
  //   try {
  //     String userPrefs = await PreferenceUtils.getString("personal");
  //     if (userPrefs == null || userPrefs.isEmpty) return PersonalModel();
  //     dynamic personal = jsonDecode(userPrefs);
  //     personalModel = PersonalModel.fromJson(personal);
  //     chat_id = personalModel.chat_id;
  //     chat_token = personalModel.chatToken?.token;
  //     print("Chat ${chat_token}");
  //     print("Chat ${chat_id}");
  //     return personalModel;
  //   } catch (e) {
  //     print("errget $e");
  //     return PersonalModel();
  //   }
  // }

  Future saveSearchContent() async {
    try {
      await PreferenceUtils.setString(
          "searchContent", jsonEncode(historySearch));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<String>> getSearchContent() async {
    try {
      String userPrefs = await PreferenceUtils.getString("searchContent");
      if (userPrefs == null || userPrefs.isEmpty) return [];
      List<dynamic> listStringComment = jsonDecode(userPrefs);
      historySearch.clear();
      listStringComment.forEach((element) {
        historySearch.add(element);
      });
      print("History ${historySearch.length}");
      return [];
    } catch (e) {
      return [];
    }
  }
}
