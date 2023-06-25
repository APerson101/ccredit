import 'dart:convert';

class BusinessModel {
  String name;
  String location;
  String number;
  String email;
  DateTime dateCreated;
  BusinessModel({
    required this.name,
    required this.location,
    required this.number,
    required this.email,
    required this.dateCreated,
  });

  BusinessModel copyWith({
    String? name,
    String? location,
    String? number,
    String? email,
    DateTime? dateCreated,
  }) {
    return BusinessModel(
      name: name ?? this.name,
      location: location ?? this.location,
      number: number ?? this.number,
      email: email ?? this.email,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'number': number,
      'email': email,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
    };
  }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      number: map['number'] ?? '',
      email: map['email'] ?? '',
      dateCreated: DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessModel.fromJson(String source) =>
      BusinessModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BusinessModel(name: $name, location: $location, number: $number, email: $email, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BusinessModel &&
        other.name == name &&
        other.location == location &&
        other.number == number &&
        other.email == email &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        number.hashCode ^
        email.hashCode ^
        dateCreated.hashCode;
  }
}
