// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  dynamic status;
  dynamic message;
  dynamic loanNearExpiry;
  dynamic loanExpiry;
  dynamic totalPledgedCommodity;
  dynamic totalLoanAmount;

  DashboardModel({
    this.status,
    this.message,
    this.loanNearExpiry,
    this.loanExpiry,
    this.totalPledgedCommodity,
    this.totalLoanAmount,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"],
        message: json["message"],
        loanNearExpiry: json["loan_near_expiry"],
        loanExpiry: json["loan_expiry"],
        totalPledgedCommodity: json["total_pledged_commodity"],
        totalLoanAmount: json["total_loan_amount"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "loan_near_expiry": loanNearExpiry,
        "loan_expiry": loanExpiry,
        "total_pledged_commodity": totalPledgedCommodity,
        "total_loan_amount": totalLoanAmount,
      };
}
