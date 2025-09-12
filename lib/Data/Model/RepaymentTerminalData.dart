// To parse this JSON data, do
//
//     final repaymentTerminalData = repaymentTerminalDataFromJson(jsonString);

import 'dart:convert';

RepaymentTerminalData repaymentTerminalDataFromJson(String str) =>
    RepaymentTerminalData.fromJson(json.decode(str));

String repaymentTerminalDataToJson(RepaymentTerminalData data) =>
    json.encode(data.toJson());

class RepaymentTerminalData {
  dynamic status;
  dynamic message;
  List<Terminal>? terminals;
  dynamic ltv;
  List<LtvDatum>? data;
  dynamic settlementAmount;

  RepaymentTerminalData({
    this.status,
    this.message,
    this.terminals,
    this.ltv,
    this.data,
    this.settlementAmount,
  });

  factory RepaymentTerminalData.fromJson(Map<String, dynamic> json) =>
      RepaymentTerminalData(
          status: json["status"],
          message: json["message"],
          terminals: json["terminals"] == null
              ? []
              : List<Terminal>.from(
                  json["terminals"]!.map((x) => Terminal.fromJson(x))),
          ltv: json["ltv"],
          data: json["data"] == null
              ? []
              : List<LtvDatum>.from(
                  json["data"]!.map((x) => LtvDatum.fromJson(x))),
          settlementAmount: json['settlement_amount']);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "terminals": terminals == null
            ? []
            : List<dynamic>.from(terminals!.map((x) => x.toJson())),
        "ltv": ltv,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "settlement_amount": settlementAmount
      };
}

class LtvDatum {
  dynamic id;
  dynamic drfNo;
  dynamic userId;
  dynamic schemeId;
  dynamic amountIn;
  dynamic price;
  dynamic inventoryId;
  dynamic terminal;
  dynamic stackNumber;
  dynamic gatePass;
  dynamic commodityName;
  dynamic bags;
  dynamic quantity;
  dynamic processingFee;
  dynamic rateOfInterest;
  dynamic ltv;
  dynamic apr;
  dynamic tenor;
  dynamic tenorType;
  dynamic cgst;
  dynamic sgst;
  dynamic qualityClaim;
  dynamic valueOfCommodity;
  dynamic amount;
  dynamic remainingAmount;
  dynamic totalMarginPay;
  dynamic compoundPIAmount;
  dynamic disbursementAmt;
  dynamic disbursement;
  dynamic bankName;
  dynamic ifsc;
  dynamic accountNo;
  dynamic utrNo;
  dynamic rejectReason;
  dynamic doneBy;
  dynamic approvedBy;
  dynamic approvedDate;
  dynamic verifyBy;
  dynamic verifyDate;
  dynamic amountAccType;
  dynamic status;
  dynamic remark;
  dynamic closed;
  dynamic isPrint;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic orderId;
  dynamic totalSettlementAmount;
  dynamic totalLoanAmount;
  dynamic loanint;
  dynamic penalCharges;

  LtvDatum({
    this.id,
    this.drfNo,
    this.userId,
    this.schemeId,
    this.amountIn,
    this.price,
    this.inventoryId,
    this.terminal,
    this.stackNumber,
    this.gatePass,
    this.commodityName,
    this.bags,
    this.quantity,
    this.processingFee,
    this.rateOfInterest,
    this.ltv,
    this.apr,
    this.tenor,
    this.tenorType,
    this.cgst,
    this.sgst,
    this.qualityClaim,
    this.valueOfCommodity,
    this.amount,
    this.remainingAmount,
    this.totalMarginPay,
    this.compoundPIAmount,
    this.disbursementAmt,
    this.disbursement,
    this.bankName,
    this.ifsc,
    this.accountNo,
    this.utrNo,
    this.rejectReason,
    this.doneBy,
    this.approvedBy,
    this.approvedDate,
    this.verifyBy,
    this.verifyDate,
    this.amountAccType,
    this.status,
    this.remark,
    this.closed,
    this.isPrint,
    this.createdAt,
    this.updatedAt,
    this.orderId,
    this.totalSettlementAmount,
    this.totalLoanAmount,
    this.loanint,
    this.penalCharges,
  });

