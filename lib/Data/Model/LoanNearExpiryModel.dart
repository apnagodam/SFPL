// To parse this JSON data, do
//
//     final loanNearExpiryModel = loanNearExpiryModelFromJson(jsonString);

import 'dart:convert';

LoanNearExpiryModel loanNearExpiryModelFromJson(String str) => LoanNearExpiryModel.fromJson(json.decode(str));

String loanNearExpiryModelToJson(LoanNearExpiryModel data) => json.encode(data.toJson());

class LoanNearExpiryModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  LoanNearExpiryModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoanNearExpiryModel.fromJson(Map<String, dynamic> json) => LoanNearExpiryModel(
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
  dynamic maturityDate;
  dynamic drfNo;
  dynamic terminal;
  dynamic commodity;
  dynamic gatePass;
  dynamic interestRate;
  dynamic loanAmount;
  dynamic quantity;
  dynamic financeId;

  Datum({
    this.maturityDate,
    this.drfNo,
    this.terminal,
    this.commodity,
    this.gatePass,
    this.interestRate,
    this.loanAmount,
    this.quantity,
    this.financeId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    maturityDate: json["maturity_date"],
    drfNo: json["drf_no"],
    terminal: json["terminal"],
    commodity: json["commodity"],
    gatePass: json["gate_pass"],
    interestRate: json["interest_rate"],
    loanAmount: json["loan_amount"],
    quantity: json["quantity"],
    financeId: json["finance_id"],
  );

  Map<String, dynamic> toJson() => {
    "maturity_date": maturityDate,
    "drf_no": drfNo,
    "terminal": terminal,
    "commodity": commodity,
    "gate_pass": gatePass,
    "interest_rate": interestRate,
    "loan_amount": loanAmount,
    "quantity": quantity,
    "finance_id": financeId,
  };
}
