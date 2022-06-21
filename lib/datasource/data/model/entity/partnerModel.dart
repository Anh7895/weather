class PartnerModel {
  int? id;
  String? code;
  String? name;
  String? username;
  String? picture;
  String? email;
  int? sex;
  String? dateOfBirth;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? provinceId;
  String? districtId;
  String? wardId;
  String? apartmentNumber;
  int? enabled;
  int? isLocked;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? facebookId;
  String? googleId;
  String? apiToken;
  String? pathThumb;
  String? appleId;
  String? chatId;
  int? partnerId;
  List<PartnerType>? partnerType;

  PartnerModel(
      {this.id,
        this.code,
        this.name,
        this.username,
        this.picture,
        this.email,
        this.sex,
        this.dateOfBirth,
        this.emailVerifiedAt,
        this.phoneNumber,
        this.provinceId,
        this.districtId,
        this.wardId,
        this.apartmentNumber,
        this.enabled,
        this.isLocked,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.facebookId,
        this.googleId,
        this.apiToken,
        this.pathThumb,
        this.appleId,
        this.chatId,
        this.partnerId,
        this.partnerType});

  PartnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    username = json['username'];
    picture = json['picture'];
    email = json['email'];
    sex = json['sex'];
    dateOfBirth = json['date_of_birth'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    provinceId = json['province_id'];
    districtId = json['district_id'];
    wardId = json['ward_id'];
    apartmentNumber = json['apartment_number'];
    enabled = json['enabled'];
    isLocked = json['is_locked'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    apiToken = json['api_token'];
    pathThumb = json['path_thumb'];
    appleId = json['apple_id'];
    chatId = json['chat_id'];
    partnerId = json['partner_id'];
    if (json['partner_type'] != null) {
      partnerType = <PartnerType>[];
      json['partner_type'].forEach((v) {
        partnerType!.add(new PartnerType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['username'] = this.username;
    data['picture'] = this.picture;
    data['email'] = this.email;
    data['sex'] = this.sex;
    data['date_of_birth'] = this.dateOfBirth;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_number'] = this.phoneNumber;
    data['province_id'] = this.provinceId;
    data['district_id'] = this.districtId;
    data['ward_id'] = this.wardId;
    data['apartment_number'] = this.apartmentNumber;
    data['enabled'] = this.enabled;
    data['is_locked'] = this.isLocked;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['facebook_id'] = this.facebookId;
    data['google_id'] = this.googleId;
    data['api_token'] = this.apiToken;
    data['path_thumb'] = this.pathThumb;
    data['apple_id'] = this.appleId;
    data['chat_id'] = this.chatId;
    data['partner_id'] = this.partnerId;
    if (this.partnerType != null) {
      data['partner_type'] = this.partnerType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnerType {
  int? partnerId;
  String? partnerType;

  PartnerType({this.partnerId, this.partnerType});

  PartnerType.fromJson(Map<String, dynamic> json) {
    partnerId = json['partner_id'];
    partnerType = json['partner_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partner_id'] = this.partnerId;
    data['partner_type'] = this.partnerType;
    return data;
  }
}