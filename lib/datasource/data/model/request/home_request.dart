class HomeRequest{

   String? lat;
   String? lon;

  HomeRequest({ this.lat, this.lon});
  HomeRequest.fromJson(Map<String, dynamic> json){

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