// To parse this JSON data, do
//
//     final bnplPowerModel = bnplPowerModelFromMap(jsonString);

import 'dart:convert';

BnplPowerModel bnplPowerModelFromMap(String str) => BnplPowerModel.fromMap(json.decode(str));

String bnplPowerModelToMap(BnplPowerModel data) => json.encode(data.toMap());

class BnplPowerModel {
  dynamic status;
  dynamic message;
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
  dynamic originalLimit;
  dynamic utilizedLimit;
  dynamic availableLimit;
  dynamic holdLimit;
  dynamic effectiveBalance;

  Bnpl({
    this.originalLimit,
    this.utilizedLimit,
    this.availableLimit,
    this.holdLimit,
    this.effectiveBalance,
  });

  factory Bnpl.fromMap(Map<String, dynamic> json) => Bnpl(
    originalLimit: json["original_limit"],
    utilizedLimit: json["utilized_limit"],
    availableLimit: json["available_limit"],
    holdLimit: json["hold_limit"],
    effectiveBalance: json["effective_balance"],
  );

  Map<String, dynamic> toMap() => {
    "original_limit": originalLimit,
    "utilized_limit": utilizedLimit,
    "available_limit": availableLimit,
    "hold_limit": holdLimit,
    "effective_balance": effectiveBalance,
  };
}
