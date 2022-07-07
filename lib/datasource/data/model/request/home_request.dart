class HomeRequest{
  String? appid;
   String? lat;
   String? lon;

  HomeRequest({this.appid, this.lat, this.lon});
  HomeRequest.fromJson(Map<String, dynamic> json){
    appid = json['appid'];
    lat = json['lat'];
    lon = json['lon'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = appid;
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}