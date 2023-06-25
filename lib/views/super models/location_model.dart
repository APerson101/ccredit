import 'dart:convert';

class LocationModel {
  String name;
  String id;
  LatLong location;
  String ownerName;
  LocationModel({
    required this.name,
    required this.id,
    required this.location,
    required this.ownerName,
  });

  LocationModel copyWith({
    String? name,
    String? id,
    LatLong? location,
    String? ownerName,
  }) {
    return LocationModel(
      name: name ?? this.name,
      id: id ?? this.id,
      location: location ?? this.location,
      ownerName: ownerName ?? this.ownerName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'location': location.toMap(),
      'ownerName': ownerName,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      location: LatLong.fromMap(map['location']),
      ownerName: map['ownerName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocationModel(name: $name, id: $id, location: $location, ownerName: $ownerName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationModel &&
        other.name == name &&
        other.id == id &&
        other.location == location &&
        other.ownerName == ownerName;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ location.hashCode ^ ownerName.hashCode;
  }
}

class LatLong {
  String latitude;
  String longitude;
  LatLong({
    required this.latitude,
    required this.longitude,
  });

  LatLong copyWith({
    String? latitude,
    String? longitude,
  }) {
    return LatLong(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LatLong.fromMap(Map<String, dynamic> map) {
    return LatLong(
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLong.fromJson(String source) =>
      LatLong.fromMap(json.decode(source));

  @override
  String toString() => 'LatLong(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LatLong &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
