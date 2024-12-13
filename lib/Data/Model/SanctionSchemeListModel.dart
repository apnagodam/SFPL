// To parse this JSON data, do
//
//     final sanctionSchemeListModel = sanctionSchemeListModelFromMap(jsonString);

import 'dart:convert';

SanctionSchemeListModel sanctionSchemeListModelFromMap(String str) => SanctionSchemeListModel.fromMap(json.decode(str));

String sanctionSchemeListModelToMap(SanctionSchemeListModel data) => json.encode(data.toMap());

class SanctionSchemeListModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  SanctionSchemeListModel({
    this.status,
    this.message,
    this.data,
  });

  factory SanctionSchemeListModel.fromMap(Map<String, dynamic> json) => SanctionSchemeListModel(
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
  dynamic sanctionId;
  dynamic userId;
  dynamic schemeId;
  dynamic ltv;
  dynamic interestRate;
  dynamic processingFee;
  dynamic tenor;
  dynamic tenorType;
  dynamic cgst;
  dynamic sgst;
  dynamic status;
  dynamic approvedBy;
  dynamic approvedDate;
  dynamic createdAt;
  dynamic updatedAt;
  Scheme? scheme;

  Datum({
    this.id,
    this.sanctionId,
    this.userId,
    this.schemeId,
    this.ltv,
    this.interestRate,
    this.processingFee,
    this.tenor,
    this.tenorType,
    this.cgst,
    this.sgst,
    this.status,
    this.approvedBy,
    this.approvedDate,
    this.createdAt,
    this.updatedAt,
    this.scheme,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sanctionId: json["sanction_id"],
    userId: json["user_id"],
    schemeId: json["scheme_id"],
    ltv: json["ltv"],
    interestRate: json["interest_rate"],
    processingFee: json["processing_fee"],
    tenor: json["tenor"],
    tenorType: json["tenor_type"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    status: json["status"],
    approvedBy: json["approved_by"],
    approvedDate: json["approved_date"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    scheme: json["scheme"] == null ? null : Scheme.fromMap(json["scheme"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "sanction_id": sanctionId,
    "user_id": userId,
    "scheme_id": schemeId,
    "ltv": ltv,
    "interest_rate": interestRate,
    "processing_fee": processingFee,
    "tenor": tenor,
    "tenor_type": tenorType,
    "cgst": cgst,
    "sgst": sgst,
    "status": status,
    "approved_by": approvedBy,
    "approved_date": approvedDate,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "scheme": scheme?.toMap(),
  };
}

class Scheme {
  dynamic id;
  dynamic schemeName;
  dynamic interestRate;
  dynamic loanPassDays;
  dynamic processingFee;
  dynamic loanPerTotalAmount;
  dynamic tenor;
  dynamic tenorType;
  dynamic guaranteeFee;
  dynamic guarantor;
  dynamic status;
  dynamic cgst;
  dynamic sgst;
  dynamic createdAt;
  dynamic updatedAt;

  Scheme({
    this.id,
    this.schemeName,
    this.interestRate,
    this.loanPassDays,
    this.processingFee,
    this.loanPerTotalAmount,
    this.tenor,
    this.tenorType,
    this.guaranteeFee,
    this.guarantor,
    this.status,
    this.cgst,
    this.sgst,
    this.createdAt,
    this.updatedAt,
  });

  factory Scheme.fromMap(Map<String, dynamic> json) => Scheme(
    id: json["id"],
    schemeName: json["scheme_name"],
    interestRate: json["interest_rate"],
    loanPassDays: json["loan_pass_days"],
    processingFee: json["processing_fee"],
    loanPerTotalAmount: json["loan_per_total_amount"],
    tenor: json["tenor"],
    tenorType: json["tenor_type"],
    guaranteeFee: json["guarantee_fee"],
    guarantor: json["guarantor"],
    status: json["status"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "scheme_name": schemeName,
    "interest_rate": interestRate,
    "loan_pass_days": loanPassDays,
    "processing_fee": processingFee,
    "loan_per_total_amount": loanPerTotalAmount,
    "tenor": tenor,
    "tenor_type": tenorType,
    "guarantee_fee": guaranteeFee,
    "guarantor": guarantor,
    "status": status,
    "cgst": cgst,
    "sgst": sgst,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
