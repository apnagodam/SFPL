// To parse this JSON data, do
//
//     final santionedLimitHoldModel = santionedLimitHoldModelFromJson(jsonString);

import 'dart:convert';

SantionedLimitHoldModel santionedLimitHoldModelFromJson(String str) =>
    SantionedLimitHoldModel.fromJson(json.decode(str));

String santionedLimitHoldModelToJson(SantionedLimitHoldModel data) =>
    json.encode(data.toJson());

class SantionedLimitHoldModel {
  dynamic status;
  dynamic message;
  dynamic sanctionLimit;
  dynamic usedLimit;
  dynamic totalHoldLimit;
  dynamic balance;
  List<Datum>? data;

  SantionedLimitHoldModel({
    this.status,
    this.message,
    this.sanctionLimit,
    this.usedLimit,
    this.totalHoldLimit,
    this.balance,
    this.data,
  });

  factory SantionedLimitHoldModel.fromJson(Map<String, dynamic> json) =>
      SantionedLimitHoldModel(
        status: json["status"],
        message: json["message"],
        sanctionLimit: json["sanction_limit"],
        usedLimit: json["used_limit"],
        totalHoldLimit: json["total_hold_limit"],
        balance: json["balance"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "sanction_limit": sanctionLimit,
        "used_limit": usedLimit,
        "total_hold_limit": totalHoldLimit,
        "balance": balance,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  dynamic id;
  dynamic userId;
  dynamic sanctionedSchemeId;
  dynamic holdAmount;
  dynamic productId;
  dynamic productName;
  dynamic sbtTradeId;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.userId,
    this.sanctionedSchemeId,
    this.holdAmount,
    this.productId,
    this.productName,
    this.sbtTradeId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        sanctionedSchemeId: json["sanctioned_scheme_id"],
        holdAmount: json["hold_amount"],
        productId: json["product_id"],
        productName: json["product_name"],
        sbtTradeId: json["sbt_trade_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sanctioned_scheme_id": sanctionedSchemeId,
        "hold_amount": holdAmount,
        "product_id": productId,
        "product_name": productName,
        "sbt_trade_id": sbtTradeId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
