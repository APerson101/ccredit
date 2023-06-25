import 'dart:convert';

class AssetModel {
  String name;
  double value;
  String ticker;
  AssetModel({
    required this.name,
    required this.value,
    required this.ticker,
  });

  AssetModel copyWith({
    String? name,
    double? value,
    String? ticker,
  }) {
    return AssetModel(
      name: name ?? this.name,
      value: value ?? this.value,
      ticker: ticker ?? this.ticker,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'ticker': ticker,
    };
  }

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      name: map['name'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      ticker: map['ticker'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AssetModel.fromJson(String source) =>
      AssetModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AssetModel(name: $name, value: $value, ticker: $ticker)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssetModel &&
        other.name == name &&
        other.value == value &&
        other.ticker == ticker;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode ^ ticker.hashCode;
}
