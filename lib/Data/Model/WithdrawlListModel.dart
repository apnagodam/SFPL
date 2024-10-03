// To parse this JSON data, do
//
//     final withdrawlResponseModel = withdrawlResponseModelFromMap(jsonString);

import 'dart:convert';

WithdrawlResponseModel withdrawlResponseModelFromMap(String str) => WithdrawlResponseModel.fromMap(json.decode(str));

String withdrawlResponseModelToMap(WithdrawlResponseModel data) => json.encode(data.toMap());

class WithdrawlResponseModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  WithdrawlResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory WithdrawlResponseModel.fromMap(Map<String, dynamic> json) => WithdrawlResponseModel(
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
  dynamic wrr;
  dynamic userId;
  dynamic requestedAmount;
  dynamic approvedAmount;
  dynamic paymentBy;
  dynamic referenceNo;
  dynamic file;
  dynamic remark;
  dynamic approvedBy;
  dynamic verifiedBy;
  String? verifiedDate;
  dynamic fundAccountId;
  dynamic contactId;
  dynamic status;
  dynamic approvedDate;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.wrr,
    this.userId,
    this.requestedAmount,
    this.approvedAmount,
    this.paymentBy,
    this.referenceNo,
    this.file,
    this.remark,
    this.approvedBy,
    this.verifiedBy,
    this.verifiedDate,
    this.fundAccountId,
    this.contactId,
    this.status,
    this.approvedDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    wrr: json["wrr"],
    userId: json["user_id"],
    requestedAmount: json["requested_amount"],
    approvedAmount: json["approved_amount"],
    paymentBy: json["payment_by"],
    referenceNo: json["reference_no"],
    file: json["file"],
    remark: json["remark"],
    approvedBy: json["approved_by"],
    verifiedBy: json["verified_by"],
    verifiedDate: json["verified_date"] ,
    fundAccountId: json["fund_account_id"],
    contactId: json["contact_id"],
    status: json["status"],
    approvedDate: json["approved_date"],
    createdAt: json["created_at"] ,
    updatedAt: json["updated_at"] ,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "wrr": wrr,
    "user_id": userId,
    "requested_amount": requestedAmount,
    "approved_amount": approvedAmount,
    "payment_by": paymentBy,
    "reference_no": referenceNo,
    "file": file,
    "remark": remark,
    "approved_by": approvedBy,
    "verified_by": verifiedBy,
    "verified_date": verifiedDate,
    "fund_account_id": fundAccountId,
    "contact_id": contactId,
    "status": status,
    "approved_date": approvedDate,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
