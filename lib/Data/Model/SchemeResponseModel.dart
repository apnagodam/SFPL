// To parse this JSON data, do
//
//     final schemeResponseModel = schemeResponseModelFromMap(jsonString);

import 'dart:convert';

SchemeResponseModel schemeResponseModelFromMap(String str) => SchemeResponseModel.fromMap(json.decode(str));

String schemeResponseModelToMap(SchemeResponseModel data) => json.encode(data.toMap());

class SchemeResponseModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  SchemeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory SchemeResponseModel.fromMap(Map<String, dynamic> json) => SchemeResponseModel(
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
  dynamic id;
  dynamic schemeName;
  dynamic interestRate;
  dynamic loanPassDays;
  dynamic processingFee;
  dynamic loanPerTotalAmount;
  dynamic tenor;
  dynamic guaranteeFee;
  dynamic guarantor;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.schemeName,
    this.interestRate,
    this.loanPassDays,
    this.processingFee,
    this.loanPerTotalAmount,
    this.tenor,
    this.guaranteeFee,
    this.guarantor,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    schemeName: json["scheme_name"],
    interestRate: json["interest_rate"],
    loanPassDays: json["loan_pass_days"],
    processingFee: json["processing_fee"],
    loanPerTotalAmount: json["loan_per_total_amount"],
    tenor: json["tenor"],
    guaranteeFee: json["guarantee_fee"],
    guarantor: json["guarantor"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "scheme_name": schemeName,
    "interest_rate": interestRate,
    "loan_pass_days": loanPassDays,
    "processing_fee": processingFee,
    "loan_per_total_amount": loanPerTotalAmount,
    "tenor": tenor,
    "guarantee_fee": guaranteeFee,
    "guarantor": guarantor,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