  factory LtvDatum.fromJson(Map<String, dynamic> json) => LtvDatum(
        id: json["id"],
        drfNo: json["drf_no"],
        userId: json["user_id"],
        schemeId: json["scheme_id"],
        amountIn: json["amount_in"],
        price: json["price"],
        inventoryId: json["inventory_id"],
        terminal: json["terminal"],
        stackNumber: json["stack_number"],
        gatePass: json["gate_pass"],
        commodityName: json["commodity_name"],
        bags: json["bags"],
        quantity: json["quantity"],
        processingFee: json["processing_fee"],
        rateOfInterest: json["rate_of_interest"],
        ltv: json["ltv"],
        apr: json["apr"],
        tenor: json["tenor"],
        tenorType: json["tenor_type"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        qualityClaim: json["quality_claim"],
        valueOfCommodity: json["value_of_commodity"],
        amount: json["amount"],
        remainingAmount: json["remaining_amount"],
        totalMarginPay: json["total_margin_pay"],
        compoundPIAmount: json["compound_p_i_amount"],
        disbursementAmt: json["disbursement_amt"],
        disbursement: json["disbursement"],
        bankName: json["bank_name"],
        ifsc: json["ifsc"],
        accountNo: json["account_no"],
        utrNo: json["utr_no"],
        rejectReason: json["reject_reason"],
        doneBy: json["done_by"],
        approvedBy: json["approved_by"],
        approvedDate: json["approved_date"],
        verifyBy: json["verify_by"],
        verifyDate: json["verify_date"],
        amountAccType: json["amount_acc_type"],
        status: json["status"],
        remark: json["remark"],
        closed: json["closed"],
        isPrint: json["is_print"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        orderId: json["order_id"],
        totalSettlementAmount: json["total_settlement_amount"],
        totalLoanAmount: json["total_loan_amount"],
        loanint: json["interest_amount"],
        penalCharges: json["penalCharges"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "drf_no": drfNo,
        "user_id": userId,
        "scheme_id": schemeId,
        "amount_in": amountIn,
        "price": price,
        "inventory_id": inventoryId,
        "terminal": terminal,
        "stack_number": stackNumber,
        "gate_pass": gatePass,
        "commodity_name": commodityName,
        "bags": bags,
        "quantity": quantity,
        "processing_fee": processingFee,
        "rate_of_interest": rateOfInterest,
        "ltv": ltv,
        "apr": apr,
        "tenor": tenor,
        "tenor_type": tenorType,
        "cgst": cgst,
        "sgst": sgst,
        "quality_claim": qualityClaim,
        "value_of_commodity": valueOfCommodity,
        "amount": amount,
        "remaining_amount": remainingAmount,
        "total_margin_pay": totalMarginPay,
        "compound_p_i_amount": compoundPIAmount,
        "disbursement_amt": disbursementAmt,
        "disbursement": disbursement,
        "bank_name": bankName,
        "ifsc": ifsc,
        "account_no": accountNo,
        "utr_no": utrNo,
        "reject_reason": rejectReason,
        "done_by": doneBy,
        "approved_by": approvedBy,
        "approved_date": approvedDate,
        "verify_by": verifyBy,
        "verify_date": verifyDate,
        "amount_acc_type": amountAccType,
        "status": status,
        "remark": remark,
        "closed": closed,
        "is_print": isPrint,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "order_id": orderId,
        "total_settlement_amount": totalSettlementAmount,
        "total_loan_amount": totalLoanAmount,
        "interest_amount": loanint,
        "penalCharges": penalCharges,
      };
}

class Terminal {
  dynamic name;
  dynamic outStandingLoan;
  dynamic settlementAmount;
  Terminal({this.name, this.outStandingLoan, this.settlementAmount});
  bool districtFilterByName(String filter) {
    return name.toString().toLowerCase().trim().contains(filter);
  }

  factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
      name: json["name"],
      outStandingLoan: json['outstanding_loan'],
      settlementAmount: json['settlement_amount']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "outstanding_loan": outStandingLoan,
        "settlement_amount": settlementAmount
      };
}
