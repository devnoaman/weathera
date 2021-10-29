import 'dart:core';

class WeatherModel {
  WeatherModel({
    this.location,
    this.current,
    this.forecast,
    this.alerts,
  });
  Location? location;
  Current? current;
  Forecast? forecast;
  Alerts? alerts;

  WeatherModel.fromJson(Map<String?, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
    alerts = Alerts.fromJson(json['alerts']);
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['location'] = location!.toJson();
    _data['current'] = current!.toJson();
    _data['forecast'] = forecast!.toJson();
    _data['alerts'] = alerts!.toJson();
    return _data;
  }
}

class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current.fromJson(Map<String?, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['last_updated_epoch'] = lastUpdatedEpoch;
    _data['last_updated'] = lastUpdated;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition!.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['uv'] = uv;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    return _data;
  }
}

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });
  String? text;
  String? icon;
  int? code;

  Condition.fromJson(Map<String?, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}

class Forecast {
  Forecast({
    this.forecastday,
  });
  List<Forecastday>? forecastday;

  Forecast.fromJson(Map<String?, dynamic> json) {
    forecastday = List.from(json['forecastday'])
        .map((e) => Forecastday.fromJson(e))
        .toList();
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['forecastday'] = forecastday!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Forecastday {
  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday.fromJson(Map<String?, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = Day.fromJson(json['day']);
    astro = Astro.fromJson(json['astro']);
    hour = List.from(json['hour']).map((e) => Hour.fromJson(e)).toList();
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['date'] = date;
    _data['date_epoch'] = dateEpoch;
    _data['day'] = day!.toJson();
    _data['astro'] = astro!.toJson();
    _data['hour'] = hour!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Day {
  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day.fromJson(Map<String?, dynamic> json) {
    maxtempC = json['maxtemp_c'] + 0.0;
    maxtempF = json['maxtemp_f'] + 0.0;
    mintempC = json['mintemp_c'] + 0.0;
    mintempF = json['mintemp_f'] + 0.0;
    avgtempC = json['avgtemp_c'] + 0.0;
    avgtempF = json['avgtemp_f'] + 0.0;
    maxwindMph = json['maxwind_mph'] + 0.0;
    maxwindKph = json['maxwind_kph'] + 0.0;
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = Condition.fromJson(json['condition']);
    uv = json['uv'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['maxtemp_c'] = maxtempC;
    _data['maxtemp_f'] = maxtempF;
    _data['mintemp_c'] = mintempC;
    _data['mintemp_f'] = mintempF;
    _data['avgtemp_c'] = avgtempC;
    _data['avgtemp_f'] = avgtempF;
    _data['maxwind_mph'] = maxwindMph;
    _data['maxwind_kph'] = maxwindKph;
    _data['totalprecip_mm'] = totalprecipMm;
    _data['totalprecip_in'] = totalprecipIn;
    _data['avgvis_km'] = avgvisKm;
    _data['avgvis_miles'] = avgvisMiles;
    _data['avghumidity'] = avghumidity;
    _data['daily_will_it_rain'] = dailyWillItRain;
    _data['daily_chance_of_rain'] = dailyChanceOfRain;
    _data['daily_will_it_snow'] = dailyWillItSnow;
    _data['daily_chance_of_snow'] = dailyChanceOfSnow;
    _data['condition'] = condition!.toJson();
    _data['uv'] = uv;
    return _data;
  }
}

class Astro {
  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;

  Astro.fromJson(Map<String?, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    _data['moon_illumination'] = moonIllumination;
    return _data;
  }
}

class Hour {
  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  //todo
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  //todo
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;

  Hour.fromJson(Map<String?, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'] + 0.0;
    tempF = json['temp_f'] + 0.0;
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'] + 0.0;
    windKph = json['wind_kph'] + 0.0;
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'] + 0.0;
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'] + 0.0;
    windchillC = json['windchill_c'] + 0.0;
    windchillF = json['windchill_f'] + 0.0;
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'] + 0.0;
    dewpointC = json['dewpoint_c'] + 0.0;
    dewpointF = json['dewpoint_f'] + 0.0;
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'] + 0.0;
    gustKph = json['gust_kph'] + 0.0;
    uv = json['uv'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['time_epoch'] = timeEpoch;
    _data['time'] = time;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition!.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['windchill_c'] = windchillC;
    _data['windchill_f'] = windchillF;
    _data['heatindex_c'] = heatindexC;
    _data['heatindex_f'] = heatindexF;
    _data['dewpoint_c'] = dewpointC;
    _data['dewpoint_f'] = dewpointF;
    _data['will_it_rain'] = willItRain;
    _data['chance_of_rain'] = chanceOfRain;
    _data['will_it_snow'] = willItSnow;
    _data['chance_of_snow'] = chanceOfSnow;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    _data['uv'] = uv;
    return _data;
  }
}

class Alerts {
  Alerts({
    this.alert,
  });
  List<dynamic>? alert;

  Alerts.fromJson(Map<String?, dynamic> json) {
    alert = List.castFrom<dynamic, dynamic>(json['alert']);
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['alert'] = alert;
    return _data;
  }
}
