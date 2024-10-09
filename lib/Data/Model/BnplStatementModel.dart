// To parse this JSON data, do
//
//     final bnplStatementModel = bnplStatementModelFromMap(jsonString);

import 'dart:convert';

BnplStatementModel bnplStatementModelFromMap(String str) => BnplStatementModel.fromMap(json.decode(str));

String bnplStatementModelToMap(BnplStatementModel data) => json.encode(data.toMap());

class BnplStatementModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  BnplStatementModel({
    this.status,
    this.message,
    this.data,
  });

  factory BnplStatementModel.fromMap(Map<String, dynamic> json) => BnplStatementModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  dynamic date;
  dynamic narration;
  dynamic reference;
  dynamic type;
  dynamic amount;

  Datum({
    this.date,
    this.narration,
    this.reference,
    this.type,
    this.amount,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    date: json["date"],
    narration: json["narration"],
    reference: json["reference"],
    type: json["type"],
    amount: json["amount"],
  );

  Map<String, dynamic> toMap() => {
    "date": date,
    "narration": narration,
    "reference": reference,
    "type": type,
    "amount": amount,
  };
}
