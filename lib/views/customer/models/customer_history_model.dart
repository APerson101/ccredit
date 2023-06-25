import 'dart:convert';

import 'package:flutter/foundation.dart';

class CustomerHistoryModel {
  String transactionID;
  String amount;
  DateTime date;
  TransactionTypesEnum transactionType;
  CustomerHistoryModel({
    required this.transactionID,
    required this.amount,
    required this.date,
    required this.transactionType,
  });

  CustomerHistoryModel copyWith({
    String? transactionID,
    String? amount,
    DateTime? date,
    TransactionTypesEnum? transactionType,
  }) {
    return CustomerHistoryModel(
      transactionID: transactionID ?? this.transactionID,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      transactionType: transactionType ?? this.transactionType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactionID': transactionID,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'transactionType': describeEnum(transactionType),
    };
  }

  factory CustomerHistoryModel.fromMap(Map<String, dynamic> map) {
    return CustomerHistoryModel(
      transactionID: map['transactionID'] ?? '',
      amount: map['amount'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      transactionType: TransactionTypesEnum.values.firstWhere(
          (element) => describeEnum(element) == (map['transactionType'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerHistoryModel.fromJson(String source) =>
      CustomerHistoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerHistoryModel(transactionID: $transactionID, amount: $amount, date: $date, transactionType: $transactionType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerHistoryModel &&
        other.transactionID == transactionID &&
        other.amount == amount &&
        other.date == date &&
        other.transactionType == transactionType;
  }

  @override
  int get hashCode {
    return transactionID.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        transactionType.hashCode;
  }
}

enum TransactionTypesEnum { accountCreation, sendHbar, buyCcredit, sendCcr }
