class HomeCurrentRequest{
  String? lat;
  String? lon;

  HomeCurrentRequest({ this.lat, this.lon});
  HomeCurrentRequest.fromJson(Map<String, dynamic> json){

    lat = json['lat'];
    lon = json['lon'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}