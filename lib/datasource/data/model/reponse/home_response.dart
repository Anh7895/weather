class HomeResponse{
  CurrentConvert? currentConvert;
  AirPollutionRecord? airPollutionRecord;
  List<HourlyConverts>? hourlyConverts;
  List<DailyConverts>? dailyConverts;

  HomeResponse(
      {this.currentConvert,
        this.airPollutionRecord,
        this.hourlyConverts,
        this.dailyConverts});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    currentConvert = json['currentConvert'] != null
        ? new CurrentConvert.fromJson(json['currentConvert'])
        : null;
    airPollutionRecord = json['airPollutionRecord'] != null
        ? new AirPollutionRecord.fromJson(json['airPollutionRecord'])
        : null;
    if (json['hourlyConverts'] != null) {
      hourlyConverts = <HourlyConverts>[];
      json['hourlyConverts'].forEach((v) {
        hourlyConverts!.add(new HourlyConverts.fromJson(v));
      });
    }
    if (json['dailyConverts'] != null) {
      dailyConverts = <DailyConverts>[];
      json['dailyConverts'].forEach((v) {
        dailyConverts!.add(new DailyConverts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentConvert != null) {
      data['currentConvert'] = this.currentConvert!.toJson();
    }
    if (this.airPollutionRecord != null) {
      data['airPollutionRecord'] = this.airPollutionRecord!.toJson();
    }
    if (this.hourlyConverts != null) {
      data['hourlyConverts'] =
          this.hourlyConverts!.map((v) => v.toJson()).toList();
    }
    if (this.dailyConverts != null) {
      data['dailyConverts'] =
          this.dailyConverts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentConvert {
  ForecastTime? forecastTime;
  ForecastTime? sunriseTime;
  ForecastTime? sunsetTime;
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

  CurrentConvert(
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

  CurrentConvert.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'] != null
        ? new ForecastTime.fromJson(json['forecastTime'])
        : null;
    sunriseTime = json['sunriseTime'] != null
        ? new ForecastTime.fromJson(json['sunriseTime'])
        : null;
    sunsetTime = json['sunsetTime'] != null
        ? new ForecastTime.fromJson(json['sunsetTime'])
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
    clouds =
    json['clouds'] != null ? new Humidity.fromJson(json['clouds']) : null;
    uvIndex = json['uvIndex'];
    visibilityInMetres = json['visibilityInMetres'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    rain = json['rain'];
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastTime != null) {
      data['forecastTime'] = this.forecastTime!.toJson();
    }
    if (this.sunriseTime != null) {
      data['sunriseTime'] = this.sunriseTime!.toJson();
    }
    if (this.sunsetTime != null) {
      data['sunsetTime'] = this.sunsetTime!.toJson();
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
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    data['uvIndex'] = this.uvIndex;
    data['visibilityInMetres'] = this.visibilityInMetres;
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    data['rain'] = this.rain;
    data['snow'] = this.snow;
    return data;
  }
}

class ForecastTime {
  String? hour;
  String? minutes;
  String? s;
  String? format;

  ForecastTime({this.hour, this.minutes, this.s, this.format});

  ForecastTime.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['feelsLike'] = this.feelsLike;
    data['dewPoint'] = this.dewPoint;
    data['unit'] = this.unit;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seaLevelValue'] = this.seaLevelValue;
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

class AirPollutionRecord {
  String? forecastTime;
  String? airQualityIndex;
  double? co;
  double? no;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  double? nh3;
  double? carbonMonoxide;
  double? nitrogenMonoxide;
  double? nitrogenDioxide;
  double? ozone;
  double? sulphurDioxide;
  double? fineParticlesMatter;
  double? coarseParticulateMatter;
  double? ammonia;

  AirPollutionRecord(
      {this.forecastTime,
        this.airQualityIndex,
        this.co,
        this.no,
        this.no2,
        this.o3,
        this.so2,
        this.pm25,
        this.pm10,
        this.nh3,
        this.carbonMonoxide,
        this.nitrogenMonoxide,
        this.nitrogenDioxide,
        this.ozone,
        this.sulphurDioxide,
        this.fineParticlesMatter,
        this.coarseParticulateMatter,
        this.ammonia});

  AirPollutionRecord.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'];
    airQualityIndex = json['airQualityIndex'];
    co = json['co'];
    no = json['no'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    nh3 = json['nh3'];
    carbonMonoxide = json['carbonMonoxide'];
    nitrogenMonoxide = json['nitrogenMonoxide'];
    nitrogenDioxide = json['nitrogenDioxide'];
    ozone = json['ozone'];
    sulphurDioxide = json['sulphurDioxide'];
    fineParticlesMatter = json['fineParticlesMatter'];
    coarseParticulateMatter = json['coarseParticulateMatter'];
    ammonia = json['ammonia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forecastTime'] = this.forecastTime;
    data['airQualityIndex'] = this.airQualityIndex;
    data['co'] = this.co;
    data['no'] = this.no;
    data['no2'] = this.no2;
    data['o3'] = this.o3;
    data['so2'] = this.so2;
    data['pm2_5'] = this.pm25;
    data['pm10'] = this.pm10;
    data['nh3'] = this.nh3;
    data['carbonMonoxide'] = this.carbonMonoxide;
    data['nitrogenMonoxide'] = this.nitrogenMonoxide;
    data['nitrogenDioxide'] = this.nitrogenDioxide;
    data['ozone'] = this.ozone;
    data['sulphurDioxide'] = this.sulphurDioxide;
    data['fineParticlesMatter'] = this.fineParticlesMatter;
    data['coarseParticulateMatter'] = this.coarseParticulateMatter;
    data['ammonia'] = this.ammonia;
    return data;
  }
}

class HourlyConverts {
  ForecastTime? forecastTime;
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

  HourlyConverts(
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
        this.snow});

  HourlyConverts.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'] != null
        ? new ForecastTime.fromJson(json['forecastTime'])
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
    uvIndex = json['uvIndex'];
    clouds =
    json['clouds'] != null ? new Humidity.fromJson(json['clouds']) : null;
    visibilityInMetres = json['visibilityInMetres'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    probabilityOfPrecipitation = json['probabilityOfPrecipitation'];
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastTime != null) {
      data['forecastTime'] = this.forecastTime!.toJson();
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
    data['uvIndex'] = this.uvIndex;
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    data['visibilityInMetres'] = this.visibilityInMetres;
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    data['probabilityOfPrecipitation'] = this.probabilityOfPrecipitation;
    if (this.rain != null) {
      data['rain'] = this.rain!.toJson();
    }
    data['snow'] = this.snow;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oneHourLevel'] = this.oneHourLevel;
    data['unit'] = this.unit;
    return data;
  }
}

class DailyConverts {
  String? forecastTime;
  WeatherState? weatherState;
  Temperature2? temperature;
  Humidity? humidity;
  Humidity? clouds;
  double? probabilityOfPrecipitation;
  Rain2? rain;
  String? snow;

  DailyConverts(
      {this.forecastTime,
        this.weatherState,
        this.temperature,
        this.humidity,
        this.clouds,
        this.probabilityOfPrecipitation,
        this.rain,
        this.snow});

  DailyConverts.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'];
    weatherState = json['weatherState'] != null
        ? new WeatherState.fromJson(json['weatherState'])
        : null;
    temperature = json['temperature'] != null
        ? new Temperature2.fromJson(json['temperature'])
        : null;
    humidity = json['humidity'] != null
        ? new Humidity.fromJson(json['humidity'])
        : null;
    clouds =
    json['clouds'] != null ? new Humidity.fromJson(json['clouds']) : null;
    probabilityOfPrecipitation = json['probabilityOfPrecipitation'];
    rain = json['rain'] != null ? new Rain2.fromJson(json['rain']) : null;
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forecastTime'] = this.forecastTime;
    if (this.weatherState != null) {
      data['weatherState'] = this.weatherState!.toJson();
    }
    if (this.temperature != null) {
      data['temperature'] = this.temperature!.toJson();
    }
    if (this.humidity != null) {
      data['humidity'] = this.humidity!.toJson();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    data['probabilityOfPrecipitation'] = this.probabilityOfPrecipitation;
    if (this.rain != null) {
      data['rain'] = this.rain!.toJson();
    }
    data['snow'] = this.snow;
    return data;
  }
}

class Temperature2 {
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
  Null? dewPoint;
  Null? unit;

  Temperature2(
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

  Temperature2.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['morning'] = this.morning;
    data['morningFeelsLike'] = this.morningFeelsLike;
    data['day'] = this.day;
    data['dayFeelsLike'] = this.dayFeelsLike;
    data['eve'] = this.eve;
    data['eveFeelsLike'] = this.eveFeelsLike;
    data['night'] = this.night;
    data['nightFeelsLike'] = this.nightFeelsLike;
    data['min'] = this.min;
    data['max'] = this.max;
    data['dewPoint'] = this.dewPoint;
    data['unit'] = this.unit;
    return data;
  }
}

class Rain2 {
  double? value;
  String? unit;

  Rain2({this.value, this.unit});

  Rain2.fromJson(Map<String, dynamic> json) {
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