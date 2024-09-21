// To parse this JSON data, do
//
//     final adharVerifyOtpModel = adharVerifyOtpModelFromMap(jsonString);

import 'dart:convert';

AdharVerifyOtpModel adharVerifyOtpModelFromMap(String str) => AdharVerifyOtpModel.fromMap(json.decode(str));

String adharVerifyOtpModelToMap(AdharVerifyOtpModel data) => json.encode(data.toMap());

class AdharVerifyOtpModel {
  int? status;
  String? message;
  AadharData? data;

  AdharVerifyOtpModel({
    this.status,
    this.message,
    this.data,
  });

  factory AdharVerifyOtpModel.fromMap(Map<String, dynamic> json) => AdharVerifyOtpModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : AadharData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
  };
}

class AadharData {
  String? name;
  Address? address;

  AadharData({
    this.name,
    this.address,
  });

  factory AadharData.fromMap(Map<String, dynamic> json) => AadharData(
    name: json["name"],
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "address": address?.toMap(),
  };
}

class Address {
  String? country;
  String? dist;
  String? state;
  String? po;
  String? loc;
  String? vtc;
  String? subdist;
  String? street;
  String? house;
  String? landmark;
  String? zip;

  Address({
    this.country,
    this.dist,
    this.state,
    this.po,
    this.loc,
    this.vtc,
    this.subdist,
    this.street,
    this.house,
    this.landmark,
    this.zip,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    country: json["country"],
    dist: json["dist"],
    state: json["state"],
    po: json["po"],
    loc: json["loc"],
    vtc: json["vtc"],
    subdist: json["subdist"],
    street: json["street"],
    house: json["house"],
    landmark: json["landmark"],
    zip: json["zip"],
  );

  Map<String, dynamic> toMap() => {
    "country": country,
    "dist": dist,
    "state": state,
    "po": po,
    "loc": loc,
    "vtc": vtc,
    "subdist": subdist,
    "street": street,
    "house": house,
    "landmark": landmark,
    "zip": zip,
  };
}
