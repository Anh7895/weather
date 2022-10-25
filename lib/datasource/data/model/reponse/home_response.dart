



class HomeResponse {
  WeatherConvert? weatherConvert;
  AirPollutionRecord? airPollutionRecord;
  List<HourlyConverts>? hourlyConverts;
  List<DailyConverts>? dailyConverts;

  HomeResponse(
      {this.weatherConvert,
        this.airPollutionRecord,
        this.hourlyConverts,
        this.dailyConverts});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    weatherConvert = json['weatherConvert'] != null
        ? WeatherConvert.fromJson(json['weatherConvert'])
        : null;
    airPollutionRecord = json['airPollutionRecord'] != null
        ? AirPollutionRecord.fromJson(json['airPollutionRecord'])
        : null;
    if (json['hourlyConverts'] != null) {
      hourlyConverts = <HourlyConverts>[];
      json['hourlyConverts'].forEach((v) {
        hourlyConverts!.add(HourlyConverts.fromJson(v));
      });
    }
    if (json['dailyConverts'] != null) {
      dailyConverts = <DailyConverts>[];
      json['dailyConverts'].forEach((v) {
        dailyConverts!.add(DailyConverts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (weatherConvert != null) {
      data['weatherConvert'] = weatherConvert!.toJson();
    }
    if (airPollutionRecord != null) {
      data['airPollutionRecord'] = airPollutionRecord!.toJson();
    }
    if (hourlyConverts != null) {
      data['hourlyConverts'] =
          hourlyConverts!.map((v) => v.toJson()).toList();
    }
    if (dailyConverts != null) {
      data['dailyConverts'] =
          dailyConverts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeatherConvert {
  CalculationTime? calculationTime;
  WeatherState? weatherState;
  Temperature? temperature;
  AtmosphericPressure? atmosphericPressure;
  Humidity? humidity;
  ConvertWindSeepUnit? convertWindSeepUnit;
  Null? rain;
  Null? snow;
  Humidity? clouds;
  Location? location;

  WeatherConvert(
      {this.calculationTime,
        this.weatherState,
        this.temperature,
        this.atmosphericPressure,
        this.humidity,
        this.convertWindSeepUnit,
        this.rain,
        this.snow,
        this.clouds,
        this.location});

  WeatherConvert.fromJson(Map<String, dynamic> json) {
    calculationTime = json['calculationTime'] != null
        ? CalculationTime.fromJson(json['calculationTime'])
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
    convertWindSeepUnit = json['convertWindSeepUnit'] != null
        ? ConvertWindSeepUnit.fromJson(json['convertWindSeepUnit'])
        : null;
    rain = json['rain'];
    snow = json['snow'];
    clouds =
    json['clouds'] != null ? Humidity.fromJson(json['clouds']) : null;
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (calculationTime != null) {
      data['calculationTime'] = calculationTime!.toJson();
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
    if (convertWindSeepUnit != null) {
      data['convertWindSeepUnit'] = convertWindSeepUnit!.toJson();
    }
    data['rain'] = rain;
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

class CalculationTime {
  String? hour24h;
  String? minutes;
  String? s;
  String? hour12h;
  String? format;

  CalculationTime(
      {this.hour24h, this.minutes, this.s, this.hour12h, this.format});

  CalculationTime.fromJson(Map<String, dynamic> json) {
    hour24h = json['hour24h'];
    minutes = json['minutes'];
    s = json['s'];
    hour12h = json['hour12h'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['hour24h'] = hour24h;
    data['minutes'] = minutes;
    data['s'] = s;
    data['hour12h'] = hour12h;
    data['format'] = format;
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
  ConvertTempModelFormatC? convertTempModelFormatC;
  ConvertTempModelFormatF? convertTempModelFormatF;

  Temperature({this.convertTempModelFormatC, this.convertTempModelFormatF});

  Temperature.fromJson(Map<String, dynamic> json) {
    convertTempModelFormatC = json['convertTempModelFormatC'] != null
        ? ConvertTempModelFormatC.fromJson(json['convertTempModelFormatC'])
        : null;
    convertTempModelFormatF = json['convertTempModelFormatF'] != null
        ? ConvertTempModelFormatF.fromJson(json['convertTempModelFormatF'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (convertTempModelFormatC != null) {
      data['convertTempModelFormatC'] = convertTempModelFormatC!.toJson();
    }
    if (convertTempModelFormatF != null) {
      data['convertTempModelFormatF'] = convertTempModelFormatF!.toJson();
    }
    return data;
  }
}

class ConvertTempModelFormatC {
  double? value;
  double? maxTemperature;
  double? minTemperature;
  double? feelsLike;
  String? unit;

  ConvertTempModelFormatC(
      {this.value,
        this.maxTemperature,
        this.minTemperature,
        this.feelsLike,
        this.unit});

  ConvertTempModelFormatC.fromJson(Map<String, dynamic> json) {
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

class ConvertTempModelFormatF {
  int? value;
  int? maxTemperature;
  int? minTemperature;
  int? feelsLike;
  String? unit;

  ConvertTempModelFormatF(
      {this.value,
        this.maxTemperature,
        this.minTemperature,
        this.feelsLike,
        this.unit});

  ConvertTempModelFormatF.fromJson(Map<String, dynamic> json) {
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
  int? value;
  int? seaLevelValue;
  int? groundLevelValue;
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

class ConvertWindSeepUnit {
  WindFormatMS? windFormatMS;
  WindFormatMS? windFormatKMH;
  WindFormatMS? windFormatMiH;

  ConvertWindSeepUnit(
      {this.windFormatMS, this.windFormatKMH, this.windFormatMiH});

  ConvertWindSeepUnit.fromJson(Map<String, dynamic> json) {
    windFormatMS = json['windFormatMS'] != null
        ? WindFormatMS.fromJson(json['windFormatMS'])
        : null;
    windFormatKMH = json['windFormatKMH'] != null
        ? WindFormatMS.fromJson(json['windFormatKMH'])
        : null;
    windFormatMiH = json['windFormatMiH'] != null
        ? WindFormatMS.fromJson(json['windFormatMiH'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (windFormatMS != null) {
      data['windFormatMS'] = windFormatMS!.toJson();
    }
    if (windFormatKMH != null) {
      data['windFormatKMH'] = windFormatKMH!.toJson();
    }
    if (windFormatMiH != null) {
      data['windFormatMiH'] = windFormatMiH!.toJson();
    }
    return data;
  }
}

class WindFormatMS {
  int? speed;
  int? degrees;
  int? gust;
  String? unit;

  WindFormatMS({this.speed, this.degrees, this.gust, this.unit});

  WindFormatMS.fromJson(Map<String, dynamic> json) {
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

class AirPollutionRecord {
  String? forecastTime;
  String? airQualityIndex;
  double? so2;
  double? pm25;
  double? pm10;
  int? nh3;
  double? carbonMonoxide;
  double? co;
  double? nitrogenMonoxide;
  double? no;
  double? nitrogenDioxide;
  double? no2;
  double? o3;
  double? ozone;
  double? sulphurDioxide;
  double? fineParticlesMatter;
  double? coarseParticulateMatter;
  int? ammonia;

  AirPollutionRecord(
      {this.forecastTime,
        this.airQualityIndex,
        this.so2,
        this.pm25,
        this.pm10,
        this.nh3,
        this.carbonMonoxide,
        this.co,
        this.nitrogenMonoxide,
        this.no,
        this.nitrogenDioxide,
        this.no2,
        this.o3,
        this.ozone,
        this.sulphurDioxide,
        this.fineParticlesMatter,
        this.coarseParticulateMatter,
        this.ammonia});

  AirPollutionRecord.fromJson(Map<String, dynamic> json) {
    forecastTime = json['forecastTime'];
    airQualityIndex = json['airQualityIndex'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    nh3 = json['nh3'];
    carbonMonoxide = json['carbonMonoxide'];
    co = json['co'];
    nitrogenMonoxide = json['nitrogenMonoxide'];
    no = json['no'];
    nitrogenDioxide = json['nitrogenDioxide'];
    no2 = json['no2'];
    o3 = json['o3'];
    ozone = json['ozone'];
    sulphurDioxide = json['sulphurDioxide'];
    fineParticlesMatter = json['fineParticlesMatter'];
    coarseParticulateMatter = json['coarseParticulateMatter'];
    ammonia = json['ammonia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forecastTime'] = forecastTime;
    data['airQualityIndex'] = airQualityIndex;
    data['so2'] = so2;
    data['pm2_5'] = pm25;
    data['pm10'] = pm10;
    data['nh3'] = nh3;
    data['carbonMonoxide'] = carbonMonoxide;
    data['co'] = co;
    data['nitrogenMonoxide'] = nitrogenMonoxide;
    data['no'] = no;
    data['nitrogenDioxide'] = nitrogenDioxide;
    data['no2'] = no2;
    data['o3'] = o3;
    data['ozone'] = ozone;
    data['sulphurDioxide'] = sulphurDioxide;
    data['fineParticlesMatter'] = fineParticlesMatter;
    data['coarseParticulateMatter'] = coarseParticulateMatter;
    data['ammonia'] = ammonia;
    return data;
  }
}

class HourlyConverts {
  CalculationTime? forecastTime;
  WeatherState? weatherState;
  Temp? temp;
  AtmosphericPressure? atmosphericPressure;
  Humidity? humidity;
  double? uvIndex;
  Humidity? clouds;
  double? visibilityInMetres;
  ConvertWindSeepUnit? wind;
  double? probabilityOfPrecipitation;
  Rain? rain;
  String? snow;

  HourlyConverts(
      {this.forecastTime,
        this.weatherState,
        this.temp,
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
        ? CalculationTime.fromJson(json['forecastTime'])
        : null;
    weatherState = json['weatherState'] != null
        ? WeatherState.fromJson(json['weatherState'])
        : null;
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
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
    wind = json['wind'] != null
        ? ConvertWindSeepUnit.fromJson(json['wind'])
        : null;
    probabilityOfPrecipitation = json['probabilityOfPrecipitation'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (forecastTime != null) {
      data['forecastTime'] = forecastTime!.toJson();
    }
    if (weatherState != null) {
      data['weatherState'] = weatherState!.toJson();
    }
    if (temp != null) {
      data['temp'] = temp!.toJson();
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
    return data;
  }
}

class Temp {
  ConvertTempFormatC? convertTempFormatC;
  ConvertTempFormatF? convertTempFormatF;

  Temp({this.convertTempFormatC, this.convertTempFormatF});

  Temp.fromJson(Map<String, dynamic> json) {
    convertTempFormatC = json['convertTempFormatC'] != null
        ? ConvertTempFormatC.fromJson(json['convertTempFormatC'])
        : null;
    convertTempFormatF = json['convertTempFormatF'] != null
        ? ConvertTempFormatF.fromJson(json['convertTempFormatF'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (convertTempFormatC != null) {
      data['convertTempFormatC'] = convertTempFormatC!.toJson();
    }
    if (convertTempFormatF != null) {
      data['convertTempFormatF'] = convertTempFormatF!.toJson();
    }
    return data;
  }
}

class ConvertTempFormatC {
  double? value;
  double? feelsLike;
  double? dewPoint;
  String? unit;

  ConvertTempFormatC({this.value, this.feelsLike, this.dewPoint, this.unit});

  ConvertTempFormatC.fromJson(Map<String, dynamic> json) {
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

class ConvertTempFormatF {
  int? value;
  int? feelsLike;
  int? dewPoint;
  String? unit;

  ConvertTempFormatF({this.value, this.feelsLike, this.dewPoint, this.unit});

  ConvertTempFormatF.fromJson(Map<String, dynamic> json) {
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

class AtmosphericPressure2 {
  int? seaLevelValue;
  String? unit;

  AtmosphericPressure2({this.seaLevelValue, this.unit});

  AtmosphericPressure2.fromJson(Map<String, dynamic> json) {
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
        ? WeatherState.fromJson(json['weatherState'])
        : null;
    temperature = json['temperature'] != null
        ? Temperature2.fromJson(json['temperature'])
        : null;
    humidity = json['humidity'] != null
        ? Humidity.fromJson(json['humidity'])
        : null;
    clouds =
    json['clouds'] != null ? Humidity.fromJson(json['clouds']) : null;
    probabilityOfPrecipitation = json['probabilityOfPrecipitation'];
    rain = json['rain'] != null ? Rain2.fromJson(json['rain']) : null;
    snow = json['snow'];
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
    if (humidity != null) {
      data['humidity'] = humidity!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['probabilityOfPrecipitation'] = probabilityOfPrecipitation;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    data['snow'] = snow;
    return data;
  }
}

class Temperature2 {
  DailyTemperatureFormatC? dailyTemperatureFormatC;
  DailyTemperatureFormatF? dailyTemperatureFormatF;

  Temperature2({this.dailyTemperatureFormatC, this.dailyTemperatureFormatF});

  Temperature2.fromJson(Map<String, dynamic> json) {
    dailyTemperatureFormatC = json['dailyTemperatureFormatC'] != null
        ? DailyTemperatureFormatC.fromJson(json['dailyTemperatureFormatC'])
        : null;
    dailyTemperatureFormatF = json['dailyTemperatureFormatF'] != null
        ? DailyTemperatureFormatF.fromJson(json['dailyTemperatureFormatF'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (dailyTemperatureFormatC != null) {
      data['dailyTemperatureFormatC'] = dailyTemperatureFormatC!.toJson();
    }
    if (dailyTemperatureFormatF != null) {
      data['dailyTemperatureFormatF'] = dailyTemperatureFormatF!.toJson();
    }
    return data;
  }
}

class DailyTemperatureFormatC {
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
  int? dewPoint;
  String? unit;

  DailyTemperatureFormatC(
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

  DailyTemperatureFormatC.fromJson(Map<String, dynamic> json) {
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

class DailyTemperatureFormatF {
  int? morning;
  int? morningFeelsLike;
  int? day;
  int? dayFeelsLike;
  int? eve;
  int? eveFeelsLike;
  int? night;
  int? nightFeelsLike;
  int? min;
  int? max;
  int? dewPoint;
  String? unit;

  DailyTemperatureFormatF(
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

  DailyTemperatureFormatF.fromJson(Map<String, dynamic> json) {
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

class Rain2 {
  double? value;
  String? unit;

  Rain2({this.value, this.unit});

  Rain2.fromJson(Map<String, dynamic> json) {
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
