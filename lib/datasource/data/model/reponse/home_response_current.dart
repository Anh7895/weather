class HomeResponseCurrent {
  CalculationTime? calculationTime;
  WeatherState? weatherState;
  Temperature? temperature;
  AtmosphericPressure? atmosphericPressure;
  Humidity? humidity;
  Wind? wind;
  Rain? rain;
  String? snow;
  Humidity? clouds;
  Location? location;

  HomeResponseCurrent(
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

  HomeResponseCurrent.fromJson(Map<String, dynamic> json) {
    calculationTime = json['calculationTime'] != null
        ? new CalculationTime.fromJson(json['calculationTime'])
        : null;
    weatherState = json['weatherState'] != null
        ? new WeatherState.fromJson(json['weatherState'])
        : null;
    temperature = json['temperature'] != null
        ? new Temperature.fromJson(json['temperature'])
        : null;
    atmosphericPressure = json['atmosphericPressure'] != null
        ? new AtmosphericPressure.fromJson(json['atmosphericPressure'])
        : null;
    humidity = json['humidity'] != null
        ? new Humidity.fromJson(json['humidity'])
        : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    rain = json['rain'];
    snow = json['snow'];
    clouds =
    json['clouds'] != null ? new Humidity.fromJson(json['clouds']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calculationTime != null) {
      data['calculationTime'] = this.calculationTime!.toJson();
    }
    if (this.weatherState != null) {
      data['weatherState'] = this.weatherState!.toJson();
    }
    if (this.temperature != null) {
      data['temperature'] = this.temperature!.toJson();
    }
    if (this.atmosphericPressure != null) {
      data['atmosphericPressure'] = this.atmosphericPressure!.toJson();
    }
    if (this.humidity != null) {
      data['humidity'] = this.humidity!.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    data['rain'] = this.rain;
    data['snow'] = this.snow;
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}
class Rain {
  double? oneHourLevel;
  String? unit;

  Rain({this.oneHourLevel, this.unit});

  Rain.fromJson(Map<String, dynamic> json) {
    oneHourLevel = json['oneHourLevel'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['oneHourLevel'] = this.oneHourLevel;
    data['unit'] = this.unit;
    return data;
  }
}

class CalculationTime {
  String? hour;
  String? minutes;
  String? s;
  String? format;

  CalculationTime({this.hour, this.minutes, this.s, this.format});

  CalculationTime.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minutes = json['minutes'];
    s = json['s'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['minutes'] = this.minutes;
    data['s'] = this.s;
    data['format'] = this.format;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['iconId'] = this.iconId;
    data['weatherConditionEnum'] = this.weatherConditionEnum;
    data['weatherIconUrl'] = this.weatherIconUrl;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['maxTemperature'] = this.maxTemperature;
    data['minTemperature'] = this.minTemperature;
    data['feelsLike'] = this.feelsLike;
    data['unit'] = this.unit;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['seaLevelValue'] = this.seaLevelValue;
    data['groundLevelValue'] = this.groundLevelValue;
    data['unit'] = this.unit;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['degrees'] = this.degrees;
    data['gust'] = this.gust;
    data['unit'] = this.unit;
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
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    data['sunriseTime'] = this.sunriseTime;
    data['sunsetTime'] = this.sunsetTime;
    data['zoneOffset'] = this.zoneOffset;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
