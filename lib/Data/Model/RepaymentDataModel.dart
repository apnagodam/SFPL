// To parse this JSON data, do
//
//     final repaymentDataModel = repaymentDataModelFromMap(jsonString);

import 'dart:convert';

RepaymentDataModel repaymentDataModelFromMap(String str) => RepaymentDataModel.fromMap(json.decode(str));

String repaymentDataModelToMap(RepaymentDataModel data) => json.encode(data.toMap());

class RepaymentDataModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  RepaymentDataModel({
    this.status,
    this.message,
    this.data,
  });

  factory RepaymentDataModel.fromMap(Map<String, dynamic> json) => RepaymentDataModel(
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
  dynamic commodityName;
  dynamic stackNumber;

  Datum({
    this.commodityName,
    this.stackNumber,
  });
  bool commodityByFilter(String filter) {
    return commodityName.toString().toLowerCase().trim().contains(filter);
  }

  bool stackByFilter(String filter) {
    return stackNumber.toString().toLowerCase().trim().contains(filter);
  }
  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    commodityName: json["commodity_name"],
    stackNumber: json["stack_number"],
  );

  Map<String, dynamic> toMap() => {
    "commodity_name": commodityName,
    "stack_number": stackNumber,
  };
}
