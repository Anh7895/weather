class UserModel {
  String? sId;
  String? email;
  String? updatedAt;
  String? createdAt;
  String? address;
  String? businessLogoUrl;
  String? businessName;
  bool?   isSendToMe;
  String? phoneNumber;

  UserModel({this.sId, this.email, this.updatedAt, this.createdAt, this.address, this.businessLogoUrl, this.businessName, this.isSendToMe, this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    address = json['address'];
    businessLogoUrl = json['business_logo_url'];
    businessName = json['business_name'];
    isSendToMe = json['is_send_to_me'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['address'] = this.address;
    data['business_logo_url'] = this.businessLogoUrl;
    data['business_name'] = this.businessName;
    data['is_send_to_me'] = this.isSendToMe;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}