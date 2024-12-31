// To parse this JSON data, do
//
//     final listOfDirectorsModel = listOfDirectorsModelFromJson(jsonString);

import 'dart:convert';

ListOfDirectorsModel listOfDirectorsModelFromJson(String str) =>
    ListOfDirectorsModel.fromJson(json.decode(str));

String listOfDirectorsModelToJson(ListOfDirectorsModel data) =>
    json.encode(data.toJson());

class ListOfDirectorsModel {
  dynamic status;
  dynamic message;
  List<DirectorDatum>? data;

  ListOfDirectorsModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListOfDirectorsModel.fromJson(Map<String, dynamic> json) =>
      ListOfDirectorsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DirectorDatum>.from(
                json["data"]!.map((x) => DirectorDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DirectorDatum {
  dynamic id;
  dynamic name;
  dynamic phone;
  dynamic pancardNo;
  dynamic aadharNo;
  dynamic verify;
  dynamic profilePhoto;

  DirectorDatum({
    this.id,
    this.name,
    this.phone,
    this.pancardNo,
    this.aadharNo,
    this.verify,
    this.profilePhoto,
  });

  factory DirectorDatum.fromJson(Map<String, dynamic> json) => DirectorDatum(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        pancardNo: json["pancard_no"],
        aadharNo: json["aadhar_no"],
        verify: json["verify"],
        profilePhoto: json["profile_photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "pancard_no": pancardNo,
        "aadhar_no": aadharNo,
        "verify": verify,
        "profile_photo": profilePhoto,
      };
}
