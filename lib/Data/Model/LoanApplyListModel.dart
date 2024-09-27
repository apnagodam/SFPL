// To parse this JSON data, do
//
//     final loanApplyListModel = loanApplyListModelFromMap(jsonString);

import 'dart:convert';

LoanApplyListModel loanApplyListModelFromMap(String str) => LoanApplyListModel.fromMap(json.decode(str));

String loanApplyListModelToMap(LoanApplyListModel data) => json.encode(data.toMap());

class LoanApplyListModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  LoanApplyListModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoanApplyListModel.fromMap(Map<String, dynamic> json) => LoanApplyListModel(
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
  dynamic inventoryId;
  dynamic financeId;
  dynamic gatePass;
  dynamic terminal;
  dynamic commodity;
  dynamic quantity;
  dynamic stackNumber;
  dynamic date;
  dynamic loan;
  dynamic status;

  Datum({
    this.inventoryId,
    this.financeId,
    this.gatePass,
    this.terminal,
    this.commodity,
    this.quantity,
    this.stackNumber,
    this.date,
    this.loan,
    this.status,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    inventoryId: json["inventory_id"],
    financeId: json["finance_id"],
    gatePass: json["gate_pass"],
    terminal: json["terminal"],
    commodity: json["commodity"],
    quantity: json["quantity"],
    stackNumber: json["stack_number"],
    date: json["date"],
    loan: json["loan"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "inventory_id": inventoryId,
    "finance_id": financeId,
    "gate_pass": gatePass,
    "terminal": terminal,
    "commodity": commodity,
    "quantity": quantity,
    "stack_number": stackNumber,
    "date": date,
    "loan": loan,
    "status": status,
  };
}
