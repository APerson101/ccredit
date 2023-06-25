import 'dart:convert';

class CustomerBalance {
  String currency;
  String value;
  String ticker;
  int? number;
  CustomerBalance({
    required this.currency,
    required this.value,
    required this.ticker,
    this.number,
  });

  CustomerBalance copyWith({
    String? currency,
    String? value,
    String? ticker,
    int? number,
  }) {
    return CustomerBalance(
      currency: currency ?? this.currency,
      value: value ?? this.value,
      ticker: ticker ?? this.ticker,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currency': currency,
      'value': value,
      'ticker': ticker,
      'number': number,
    };
  }

  factory CustomerBalance.fromMap(Map<String, dynamic> map) {
    return CustomerBalance(
      currency: map['currency'] ?? '',
      value: map['value'] ?? '',
      ticker: map['ticker'] ?? '',
      number: map['number']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerBalance.fromJson(String source) =>
      CustomerBalance.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerBalance(currency: $currency, value: $value, ticker: $ticker, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerBalance &&
        other.currency == currency &&
        other.value == value &&
        other.ticker == ticker &&
        other.number == number;
  }

  @override
  int get hashCode {
    return currency.hashCode ^
        value.hashCode ^
        ticker.hashCode ^
        number.hashCode;
  }
}
