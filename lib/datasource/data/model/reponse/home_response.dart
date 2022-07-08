class HomeResponse {
  String? message;
  int? status;
  Data? data;

  HomeResponse({this.message, this.status, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
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
  Coordinate? coordinate;
  String? timezone;
  String? timezoneOffset;
  Current? current;
  List<MinutelyList>? minutelyList;
  List<HourlyList>? hourlyList;
  List<DailyList>? dailyList;
  String? alerts;

  Data(
      {this.coordinate,
        this.timezone,
        this.timezoneOffset,
        this.current,
        this.minutelyList,
        this.hourlyList,
        this.dailyList,
        this.alerts});

  Data.fromJson(Map<String, dynamic> json) {
    coordinate = json['coordinate'] != null
        ? Coordinate.fromJson(json['coordinate'])
        : null;
    timezone = json['timezone'];
    timezoneOffset = json['timezoneOffset'];
    current =
    json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['minutelyList'] != null) {
      minutelyList = <MinutelyList>[];
      json['minutelyList'].forEach((v) {
        minutelyList!.add(MinutelyList.fromJson(v));
      });
    }
    if (json['hourlyList'] != null) {
      hourlyList = <HourlyList>[];
      json['hourlyList'].forEach((v) {
        hourlyList!.add(HourlyList.fromJson(v));
      });
    }
    if (json['dailyList'] != null) {
      dailyList = <DailyList>[];
      json['dailyList'].forEach((v) {
        dailyList!.add(DailyList.fromJson(v));
      });
    }
    alerts = json['alerts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    data['timezone'] = timezone;
    data['timezoneOffset'] = timezoneOffset;
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (minutelyList != null) {
      data['minutelyList'] = minutelyList!.map((v) => v.toJson()).toList();
    }
    if (hourlyList != null) {
      data['hourlyList'] = hourlyList!.map((v) => v.toJson()).toList();
    }
    if (dailyList != null) {
      data['dailyList'] = dailyList!.map((v) => v.toJson()).toList();
    }
    data['alerts'] = alerts;
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

class Current {
  String? forecastTime;
  String? sunriseTime;
  String? sunsetTime;
  WeatherState? weatherState;
  Temperature? temperature;
  AtmosphericPressure? atmosphericPressure;
  Humidity? humidity;
  Humidity? clouds;
  double? uvIndex;
  double? visibilityInMetres;
  Wind? wind;
  Rain? rain;
  String? snow;

  Current(
      {this.forecastTime,
        this.sunriseTime,
        this.sunsetTime,
        this.weatherState,
        this.temperature,
        this.atmosphericPressure,
        this.humidity,
        this.clouds,
        this.uvIndex,
        this.visibilityInMetres,
        this.wind,
        this.rain,
        this.snow});

  Current.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'];
    sunriseTime = json['sunriseTime'];
    sunsetTime = json['sunsetTime'];
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
    clouds =
    json['clouds'] != null ? Humidity.fromJson(json['clouds']) : null;
    uvIndex = json['uvIndex'];
    visibilityInMetres = json['visibilityInMetres'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forecastTime'] = forecastTime;
    data['sunriseTime'] = sunriseTime;
    data['sunsetTime'] = sunsetTime;
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
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['uvIndex'] = uvIndex;
    data['visibilityInMetres'] = visibilityInMetres;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    data['snow'] = snow;
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
  double? feelsLike;
  double? dewPoint;
  String? unit;

  Temperature({this.value, this.feelsLike, this.dewPoint, this.unit});

  Temperature.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    feelsLike = json['feelsLike'];
    dewPoint = json['dewPoint'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = value;
    data['feelsLike'] = feelsLike;
    data['dewPoint'] = dewPoint;
    data['unit'] = unit;
    return data;
  }
}

class AtmosphericPressure {
  double? seaLevelValue;
  String? unit;

  AtmosphericPressure({this.seaLevelValue, this.unit});

  AtmosphericPressure.fromJson(Map<String, dynamic> json) {
    seaLevelValue = json['seaLevelValue'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['seaLevelValue'] = seaLevelValue;
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
  String? unit;

  Rain({this.oneHourLevel, this.unit});

  Rain.fromJson(Map<String, dynamic> json) {
    oneHourLevel = json['oneHourLevel'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['oneHourLevel'] = oneHourLevel;
    data['unit'] = unit;
    return data;
  }
}

class MinutelyList {
  String? forecastTime;
  double? precipitationVolume;

  MinutelyList({this.forecastTime, this.precipitationVolume});

  MinutelyList.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'];
    precipitationVolume = json['precipitationVolume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forecastTime'] = forecastTime;
    data['precipitationVolume'] = precipitationVolume;
    return data;
  }
}

class HourlyList {
  String? forecastTime;
  WeatherState? weatherState;
  Temperature? temperature;
  AtmosphericPressure? atmosphericPressure;
  Humidity? humidity;
  double? uvIndex;
  Humidity? clouds;
  double? visibilityInMetres;
  Wind? wind;
  double? probabilityOfPrecipitation;
  Rain? rain;
  String? snow;
  int? probabilityOfPrecipitationPercentage;

  HourlyList(
      {this.forecastTime,
        this.weatherState,
        this.temperature,
        this.atmosphericPressure,
        this.humidity,
        this.uvIndex,
        this.clouds,
        this.visibilityInMetres,
        this.wind,
        this.probabilityOfPrecipitation,
        this.rain,
        this.snow,
        this.probabilityOfPrecipitationPercentage});

  HourlyList.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'];
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
    uvIndex = json['uvIndex'];
    clouds =
    json['clouds'] != null ? Humidity.fromJson(json['clouds']) : null;
    visibilityInMetres = json['visibilityInMetres'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    probabilityOfPrecipitation = json['probabilityOfPrecipitation'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    snow = json['snow'];
    probabilityOfPrecipitationPercentage =
    json['probabilityOfPrecipitationPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forecastTime'] = forecastTime;
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
    data['uvIndex'] = uvIndex;
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['visibilityInMetres'] = visibilityInMetres;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['probabilityOfPrecipitation'] = probabilityOfPrecipitation;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    data['snow'] = snow;
    data['probabilityOfPrecipitationPercentage'] =
        probabilityOfPrecipitationPercentage;
    return data;
  }
}
class Temperature1 {
  double? morning;
  double? morningFeelsLike;
  double? day;
  double? dayFeelsLike;
  double? eve;
  double? eveFeelsLike;
  double? night;
  double? nightFeelsLike;
  double? min;
  double? max;
  String? dewPoint;
  String? unit;

  Temperature1(
      {this.morning,
        this.morningFeelsLike,
        this.day,
        this.dayFeelsLike,
        this.eve,
        this.eveFeelsLike,
        this.night,
        this.nightFeelsLike,
        this.min,
        this.max,
        this.dewPoint,
        this.unit});

  Temperature1.fromJson(Map<String, dynamic> json) {
    morning = json['morning'];
    morningFeelsLike = json['morningFeelsLike'];
    day = json['day'];
    dayFeelsLike = json['dayFeelsLike'];
    eve = json['eve'];
    eveFeelsLike = json['eveFeelsLike'];
    night = json['night'];
    nightFeelsLike = json['nightFeelsLike'];
    min = json['min'];
    max = json['max'];
    dewPoint = json['dewPoint'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['morning'] = morning;
    data['morningFeelsLike'] = morningFeelsLike;
    data['day'] = day;
    data['dayFeelsLike'] = dayFeelsLike;
    data['eve'] = eve;
    data['eveFeelsLike'] = eveFeelsLike;
    data['night'] = night;
    data['nightFeelsLike'] = nightFeelsLike;
    data['min'] = min;
    data['max'] = max;
    data['dewPoint'] = dewPoint;
    data['unit'] = unit;
    return data;
  }
}

class DailyList {
  String? forecastTime;
  String? sunriseTime;
  String? sunsetTime;
  String? moonriseTime;
  String? moonsetTime;
  MoonPhase? moonPhase;
  WeatherState? weatherState;
  Temperature? temperature;
  AtmosphericPressure? atmosphericPressure;
  Humidity? humidity;
  Wind? wind;
  Humidity? clouds;
  double? uvIndex;
  double? probabilityOfPrecipitation;
  Rain? rain;
  String? snow;
  int? probabilityOfPrecipitationPercentage;


  DailyList(
      {this.forecastTime,
        this.sunriseTime,
        this.sunsetTime,
        this.moonriseTime,
        this.moonsetTime,
        this.moonPhase,
        this.weatherState,
        this.temperature,
        this.atmosphericPressure,
        this.humidity,
        this.wind,
        this.clouds,
        this.uvIndex,
        this.probabilityOfPrecipitation,
        this.rain,
        this.snow,
        this.probabilityOfPrecipitationPercentage});

  DailyList.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'];
    sunriseTime = json['sunriseTime'];
    sunsetTime = json['sunsetTime'];
    moonriseTime = json['moonriseTime'];
    moonsetTime = json['moonsetTime'];
    moonPhase = json['moonPhase'] != null
        ? MoonPhase.fromJson(json['moonPhase'])
        : null;
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
    clouds =
    json['clouds'] != null ? Humidity.fromJson(json['clouds']) : null;
    uvIndex = json['uvIndex'];
    probabilityOfPrecipitation = json['probabilityOfPrecipitation'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    snow = json['snow'];
    probabilityOfPrecipitationPercentage =
    json['probabilityOfPrecipitationPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forecastTime'] = forecastTime;
    data['sunriseTime'] = sunriseTime;
    data['sunsetTime'] = sunsetTime;
    data['moonriseTime'] = moonriseTime;
    data['moonsetTime'] = moonsetTime;
    if (moonPhase != null) {
      data['moonPhase'] = moonPhase!.toJson();
    }
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
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['uvIndex'] = uvIndex;
    data['probabilityOfPrecipitation'] = probabilityOfPrecipitation;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    data['snow'] = snow;
    data['probabilityOfPrecipitationPercentage'] =
        probabilityOfPrecipitationPercentage;
    return data;
  }
}

class MoonPhase {
  double? value;
  String? type;

  MoonPhase({this.value, this.type});

  MoonPhase.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = value;
    data['type'] = type;
    return data;
  }
}


class Rain1 {
  double? value;
  String? unit;

  Rain1({this.value, this.unit});

  Rain1.fromJson(Map<String, dynamic> json) {
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
