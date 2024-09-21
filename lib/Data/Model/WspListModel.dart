// To parse this JSON data, do
//
//     final wspListModel = wspListModelFromMap(jsonString);

import 'dart:convert';

WspListModel wspListModelFromMap(String str) => WspListModel.fromMap(json.decode(str));

String wspListModelToMap(WspListModel data) => json.encode(data.toMap());

class WspListModel {
  String? status;
  String? message;
  List<Datum>? data;

  WspListModel({
    this.status,
    this.message,
    this.data,
  });

  factory WspListModel.fromMap(Map<String, dynamic> json) => WspListModel(
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
  int? id;
  String? portalName;
  String? legalName;
  String? constitution;
  String? pancardNo;
  String? gstNo;
  String? email;
  String? mobile;
  String? contactPersion;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.portalName,
    this.legalName,
    this.constitution,
    this.pancardNo,
    this.gstNo,
    this.email,
    this.mobile,
    this.contactPersion,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    portalName: json["portal_name"],
    legalName: json["legal_name"],
    constitution: json["constitution"],
    pancardNo: json["pancard_no"],
    gstNo: json["gst_no"],
    email: json["email"],
    mobile: json["mobile"],
    contactPersion: json["contact_persion"],
    address: json["address"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );
  bool districtFilterByName(String filter) {
    return this.legalName.toString().toLowerCase().trim().contains(filter);
  }
  Map<String, dynamic> toMap() => {
    "id": id,
    "portal_name": portalName,
    "legal_name": legalName,
    "constitution": constitution,
    "pancard_no": pancardNo,
    "gst_no": gstNo,
    "email": email,
    "mobile": mobile,
    "contact_persion": contactPersion,
    "address": address,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
