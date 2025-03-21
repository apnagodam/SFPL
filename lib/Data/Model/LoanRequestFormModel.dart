// To parse this JSON data, do
//
//     final loanRequestFormModel = loanRequestFormModelFromMap(jsonString);

import 'dart:convert';

LoanRequestFormModel loanRequestFormModelFromMap(String str) => LoanRequestFormModel.fromMap(json.decode(str));

String loanRequestFormModelToMap(LoanRequestFormModel data) => json.encode(data.toMap());

class LoanRequestFormModel {
  dynamic status;
  dynamic message;
  Data? data;

  LoanRequestFormModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoanRequestFormModel.fromMap(Map<String, dynamic> json) => LoanRequestFormModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  List<Scheme>? scheme;
  dynamic bankName;
  dynamic ifscCode;
  dynamic accountNumber;

  Data({
    this.scheme,
    this.bankName,
    this.ifscCode,
    this.accountNumber,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    scheme: json["scheme"] == null ? [] : List<Scheme>.from(json["scheme"]!.map((x) => Scheme.fromMap(x))),
    bankName: json["bank_name"],
    ifscCode: json["ifsc_code"],
    accountNumber: json["account_number"],
  );

  Map<String, dynamic> toMap() => {
    "scheme": scheme == null ? [] : List<dynamic>.from(scheme!.map((x) => x.toMap())),
    "bank_name": bankName,
    "ifsc_code": ifscCode,
    "account_number": accountNumber,
  };
}

class Scheme {
  dynamic id;
  dynamic schemeName;
  dynamic interestRate;
  dynamic loanPassDays;
  dynamic processingFee;
  dynamic loanPerTotalAmount;
  dynamic tenor;
  dynamic tenorType;

  dynamic cgst;
  dynamic sgst;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic limit;

  Scheme({
    this.id,
    this.schemeName,
    this.interestRate,
    this.loanPassDays,
    this.processingFee,
    this.loanPerTotalAmount,
    this.tenor,
    this.tenorType,
    this.cgst,
    this.sgst,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.limit,
  });

  factory Scheme.fromMap(Map<String, dynamic> json) => Scheme(
    id: json["id"],
    schemeName: json["scheme_name"],
    interestRate: json["interest_rate"],
    loanPassDays: json["loan_pass_days"],
    processingFee: json["processing_fee"],
    loanPerTotalAmount: json["ltv"],
    tenor: json["tenor"],
    tenorType: json['tenor_type'],
    cgst: json["cgst"],
    sgst: json["sgst"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    limit: json["limit"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "scheme_name": schemeName,
    "interest_rate": interestRate,
    "loan_pass_days": loanPassDays,
    "processing_fee": processingFee,
    "ltv": loanPerTotalAmount,
    "tenor": tenor,
    "tenor_type":tenorType,
    "cgst": cgst,
    "sgst": sgst,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "limit": limit,
  };
}
