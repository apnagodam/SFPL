// To parse this JSON data, do
//
//     final baseApiResponse = baseApiResponseFromMap(jsonString);

import 'dart:convert';

BaseApiResponse baseApiResponseFromMap(String str) => BaseApiResponse.fromMap(json.decode(str));

String baseApiResponseToMap(BaseApiResponse data) => json.encode(data.toMap());

class BaseApiResponse {
  dynamic status;
  String? message;
  List<dynamic>? data;

  BaseApiResponse({
    this.status,
    this.message,
    this.data,
  });

  factory BaseApiResponse.fromMap(Map<String, dynamic> json) => BaseApiResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}
