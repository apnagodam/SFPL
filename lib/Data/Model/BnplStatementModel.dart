// To parse this JSON data, do
//
//     final bnplStatementModel = bnplStatementModelFromMap(jsonString);

import 'dart:convert';

BnplStatementModel bnplStatementModelFromMap(String str) =>
    BnplStatementModel.fromMap(json.decode(str));

String bnplStatementModelToMap(BnplStatementModel data) =>
    json.encode(data.toMap());

class BnplStatementModel {
  dynamic status;
  dynamic message;
  dynamic closingBalance;
  dynamic openingBalance;
  List<StatementDatum>? data;

  BnplStatementModel({
    this.status,
    this.message,
    this.closingBalance,
    this.openingBalance,
    this.data,
  });

  factory BnplStatementModel.fromMap(Map<String, dynamic> json) =>
      BnplStatementModel(
        status: json["status"],
        message: json["message"],
        closingBalance: json['closing_balance'],
        openingBalance: json['opening_balance'],
        data: json["data"] == null
            ? []
            : List<StatementDatum>.from(
                json["data"]!.map((x) => StatementDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "opening_balance": openingBalance,
        "closing_balance": closingBalance,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class StatementDatum {
  dynamic date;
  dynamic narration;
  dynamic label;
  dynamic gatepass;
  dynamic reference;
  dynamic type;
  dynamic amount;
  dynamic balance;
  dynamic commodityPrice;
  dynamic weight;

  StatementDatum(
      {this.date,
      this.narration,
      this.label,
      this.gatepass,
      this.reference,
      this.type,
      this.amount,
      this.balance,
      this.commodityPrice,
      this.weight});

  factory StatementDatum.fromMap(Map<String, dynamic> json) => StatementDatum(
      date: json["date"],
      narration: json["narration"],
      label: json['label'],
      gatepass: json["gatepass"],
      reference: json["reference_no"],
      type: json["type"],
      amount: json["amount"],
      balance: json['balance'],
      commodityPrice: json['commodity_price'] ?? double.tryParse('0.0'),
      weight: json['weight'] ?? double.tryParse('0.0'));

  Map<String, dynamic> toMap() => {
        "date": date,
        "narration": narration,
        "label": label,
        "gatepass": gatepass,
        "reference_no": reference,
        "type": type,
        "amount": amount,
        "balance": balance,
        'commodity_price': commodityPrice,
        'weight': weight
      };
}
