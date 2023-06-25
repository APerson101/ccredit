import 'dart:convert';

class SatelliteInfoModel {
  String name;
  SatelliteInfoModel({
    required this.name,
  });

  SatelliteInfoModel copyWith({
    String? name,
  }) {
    return SatelliteInfoModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory SatelliteInfoModel.fromMap(Map<String, dynamic> map) {
    return SatelliteInfoModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SatelliteInfoModel.fromJson(String source) =>
      SatelliteInfoModel.fromMap(json.decode(source));

  @override
  String toString() => 'SatelliteInfoModel(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SatelliteInfoModel && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
