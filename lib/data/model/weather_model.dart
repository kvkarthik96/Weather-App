class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({this.location, this.current});

  WeatherModel.fromMap(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromMap(json['location']) : null;
    current = json['current'] != null ? Current.fromMap(json['current']) : null;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;

  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.localtime});

  Location.fromMap(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    region = json['region'] ?? '';
    country = json['country'] ?? '';
    lat = json['lat'] ?? '';
    lon = json['lon'] ?? '';
    localtime = json['localtime'] ?? '';
  }
}

class Current {
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windKph;
  int? humidity;
  int? cloud;
  double? feelslikeC;

  Current({
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windKph,
    this.humidity,
    this.cloud,
    this.feelslikeC,
  });

  Current.fromMap(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'] != null
        ? json['temp_c'] is int
            ? json['temp_c'].toDouble()
            : json['temp_c']
        : 0;
    tempF = json['temp_f'] != null
        ? json['temp_f'] is int
            ? json['temp_f'].toDouble()
            : json['temp_f']
        : 0;

    isDay = json['is_day'];
    condition =
        json['condition'] != null ? Condition.fromMap(json['condition']) : null;

    windKph = json['wind_kph'];

    humidity = json['humidity'] != null
        ? json is double
            ? json['humidity'].toInt()
            : json['humidity']
        : 0;
    cloud = json['cloud'] != null
        ? json is double
            ? json['cloud'].toInt()
            : json['cloud']
        : 0;

    feelslikeC = tempC = json['feelslike_c'] != null
        ? json['feelslike_c'] is int
            ? json['feelslike_c'].toDouble()
            : json['feelslike_c']
        : 0;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromMap(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
}
