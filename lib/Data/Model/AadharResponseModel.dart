// To parse this JSON data, do
//
//     final aadharResponseModel = aadharResponseModelFromMap(jsonString);

import 'dart:convert';

AadharResponseModel aadharResponseModelFromMap(String str) => AadharResponseModel.fromMap(json.decode(str));

String aadharResponseModelToMap(AadharResponseModel data) => json.encode(data.toMap());

class AadharResponseModel {
  int? status;
  String? message;
  String? data;

  AadharResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory AadharResponseModel.fromMap(Map<String, dynamic> json) => AadharResponseModel(
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
