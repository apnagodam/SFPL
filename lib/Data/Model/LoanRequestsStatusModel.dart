// To parse this JSON data, do
//
//     final loanRequestsStatusModel = loanRequestsStatusModelFromMap(jsonString);

import 'dart:convert';

LoanRequestsStatusModel loanRequestsStatusModelFromMap(String str) => LoanRequestsStatusModel.fromMap(json.decode(str));

String loanRequestsStatusModelToMap(LoanRequestsStatusModel data) => json.encode(data.toMap());

class LoanRequestsStatusModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  LoanRequestsStatusModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoanRequestsStatusModel.fromMap(Map<String, dynamic> json) => LoanRequestsStatusModel(
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
  dynamic userId;
  dynamic schemeId;
  dynamic amountIn;
  dynamic price;
  dynamic inventoryId;
  dynamic terminal;
  dynamic stackNumber;
  dynamic gatePass;
  dynamic commodityName;
  dynamic quantity;
  dynamic processingFee;
  dynamic rateOfInterest;
  dynamic ltv;
  dynamic apr;
  dynamic tenor;
  dynamic cgst;
  dynamic sgst;
  dynamic qualityClaim;
  dynamic valueOfCommodity;
  dynamic amount;
  dynamic remainingAmount;
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
  dynamic tallyUpdateBy;
  dynamic tallyUpdate;
  dynamic tallyUpdateDate;
  dynamic paymentUpdateBy;
  dynamic paymentRef;
  dynamic paymentDate;
  dynamic poutId;
  dynamic fundAccountId;
  dynamic contactId;
  dynamic loanIvr;
  dynamic closed;
  dynamic createdAt;
  dynamic updatedAt;
  Scheme? scheme;

  Datum({
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
    this.quantity,
    this.processingFee,
    this.rateOfInterest,
    this.ltv,
    this.apr,
    this.tenor,
    this.cgst,
    this.sgst,
    this.qualityClaim,
    this.valueOfCommodity,
    this.amount,
    this.remainingAmount,
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
    this.tallyUpdateBy,
    this.tallyUpdate,
    this.tallyUpdateDate,
    this.paymentUpdateBy,
    this.paymentRef,
    this.paymentDate,
    this.poutId,
    this.fundAccountId,
    this.contactId,
    this.loanIvr,
    this.closed,
    this.createdAt,
    this.updatedAt,
    this.scheme,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
    quantity: json["quantity"],
    processingFee: json["processing_fee"],
    rateOfInterest: json["rate_of_interest"],
    ltv: json["ltv"],
    apr: json["apr"],
    tenor: json["tenor"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    qualityClaim: json["quality_claim"],
    valueOfCommodity: json["value_of_commodity"],
    amount: json["amount"],
    remainingAmount: json["remaining_amount"],
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
    tallyUpdateBy: json["tally_update_by"],
    tallyUpdate: json["tally_update"],
    tallyUpdateDate: json["tally_update_date"],
    paymentUpdateBy: json["payment_update_by"],
    paymentRef: json["payment_ref"],
    paymentDate: json["payment_date"],
    poutId: json["pout_id"],
    fundAccountId: json["fund_account_id"],
    contactId: json["contact_id"],
    loanIvr: json["loan_ivr"],
    closed: json["closed"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    scheme: json["scheme"] == null ? null : Scheme.fromMap(json["scheme"]),
  );

  Map<String, dynamic> toMap() => {
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
    "quantity": quantity,
    "processing_fee": processingFee,
    "rate_of_interest": rateOfInterest,
    "ltv": ltv,
    "apr": apr,
    "tenor": tenor,
    "cgst": cgst,
    "sgst": sgst,
    "quality_claim": qualityClaim,
    "value_of_commodity": valueOfCommodity,
    "amount": amount,
    "remaining_amount": remainingAmount,
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
    "tally_update_by": tallyUpdateBy,
    "tally_update": tallyUpdate,
    "tally_update_date": tallyUpdateDate,
    "payment_update_by": paymentUpdateBy,
    "payment_ref": paymentRef,
    "payment_date": paymentDate,
    "pout_id": poutId,
    "fund_account_id": fundAccountId,
    "contact_id": contactId,
    "loan_ivr": loanIvr,
    "closed": closed,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "scheme": scheme?.toMap(),
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
  dynamic cgst;
  dynamic sgst;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Scheme({
    this.id,
    this.schemeName,
    this.interestRate,
    this.loanPassDays,
    this.processingFee,
    this.loanPerTotalAmount,
    this.tenor,
    this.cgst,
    this.sgst,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Scheme.fromMap(Map<String, dynamic> json) => Scheme(
    id: json["id"],
    schemeName: json["scheme_name"],
    interestRate: json["interest_rate"],
    loanPassDays: json["loan_pass_days"],
    processingFee: json["processing_fee"],
    loanPerTotalAmount: json["loan_per_total_amount"],
    tenor: json["tenor"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "scheme_name": schemeName,
    "interest_rate": interestRate,
    "loan_pass_days": loanPassDays,
    "processing_fee": processingFee,
    "loan_per_total_amount": loanPerTotalAmount,
    "tenor": tenor,
    "cgst": cgst,
    "sgst": sgst,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
