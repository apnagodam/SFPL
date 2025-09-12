// To parse this JSON data, do
//
//     final moneyRequestModel = moneyRequestModelFromJson(jsonString);

import 'dart:convert';

MoneyRequestModel moneyRequestModelFromJson(String str) => MoneyRequestModel.fromJson(json.decode(str));

String moneyRequestModelToJson(MoneyRequestModel data) => json.encode(data.toJson());

class MoneyRequestModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  MoneyRequestModel({
    this.status,
    this.message,
    this.data,
  });

  factory MoneyRequestModel.fromJson(Map<String, dynamic> json) => MoneyRequestModel(
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
  dynamic id;
  dynamic userId;
  dynamic uniqueLoanReqNo;
  dynamic paymentImage;
  dynamic paymentType;
  dynamic appliedAmount;
  dynamic recivedAmount;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.userId,
    this.uniqueLoanReqNo,
    this.paymentImage,
    this.paymentType,
    this.appliedAmount,
    this.recivedAmount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    uniqueLoanReqNo: json["unique_loan_req_no"],
    paymentImage: json["payment_image"],
    paymentType: json["payment_type"],
    appliedAmount: json["applied_amount"],
    recivedAmount: json["recived_amount"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "unique_loan_req_no": uniqueLoanReqNo,
    "payment_image": paymentImage,
    "payment_type": paymentType,
    "applied_amount": appliedAmount,
    "recived_amount": recivedAmount,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
