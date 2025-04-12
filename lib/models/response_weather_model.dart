class ResponseWeatherModel {
  ResponseWeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
    required this.dailyUnits,
    required this.daily,
  });

  final num? latitude;
  final num? longitude;
  final num? generationtimeMs;
  final num? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final num? elevation;
  final CurrentWeatherUnits? currentWeatherUnits;
  final CurrentWeather? currentWeather;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  ResponseWeatherModel copyWith({
    num? latitude,
    num? longitude,
    num? generationtimeMs,
    num? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    num? elevation,
    CurrentWeatherUnits? currentWeatherUnits,
    CurrentWeather? currentWeather,
    DailyUnits? dailyUnits,
    Daily? daily,
  }) {
    return ResponseWeatherModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      generationtimeMs: generationtimeMs ?? this.generationtimeMs,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
      timezone: timezone ?? this.timezone,
      timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
      elevation: elevation ?? this.elevation,
      currentWeatherUnits: currentWeatherUnits ?? this.currentWeatherUnits,
      currentWeather: currentWeather ?? this.currentWeather,
      dailyUnits: dailyUnits ?? this.dailyUnits,
      daily: daily ?? this.daily,
    );
  }

  factory ResponseWeatherModel.fromJson(Map<String, dynamic> json){
    return ResponseWeatherModel(
      latitude: json["latitude"],
      longitude: json["longitude"],
      generationtimeMs: json["generationtime_ms"],
      utcOffsetSeconds: json["utc_offset_seconds"],
      timezone: json["timezone"],
      timezoneAbbreviation: json["timezone_abbreviation"],
      elevation: json["elevation"],
      currentWeatherUnits: json["current_weather_units"] == null ? null : CurrentWeatherUnits.fromJson(json["current_weather_units"]),
      currentWeather: json["current_weather"] == null ? null : CurrentWeather.fromJson(json["current_weather"]),
      dailyUnits: json["daily_units"] == null ? null : DailyUnits.fromJson(json["daily_units"]),
      daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_weather_units": currentWeatherUnits?.toJson(),
    "current_weather": currentWeather?.toJson(),
    "daily_units": dailyUnits?.toJson(),
    "daily": daily?.toJson(),
  };

}

class CurrentWeather {
  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  final String? time;
  final num? interval;
  final num? temperature;
  final num? windspeed;
  final num? winddirection;
  final num? isDay;
  final num? weathercode;

  CurrentWeather copyWith({
    String? time,
    num? interval,
    num? temperature,
    num? windspeed,
    num? winddirection,
    num? isDay,
    num? weathercode,
  }) {
    return CurrentWeather(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      temperature: temperature ?? this.temperature,
      windspeed: windspeed ?? this.windspeed,
      winddirection: winddirection ?? this.winddirection,
      isDay: isDay ?? this.isDay,
      weathercode: weathercode ?? this.weathercode,
    );
  }

  factory CurrentWeather.fromJson(Map<String, dynamic> json){
    return CurrentWeather(
      time: json["time"],
      interval: json["interval"],
      temperature: json["temperature"],
      windspeed: json["windspeed"],
      winddirection: json["winddirection"],
      isDay: json["is_day"],
      weathercode: json["weathercode"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature": temperature,
    "windspeed": windspeed,
    "winddirection": winddirection,
    "is_day": isDay,
    "weathercode": weathercode,
  };

}

class CurrentWeatherUnits {
  CurrentWeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  final String? time;
  final String? interval;
  final String? temperature;
  final String? windspeed;
  final String? winddirection;
  final String? isDay;
  final String? weathercode;

  CurrentWeatherUnits copyWith({
    String? time,
    String? interval,
    String? temperature,
    String? windspeed,
    String? winddirection,
    String? isDay,
    String? weathercode,
  }) {
    return CurrentWeatherUnits(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      temperature: temperature ?? this.temperature,
      windspeed: windspeed ?? this.windspeed,
      winddirection: winddirection ?? this.winddirection,
      isDay: isDay ?? this.isDay,
      weathercode: weathercode ?? this.weathercode,
    );
  }

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json){
    return CurrentWeatherUnits(
      time: json["time"],
      interval: json["interval"],
      temperature: json["temperature"],
      windspeed: json["windspeed"],
      winddirection: json["winddirection"],
      isDay: json["is_day"],
      weathercode: json["weathercode"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature": temperature,
    "windspeed": windspeed,
    "winddirection": winddirection,
    "is_day": isDay,
    "weathercode": weathercode,
  };

}

class Daily {
  Daily({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  final List<DateTime> time;
  final List<num> temperature2MMax;
  final List<num> temperature2MMin;

  Daily copyWith({
    List<DateTime>? time,
    List<num>? temperature2MMax,
    List<num>? temperature2MMin,
  }) {
    return Daily(
      time: time ?? this.time,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
    );
  }

  factory Daily.fromJson(Map<String, dynamic> json){
    return Daily(
      time: json["time"] == null ? [] : List<DateTime>.from(json["time"]!.map((x) => DateTime.tryParse(x ?? ""))),
      temperature2MMax: json["temperature_2m_max"] == null ? [] : List<num>.from(json["temperature_2m_max"]!.map((x) => x)),
      temperature2MMin: json["temperature_2m_min"] == null ? [] : List<num>.from(json["temperature_2m_min"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}").toList(),
    "temperature_2m_max": temperature2MMax.map((x) => x).toList(),
    "temperature_2m_min": temperature2MMin.map((x) => x).toList(),
  };

}

class DailyUnits {
  DailyUnits({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  final String? time;
  final String? temperature2MMax;
  final String? temperature2MMin;

  DailyUnits copyWith({
    String? time,
    String? temperature2MMax,
    String? temperature2MMin,
  }) {
    return DailyUnits(
      time: time ?? this.time,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
    );
  }

  factory DailyUnits.fromJson(Map<String, dynamic> json){
    return DailyUnits(
      time: json["time"],
      temperature2MMax: json["temperature_2m_max"],
      temperature2MMin: json["temperature_2m_min"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m_max": temperature2MMax,
    "temperature_2m_min": temperature2MMin,
  };

}
