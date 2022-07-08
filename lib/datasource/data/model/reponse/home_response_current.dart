class HomeResponseCurrent {
  String? message;
  int? status;
  Data? data;

  HomeResponseCurrent({this.message, this.status, this.data});

  HomeResponseCurrent.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? calculationTime;
  WeatherState? weatherState;
  Temperature? temperature;
  AtmosphericPressure? atmosphericPressure;
  Humidity? humidity;
  Wind? wind;
  Rain? rain;
  Null? snow;
  Humidity? clouds;
  Location? location;

  Data(
      {this.calculationTime,
        this.weatherState,
        this.temperature,
        this.atmosphericPressure,
        this.humidity,
        this.wind,
        this.rain,
        this.snow,
        this.clouds,
        this.location});

  Data.fromJson(Map<String, dynamic> json) {
    calculationTime = json['calculationTime'];
    weatherState = json['weatherState'] != null
        ? WeatherState.fromJson(json['weatherState'])
        : null;
    temperature = json['temperature'] != null
        ? Temperature.fromJson(json['temperature'])
        : null;
    atmosphericPressure = json['atmosphericPressure'] != null
        ? AtmosphericPressure.fromJson(json['atmosphericPressure'])
        : null;
    humidity = json['humidity'] != null
        ? Humidity.fromJson(json['humidity'])
        : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    snow = json['snow'];
    clouds =
    json['clouds'] != null ? Humidity.fromJson(json['clouds']) : null;
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['calculationTime'] = calculationTime;
    if (weatherState != null) {
      data['weatherState'] = weatherState!.toJson();
    }
    if (temperature != null) {
      data['temperature'] = temperature!.toJson();
    }
    if (atmosphericPressure != null) {
      data['atmosphericPressure'] = atmosphericPressure!.toJson();
    }
    if (humidity != null) {
      data['humidity'] = humidity!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    data['snow'] = snow;
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class WeatherState {
  int? id;
  String? name;
  String? description;
  String? iconId;
  String? weatherConditionEnum;
  String? weatherIconUrl;

  WeatherState(
      {this.id,
        this.name,
        this.description,
        this.iconId,
        this.weatherConditionEnum,
        this.weatherIconUrl});

  WeatherState.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    iconId = json['iconId'];
    weatherConditionEnum = json['weatherConditionEnum'];
    weatherIconUrl = json['weatherIconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['iconId'] = iconId;
    data['weatherConditionEnum'] = weatherConditionEnum;
    data['weatherIconUrl'] = weatherIconUrl;
    return data;
  }
}

class Temperature {
  double? value;
  double? maxTemperature;
  double? minTemperature;
  double? feelsLike;
  String? unit;

  Temperature(
      {this.value,
        this.maxTemperature,
        this.minTemperature,
        this.feelsLike,
        this.unit});

  Temperature.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    maxTemperature = json['maxTemperature'];
    minTemperature = json['minTemperature'];
    feelsLike = json['feelsLike'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = value;
    data['maxTemperature'] = maxTemperature;
    data['minTemperature'] = minTemperature;
    data['feelsLike'] = feelsLike;
    data['unit'] = unit;
    return data;
  }
}

class AtmosphericPressure {
  double? value;
  double? seaLevelValue;
  double? groundLevelValue;
  String? unit;

  AtmosphericPressure(
      {this.value, this.seaLevelValue, this.groundLevelValue, this.unit});

  AtmosphericPressure.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    seaLevelValue = json['seaLevelValue'];
    groundLevelValue = json['groundLevelValue'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = value;
    data['seaLevelValue'] = seaLevelValue;
    data['groundLevelValue'] = groundLevelValue;
    data['unit'] = unit;
    return data;
  }
}

class Humidity {
  int? value;
  String? unit;

  Humidity({this.value, this.unit});

  Humidity.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}

class Wind {
  double? speed;
  double? degrees;
  double? gust;
  String? unit;

  Wind({this.speed, this.degrees, this.gust, this.unit});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    degrees = json['degrees'];
    gust = json['gust'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['speed'] = speed;
    data['degrees'] = degrees;
    data['gust'] = gust;
    data['unit'] = unit;
    return data;
  }
}

class Rain {
  double? oneHourLevel;
  String? threeHourLevel;
  String? unit;

  Rain({this.oneHourLevel, this.threeHourLevel, this.unit});

  Rain.fromJson(Map<String, dynamic> json) {
    oneHourLevel = json['oneHourLevel'];
    threeHourLevel = json['threeHourLevel'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['oneHourLevel'] = oneHourLevel;
    data['threeHourLevel'] = threeHourLevel;
    data['unit'] = unit;
    return data;
  }
}

class Location {
  int? id;
  String? name;
  String? countryCode;
  String? sunriseTime;
  String? sunsetTime;
  String? zoneOffset;
  Coordinate? coordinate;

  Location(
      {this.id,
        this.name,
        this.countryCode,
        this.sunriseTime,
        this.sunsetTime,
        this.zoneOffset,
        this.coordinate});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['countryCode'];
    sunriseTime = json['sunriseTime'];
    sunsetTime = json['sunsetTime'];
    zoneOffset = json['zoneOffset'];
    coordinate = json['coordinate'] != null
        ? Coordinate.fromJson(json['coordinate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['countryCode'] = countryCode;
    data['sunriseTime'] = sunriseTime;
    data['sunsetTime'] = sunsetTime;
    data['zoneOffset'] = zoneOffset;
    if (coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    return data;
  }
}

class Coordinate {
  double? latitude;
  double? longitude;

  Coordinate({this.latitude, this.longitude});

  Coordinate.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
