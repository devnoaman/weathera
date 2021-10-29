class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

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

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] as String?,
        region: json['region'] as String?,
        country: json['country'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        tzId: json['tz_id'] as String?,
        localtimeEpoch: json['localtime_epoch'] as int?,
        localtime: json['localtime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime,
      };

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Location) return false;
    return other.name == name &&
        other.region == region &&
        other.country == country &&
        other.lat == lat &&
        other.lon == lon &&
        other.tzId == tzId &&
        other.localtimeEpoch == localtimeEpoch &&
        other.localtime == localtime;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      region.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      tzId.hashCode ^
      localtimeEpoch.hashCode ^
      localtime.hashCode;
}
