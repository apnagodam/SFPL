// To parse this JSON data, do
//
//     final totalLoanAmountModel = totalLoanAmountModelFromJson(jsonString);

import 'dart:convert';

TotalLoanAmountModel totalLoanAmountModelFromJson(String str) =>
    TotalLoanAmountModel.fromJson(json.decode(str));

String totalLoanAmountModelToJson(TotalLoanAmountModel data) =>
    json.encode(data.toJson());

class TotalLoanAmountModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  TotalLoanAmountModel({
    this.status,
    this.message,
    this.data,
  });

  factory TotalLoanAmountModel.fromJson(Map<String, dynamic> json) =>
      TotalLoanAmountModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  dynamic maturityDate;
  dynamic drfNo;
  dynamic terminal;
  dynamic commodity;
  dynamic gatePass;
  dynamic interestRate;
  dynamic tenor;
  dynamic loanAmount;
  dynamic quantity;
  dynamic financeId;
  dynamic disbursementDate;

  Datum(
      {this.maturityDate,
      this.drfNo,
      this.terminal,
      this.commodity,
      this.gatePass,
      this.interestRate,
      this.tenor,
      this.loanAmount,
      this.quantity,
      this.financeId,
      this.disbursementDate});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      maturityDate: json["maturity_date"],
      drfNo: json["drf_no"],
      terminal: json["terminal"],
      commodity: json["commodity"],
      gatePass: json["gate_pass"],
      interestRate: json["interest_rate"],
      tenor: json["tenor"],
      loanAmount: json["loan_amount"],
      quantity: json["quantity"],
      financeId: json["finance_id"],
      disbursementDate: json['disbursed_date']);

  Map<String, dynamic> toJson() => {
        "maturity_date": maturityDate,
        "drf_no": drfNo,
        "terminal": terminal,
        "commodity": commodity,
        "gate_pass": gatePass,
        "interest_rate": interestRate,
        "tenor": tenor,
        "loan_amount": loanAmount,
        "quantity": quantity,
        "finance_id": financeId,
        "disbursed_date": disbursementDate
      };
}
