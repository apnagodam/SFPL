// To parse this JSON data, do
//
//     final bankListModel = bankListModelFromJson(jsonString);

import 'dart:convert';

BankListModel bankListModelFromJson(String str) => BankListModel.fromJson(json.decode(str));

String bankListModelToJson(BankListModel data) => json.encode(data.toJson());

class BankListModel {
  List<BankDatum> data;
  String status;
  String message;

  BankListModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory BankListModel.fromJson(Map<String, dynamic> json) => BankListModel(
    data: List<BankDatum>.from(json["data"].map((x) => BankDatum.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class BankDatum {
  String bankName;

  BankDatum({
    required this.bankName,
  });
  bool stateFilterByName(String filter) {
    return bankName.toString().toLowerCase().trim().contains(filter);
  }
  factory BankDatum.fromJson(Map<String, dynamic> json) => BankDatum(
    bankName: json["bank_name"],
  );

  Map<String, dynamic> toJson() => {
    "bank_name": bankName,
  };
}
