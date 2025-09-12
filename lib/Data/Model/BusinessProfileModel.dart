// To parse this JSON data, do
//
//     final businessProfileModel = businessProfileModelFromJson(jsondynamic);

import 'dart:convert';

BusinessProfileModel businessProfileModelFromJson(dynamic str) => BusinessProfileModel.fromJson(json.decode(str));

dynamic businessProfileModelToJson(BusinessProfileModel data) => json.encode(data.toJson());

class BusinessProfileModel {
  dynamic? status;
  dynamic? message;
  Data? data;

  BusinessProfileModel({
    this.status,
    this.message,
    this.data,
  });

  factory BusinessProfileModel.fromJson(Map<dynamic, dynamic> json) => BusinessProfileModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<dynamic, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  dynamic? userType;
  dynamic? summery;
  dynamic? state;
  dynamic? district;
  dynamic? commodity;

  Data({
    this.userType,
    this.summery,
    this.state,
    this.district,
    this.commodity,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    userType: json["user_type"],
    summery: json["summery"],
    state: json["state"],
    district: json["district"],
    commodity: json["commodity"],
  );

  Map<dynamic, dynamic> toJson() => {
    "user_type": userType,
    "summery": summery,
    "state": state,
    "district": district,
    "commodity": commodity,
  };
}
