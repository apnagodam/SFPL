// To parse this JSON data, do
//
//     final gstProfileModel = gstProfileModelFromJson(jsonString);

import 'dart:convert';

GstProfileModel gstProfileModelFromJson(String str) => GstProfileModel.fromJson(json.decode(str));

String gstProfileModelToJson(GstProfileModel data) => json.encode(data.toJson());

class GstProfileModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  GstProfileModel({
    this.status,
    this.message,
    this.data,
  });

  factory GstProfileModel.fromJson(Map<String, dynamic> json) => GstProfileModel(
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
  dynamic id;
  dynamic stateName;
  dynamic gstNumber;
  dynamic address;

  Datum({
    this.id,
    this.stateName,
    this.gstNumber,
    this.address,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    stateName: json["state_name"],
    gstNumber: json["gst_number"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_name": stateName,
    "gst_number": gstNumber,
    "address": address,
  };
}
