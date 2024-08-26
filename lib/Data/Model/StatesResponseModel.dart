// To parse this JSON data, do
//
//     final statesResponseModel = statesResponseModelFromMap(jsonString);

import 'dart:convert';

StatesResponseModel statesResponseModelFromMap(String str) => StatesResponseModel.fromMap(json.decode(str));

String statesResponseModelToMap(StatesResponseModel data) => json.encode(data.toMap());

class StatesResponseModel {
  List<Datum>? data;
  String? status;
  String? message;

  StatesResponseModel({
    this.data,
    this.status,
    this.message,
  });

  factory StatesResponseModel.fromMap(Map<String, dynamic> json) => StatesResponseModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "status": status,
    "message": message,
  };
}

class Datum {
  int? id;
  String? name;
  String? code;
  String? countryId;

  Datum({
    this.id,
    this.name,
    this.code,
    this.countryId,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    countryId: json["country_id"],
  );
  bool stateFilterByName(String filter) {
    return this.name.toString().toLowerCase().trim().contains(filter);
  }
  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "code": code,
    "country_id": countryId,
  };
}
