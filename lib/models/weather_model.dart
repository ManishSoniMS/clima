class WeatherModel {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  @override
  String toString() {
    return 'WeatherModel{' +
        ' coord: $coord,' +
        ' weather: $weather,' +
        ' base: $base,' +
        ' main: $main,' +
        ' visibility: $visibility,' +
        ' wind: $wind,' +
        ' clouds: $clouds,' +
        ' dt: $dt,' +
        ' sys: $sys,' +
        ' timezone: $timezone,' +
        ' id: $id,' +
        ' name: $name,' +
        ' cod: $cod,' +
        '}';
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      coord: Coord.fromMap(map['coord']),
      weather: List<Weather>.from(
        (map['weather'] as List).map(
          (e) => Weather.fromMap(e as Map<String, dynamic>),
        ),
      ),
      base: map['base'],
      main: Main.fromMap(map['main']),
      visibility: map['visibility'],
      wind: Wind.fromMap(map['wind']),
      clouds: Clouds.fromMap(map['clouds']),
      dt: map['dt'],
      sys: Sys.fromMap(map['sys']),
      timezone: map['timezone'],
      id: map['id'],
      name: map['name'],
      cod: map['cod'],
    );
  }
}

class Coord {
  final double lon;
  final double lat;

  const Coord({required this.lon, required this.lat});

  @override
  String toString() {
    return 'Coord{' + ' lon: $lon,' + ' lat: $lat,' + '}';
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(lon: map['lon'], lat: map['lat']);
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  String toString() {
    return 'Weather{' +
        ' id: $id,' +
        ' main: $main,' +
        ' description: $description,' +
        ' icon: $icon,' +
        '}';
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }
}

class Main {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final double pressure;
  final double humidity;
  final double sea_level;
  final double grnd_level;

  const Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    required this.sea_level,
    required this.grnd_level,
  });

  @override
  String toString() {
    return 'Main{' +
        ' temp: $temp,' +
        ' feels_like: $feels_like,' +
        ' temp_min: $temp_min,' +
        ' temp_max: $temp_max,' +
        ' pressure: $pressure,' +
        ' humidity: $humidity,' +
        ' sea_level: $sea_level,' +
        ' grnd_level: $grnd_level,' +
        '}';
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'],
      feels_like: map['feels_like'],
      temp_min: map['temp_min'],
      temp_max: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      sea_level: map['sea_level'],
      grnd_level: map['grnd_level'],
    );
  }
}

class Wind {
  final double speed;
  final int deg;
  final double gust;

  const Wind({required this.speed, required this.deg, required this.gust});

  @override
  String toString() {
    return 'Wind{' + ' speed: $speed,' + ' deg: $deg,' + ' gust: $gust,' + '}';
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(speed: map['speed'], deg: map['deg'], gust: map['gust']);
  }
}

class Clouds {
  final int all;

  const Clouds({required this.all});

  @override
  String toString() {
    return 'Clouds{' + ' all: $all,' + '}';
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(all: map['all']);
  }
}

class Sys {
  final String country;
  final int sunrise;
  final int sunset;

  const Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  String toString() {
    return 'Sys{' +
        ' country: $country,' +
        ' sunrise: $sunrise,' +
        ' sunset: $sunset,' +
        '}';
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }
}
