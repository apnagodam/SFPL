// To parse this JSON data, do
//
//     final mandiTaxProfileModel = mandiTaxProfileModelFromJson(jsonString);

import 'dart:convert';

MandiTaxProfileModel mandiTaxProfileModelFromJson(String str) => MandiTaxProfileModel.fromJson(json.decode(str));

String mandiTaxProfileModelToJson(MandiTaxProfileModel data) => json.encode(data.toJson());

class MandiTaxProfileModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  MandiTaxProfileModel({
    this.status,
    this.message,
    this.data,
  });

  factory MandiTaxProfileModel.fromJson(Map<String, dynamic> json) => MandiTaxProfileModel(
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
  dynamic isLicance;
  dynamic candfName;
  dynamic licanceType;
  dynamic districtName;
  dynamic stateName;
  dynamic licanceNumber;
  dynamic issueDate;
  dynamic expiryDate;

  Datum({
    this.isLicance,
    this.candfName,
    this.licanceType,
    this.districtName,
    this.stateName,
    this.licanceNumber,
    this.issueDate,
    this.expiryDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    isLicance: json["is_licance"],
    candfName: json["candf_name"],
    licanceType: json["licance_type"],
    districtName: json["district_name"],
    stateName: json["state_name"],
    licanceNumber: json["licance_number"],
    issueDate: json["issue_date"],
    expiryDate: json["expiry_date"],
  );

  Map<String, dynamic> toJson() => {
    "is_licance": isLicance,
    "candf_name": candfName,
    "licance_type": licanceType,
    "district_name": districtName,
    "state_name": stateName,
    "licance_number": licanceNumber,
    "issue_date": issueDate,
    "expiry_date": expiryDate,
  };
}
