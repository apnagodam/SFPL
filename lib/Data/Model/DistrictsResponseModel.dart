// To parse this JSON data, do
//
//     final districtsResponseModel = districtsResponseModelFromMap(jsonString);

import 'dart:convert';

DistrictsResponseModel districtsResponseModelFromMap(String str) =>
    DistrictsResponseModel.fromMap(json.decode(str));

String districtsResponseModelToMap(DistrictsResponseModel data) =>
    json.encode(data.toMap());

class DistrictsResponseModel {
  List<StateDatum>? data;
  String? status;
  String? message;

  DistrictsResponseModel({
    this.data,
    this.status,
    this.message,
  });

  factory DistrictsResponseModel.fromMap(Map<String, dynamic> json) =>
      DistrictsResponseModel(
        data: json["data"] == null
            ? []
            : List<StateDatum>.from(
                json["data"]!.map((x) => StateDatum.fromMap(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "status": status,
        "message": message,
      };
}

class StateDatum {
  int? id;
  String? stateCode;
  String? districtCode;
  String? name;

  StateDatum({
    this.id,
    this.stateCode,
    this.districtCode,
    this.name,
  });

  factory StateDatum.fromMap(Map<String, dynamic> json) => StateDatum(
        id: json["id"],
        stateCode: json["state_code"],
        districtCode: json["district_code"],
        name: json["name"],
      );

  bool districtFilterByName(String filter) {
    return this.name.toString().toLowerCase().trim().contains(filter);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "state_code": stateCode,
        "district_code": districtCode,
        "name": name,
      };
}
