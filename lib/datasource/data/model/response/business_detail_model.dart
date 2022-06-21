import 'package:dio/dio.dart';

class BusinessDetailModel {
  String? businessInfoId;
  String? businessLogoUrl;
  String? businessName;
  MultipartFile? businessLogoFile;
  String? sMethod;
  String? ownerName;
  String? businessNumber;
  String? addressLine1Business;
  String? addressLine2Business;
  String? addressLine3Business;
  String? businessEmail;
  String? personalEmail;
  String? businessPhone;
  String? personalPhone;
  String? businessMobile;
  String? businessWebsite;
  String? level;
  String? levelExpireDate;

  BusinessDetailModel(
      {this.businessInfoId,
      this.businessLogoUrl,
      this.businessLogoFile,
      this.sMethod,
      this.businessName,
      this.ownerName,
      this.businessNumber,
      this.addressLine1Business,
      this.addressLine2Business,
      this.addressLine3Business,
      this.businessEmail,
      this.businessPhone,
      this.personalPhone,
      this.businessMobile,
      this.businessWebsite,
      this.level,
      this.levelExpireDate});

  BusinessDetailModel.fromJson(Map<String, dynamic> json) {
    businessInfoId = json['_id'];
    businessLogoUrl = json['business_logo_url'];
    businessName = json['business_name'];
    businessLogoFile = json['business_logo_file'];
    sMethod = json['_method'];
    ownerName = json['owner_name'];
    businessNumber = json['business_number'];
    addressLine1Business = json['address'];
    addressLine2Business = json['address2'];
    addressLine3Business = json['address3'];
    businessEmail = json['business_email'];
    personalEmail = json['personal_email'];
    businessPhone = json['business_phone'];
    personalPhone = json['personal_phone'];
    businessMobile = json['business_mobile'];
    businessWebsite = json['business_website'];
    if(json.containsKey('level')){
      level = json['level'];
    }
    if(json.containsKey('level_expire_date')){
      levelExpireDate = json['level_expire_date'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.businessInfoId;
    data['business_logo_url'] = this.businessLogoUrl;
    data['business_name'] = this.businessName;
    data['business_logo_file'] = this.businessLogoFile;
    data['_method'] = this.sMethod;
    data['owner_name'] = this.ownerName;
    data['business_number'] = this.businessNumber;
    data['address'] = this.addressLine1Business;
    data['address2'] = this.addressLine2Business;
    data['address3'] = this.addressLine3Business;
    data['business_email'] = this.businessEmail;
    data['personal_email'] = this.personalEmail;
    data['business_phone'] = this.businessPhone;
    data['personal_phone'] = this.personalPhone;
    data['business_mobile'] = this.businessMobile;
    data['business_website'] = this.businessWebsite;
    data['level'] = this.level;
    data['level_expire_date'] = this.levelExpireDate;
    return data;
  }
}
