// To parse this JSON data, do
//
//     final bnplListingModel = bnplListingModelFromJson(jsonString);

import 'dart:convert';

BnplListingModel bnplListingModelFromJson(String str) => BnplListingModel.fromJson(json.decode(str));

String bnplListingModelToJson(BnplListingModel data) => json.encode(data.toJson());

class BnplListingModel {
  String? status;
  String? message;
  List<Datum>? data;

  BnplListingModel({
    this.status,
    this.message,
    this.data,
  });

  factory BnplListingModel.fromJson(Map<String, dynamic> json) => BnplListingModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? userId;
  dynamic uniqueId;
  String? requestedAmount;
  String? interestRate;
  dynamic approvedAmount;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.uniqueId,
    this.requestedAmount,
    this.interestRate,
    this.approvedAmount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    uniqueId: json["unique_id"],
    requestedAmount: json["requested_amount"],
    interestRate: json["interest_rate"],
    approvedAmount: json["approved_amount"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "unique_id": uniqueId,
    "requested_amount": requestedAmount,
    "interest_rate": interestRate,
    "approved_amount": approvedAmount,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
