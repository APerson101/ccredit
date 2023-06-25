import 'dart:convert';

class VerifierModel {
  String name;
  String location;
  String email;
  String number;
  int numberOfVerifications;
  VerifierModel({
    required this.name,
    required this.location,
    required this.email,
    required this.number,
    required this.numberOfVerifications,
  });

  VerifierModel copyWith({
    String? name,
    String? location,
    String? email,
    String? number,
    int? numberOfVerifications,
  }) {
    return VerifierModel(
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      number: number ?? this.number,
      numberOfVerifications:
          numberOfVerifications ?? this.numberOfVerifications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'email': email,
      'number': number,
      'numberOfVerifications': numberOfVerifications,
    };
  }

  factory VerifierModel.fromMap(Map<String, dynamic> map) {
    return VerifierModel(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      email: map['email'] ?? '',
      number: map['number'] ?? '',
      numberOfVerifications: map['numberOfVerifications']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifierModel.fromJson(String source) =>
      VerifierModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VerifierModel(name: $name, location: $location, email: $email, number: $number, numberOfVerifications: $numberOfVerifications)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerifierModel &&
        other.name == name &&
        other.location == location &&
        other.email == email &&
        other.number == number &&
        other.numberOfVerifications == numberOfVerifications;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        email.hashCode ^
        number.hashCode ^
        numberOfVerifications.hashCode;
  }
}
