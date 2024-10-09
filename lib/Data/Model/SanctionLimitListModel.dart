// To parse this JSON data, do
//
//     final sanctionLimitListModel = sanctionLimitListModelFromMap(jsonString);

import 'dart:convert';

SanctionLimitListModel sanctionLimitListModelFromMap(String str) =>
    SanctionLimitListModel.fromMap(json.decode(str));

String sanctionLimitListModelToMap(SanctionLimitListModel data) =>
    json.encode(data.toMap());

class SanctionLimitListModel {
  List<Datum>? data;
  dynamic status;
  dynamic message;

  SanctionLimitListModel({
    this.data,
    this.status,
    this.message,
  });

  factory SanctionLimitListModel.fromMap(Map<String, dynamic> json) =>
      SanctionLimitListModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
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

class Datum {
  dynamic id;
  dynamic loanType;
  dynamic userId;
  dynamic schemeId;
  dynamic schemeName;
  dynamic uniqueId;
  dynamic interestRate;
  dynamic processingFee;
  dynamic ltp;
  dynamic requestedAmount;
  dynamic approvedAmount;
  dynamic pdc;
  dynamic agreement;
  dynamic itrFirstYear;
  dynamic itrSecondYear;
  dynamic itrThirdYear;
  dynamic balFirstYear;
  dynamic balSecondYear;
  dynamic balThirdYear;
  dynamic triAgreement;
  dynamic verifiedDate;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.loanType,
    this.userId,
    this.schemeId,
    this.schemeName,
    this.uniqueId,
    this.interestRate,
    this.processingFee,
    this.ltp,
    this.requestedAmount,
    this.approvedAmount,
    this.pdc,
    this.agreement,
    this.itrFirstYear,
    this.itrSecondYear,
    this.itrThirdYear,
    this.balFirstYear,
    this.balSecondYear,
    this.balThirdYear,
    this.triAgreement,
    this.verifiedDate,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        loanType: json["loan_type"],
        userId: json["user_id"],
        schemeId: json["scheme_id"],
        schemeName: json["scheme_name"],
        uniqueId: json["unique_id"],
        interestRate: json["interest_rate"],
        processingFee: json["processing_fee"],
        ltp: json["ltp"],
        requestedAmount: json["requested_amount"],
        approvedAmount: json["approved_amount"],
        pdc: json["pdc"],
        agreement: json["agreement"],
        itrFirstYear: json["itr_first_year"],
        itrSecondYear: json["itr_second_year"],
        itrThirdYear: json["itr_third_year"],
        balFirstYear: json["bal_first_year"],
        balSecondYear: json["bal_second_year"],
        balThirdYear: json["bal_third_year"],
        triAgreement: json["tri_agreement"],
        verifiedDate: json["verified_date"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "loan_type": loanType,
        "user_id": userId,
        "scheme_id": schemeId,
        "scheme_name": schemeName,
        "unique_id": uniqueId,
        "interest_rate": interestRate,
        "processing_fee": processingFee,
        "ltp": ltp,
        "requested_amount": requestedAmount,
        "approved_amount": approvedAmount,
        "pdc": pdc,
        "agreement": agreement,
        "itr_first_year": itrFirstYear,
        "itr_second_year": itrSecondYear,
        "itr_third_year": itrThirdYear,
        "bal_first_year": balFirstYear,
        "bal_second_year": balSecondYear,
        "bal_third_year": balThirdYear,
        "tri_agreement": triAgreement,
        "verified_date": verifiedDate,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
