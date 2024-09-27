// To parse this JSON data, do
//
//     final bnplPowerModel = bnplPowerModelFromMap(jsonString);

import 'dart:convert';

BnplPowerModel bnplPowerModelFromMap(String str) => BnplPowerModel.fromMap(json.decode(str));

String bnplPowerModelToMap(BnplPowerModel data) => json.encode(data.toMap());

class BnplPowerModel {
  String? status;
  String? message;
  Bnpl? bnpl;

  BnplPowerModel({
    this.status,
    this.message,
    this.bnpl,
  });

  factory BnplPowerModel.fromMap(Map<String, dynamic> json) => BnplPowerModel(
    status: json["status"],
    message: json["message"],
    bnpl: json["bnpl"] == null ? null : Bnpl.fromMap(json["bnpl"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "bnpl": bnpl?.toMap(),
  };
}

class Bnpl {
  int? limitSanction;
  int? power;
  String? uses;

  Bnpl({
    this.limitSanction,
    this.power,
    this.uses,
  });

  factory Bnpl.fromMap(Map<String, dynamic> json) => Bnpl(
    limitSanction: json["limit_sanction"],
    power: json["power"],
    uses: json["uses"],
  );

  Map<String, dynamic> toMap() => {
    "limit_sanction": limitSanction,
    "power": power,
    "uses": uses,
  };
}
