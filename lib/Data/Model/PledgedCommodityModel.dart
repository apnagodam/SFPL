// To parse this JSON data, do
//
//     final pledgedCommodityModel = pledgedCommodityModelFromJson(jsonString);

import 'dart:convert';

PledgedCommodityModel pledgedCommodityModelFromJson(String str) => PledgedCommodityModel.fromJson(json.decode(str));

String pledgedCommodityModelToJson(PledgedCommodityModel data) => json.encode(data.toJson());

class PledgedCommodityModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  PledgedCommodityModel({
    this.status,
    this.message,
    this.data,
  });

  factory PledgedCommodityModel.fromJson(Map<String, dynamic> json) => PledgedCommodityModel(
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
  dynamic commodity;
  dynamic quantity;

  Datum({
    this.commodity,
    this.quantity,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    commodity: json["commodity"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "commodity": commodity,
    "quantity": quantity,
  };
}
