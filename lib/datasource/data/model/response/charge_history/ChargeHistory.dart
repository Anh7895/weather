class ChargeHistory {
  String? title;
  int? totalPrice;
  int? totalCharge;
  int? totalChargeTime;

  ChargeHistory(
      {this.title, this.totalPrice, this.totalCharge, this.totalChargeTime});

  ChargeHistory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalPrice = json['total_price'];
    totalCharge = json['total_charge'];
    totalChargeTime = json['total_charge_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['total_price'] = this.totalPrice;
    data['total_charge'] = this.totalCharge;
    data['total_charge_time'] = this.totalChargeTime;
    return data;
  }
}
