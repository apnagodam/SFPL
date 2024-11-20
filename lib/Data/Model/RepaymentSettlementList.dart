// To parse this JSON data, do
//
//     final repaymentSettlementList = repaymentSettlementListFromMap(jsonString);

import 'dart:convert';

RepaymentSettlementList repaymentSettlementListFromMap(String str) => RepaymentSettlementList.fromMap(json.decode(str));

String repaymentSettlementListToMap(RepaymentSettlementList data) => json.encode(data.toMap());

class RepaymentSettlementList {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  RepaymentSettlementList({
    this.status,
    this.message,
    this.data,
  });

  factory RepaymentSettlementList.fromMap(Map<String, dynamic> json) => RepaymentSettlementList(
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
  dynamic id;
  dynamic drfNo;
  dynamic inventoryId;
  dynamic terminal;
  dynamic stackNumber;
  dynamic gatePass;
  dynamic commodityName;
  dynamic quantity;
  dynamic compoundPIAmount;
  dynamic totalSettlementAmount;
  dynamic totalLoanAmount;
  dynamic interestAmount;

  Datum({
    this.id,
    this.drfNo,
    this.inventoryId,
    this.terminal,
    this.stackNumber,
    this.gatePass,
    this.commodityName,
    this.quantity,
    this.compoundPIAmount,
    this.totalSettlementAmount,
    this.totalLoanAmount,
    this.interestAmount,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    drfNo: json["drf_no"],
    inventoryId: json["inventory_id"],
    terminal: json["terminal"],
    stackNumber: json["stack_number"],
    gatePass: json["gate_pass"],
    commodityName: json["commodity_name"],
    quantity: json["quantity"],
    compoundPIAmount: json["compound_p_i_amount"],
    totalSettlementAmount: json["total_settlement_amount"],
    totalLoanAmount: json["total_loan_amount"],
    interestAmount: json["interest_amount"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "drf_no": drfNo,
    "inventory_id": inventoryId,
    "terminal": terminal,
    "stack_number": stackNumber,
    "gate_pass": gatePass,
    "commodity_name": commodityName,
    "quantity": quantity,
    "compound_p_i_amount": compoundPIAmount,
    "total_settlement_amount": totalSettlementAmount,
    "total_loan_amount": totalLoanAmount,
    "interest_amount": interestAmount,
  };
}
