// To parse this JSON data, do
//
//     final loanDetailsModel = loanDetailsModelFromMap(jsonString);

import 'dart:convert';

LoanDetailsModel loanDetailsModelFromMap(String str) => LoanDetailsModel.fromMap(json.decode(str));

String loanDetailsModelToMap(LoanDetailsModel data) => json.encode(data.toMap());

class LoanDetailsModel {
  dynamic status;
  dynamic message;
  Data? data;

  LoanDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoanDetailsModel.fromMap(Map<String, dynamic> json) => LoanDetailsModel(
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
  dynamic marketPrice;
  dynamic quantity;
  dynamic marketValue;
  dynamic ltv;
  dynamic loanAmount;
  dynamic proccessingFessPer;
  dynamic cgstPer;
  dynamic sgstPer;
  dynamic proccessingFessAmt;
  dynamic cgstAmt;
  dynamic sgstAmt;
  dynamic netPayableAmt;
  dynamic apr;

  Data({
    this.marketPrice,
    this.quantity,
    this.marketValue,
    this.ltv,
    this.loanAmount,
    this.proccessingFessPer,
    this.cgstPer,
    this.sgstPer,
    this.proccessingFessAmt,
    this.cgstAmt,
    this.sgstAmt,
    this.netPayableAmt,
    this.apr,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    marketPrice: json["market_price"]?.toDouble(),
    quantity: json["quantity"],
    marketValue: json["market_value"]?.toDouble(),
    ltv: json["ltv"],
    loanAmount: json["loan_amount"]?.toDouble(),
    proccessingFessPer: json["proccessing_fess_per"],
    cgstPer: json["cgst_per"],
    sgstPer: json["sgst_per"],
    proccessingFessAmt: json["proccessing_fess_amt"]?.toDouble(),
    cgstAmt: json["cgst_amt"]?.toDouble(),
    sgstAmt: json["sgst_amt"]?.toDouble(),
    netPayableAmt: json["net_payable_amt"]?.toDouble(),
    apr: json["apr"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "market_price": marketPrice,
    "quantity": quantity,
    "market_value": marketValue,
    "ltv": ltv,
    "loan_amount": loanAmount,
    "proccessing_fess_per": proccessingFessPer,
    "cgst_per": cgstPer,
    "sgst_per": sgstPer,
    "proccessing_fess_amt": proccessingFessAmt,
    "cgst_amt": cgstAmt,
    "sgst_amt": sgstAmt,
    "net_payable_amt": netPayableAmt,
    "apr": apr,
  };
}
