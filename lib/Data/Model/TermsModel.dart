// To parse this JSON data, do
//
//     final termsModel = termsModelFromJson(jsonString);

import 'dart:convert';

TermsModel termsModelFromJson(String str) => TermsModel.fromJson(json.decode(str));

String termsModelToJson(TermsModel data) => json.encode(data.toJson());

class TermsModel {
  String? status;
  String? message;
  String? view;

  TermsModel({
    this.status,
    this.message,
    this.view,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
    status: json["status"],
    message: json["message"],
    view: json["view"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "view": view,
  };
}
