class PersonalModel {
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
  ChatToken? chatToken;
  List<Roles>? roles;
  String? chat_id;


  PersonalModel(
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
        this.chatToken,
        this.chat_id,
        this.roles});

  PersonalModel.fromJson(Map<String, dynamic> json) {
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
    if(json['chat_token'] != null){
      chatToken = ChatToken.fromJson(json['chat_token']);
    }
    if(json['chat_id'] != null ){
      chat_id = json['chat_id'];
    }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
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
    data['chat_id'] = this.chat_id;
    data['chat_token'] = this.chatToken?.toJson();
     if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
        this.name,
        this.guardName,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    data['model_type'] = this.modelType;
    return data;
  }
}

class ChatToken {
  int? id;
  String? name;
  String? token;
  int? userId;

  ChatToken(
      {this.id,
        this.name,
        this.token,
        this.userId,});

  ChatToken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['token'] = this.token;
    data['user_id'] = this.userId;
    return data;
  }
}