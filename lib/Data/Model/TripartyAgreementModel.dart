// To parse this JSON data, do
//
//     final tripartyAgreementModel = tripartyAgreementModelFromMap(jsonString);

import 'dart:convert';

TripartyAgreementModel tripartyAgreementModelFromMap(String str) => TripartyAgreementModel.fromMap(json.decode(str));

String tripartyAgreementModelToMap(TripartyAgreementModel data) => json.encode(data.toMap());

class TripartyAgreementModel {
  String? status;
  String? message;
  String? data;

  TripartyAgreementModel({
    this.status,
    this.message,
    this.data,
  });

  factory TripartyAgreementModel.fromMap(Map<String, dynamic> json) => TripartyAgreementModel(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
