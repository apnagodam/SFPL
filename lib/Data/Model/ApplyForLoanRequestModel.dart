import 'dart:convert';
import 'dart:io';

String applyForLoanRequestModelToMap(ApplyForLoanRequestModel data) => json.encode(data.toJson());

class ApplyForLoanRequestModel {
  String? amount;
  String? loan_type;
  List<int>? scheme_id;
  File? itr_first_year;
  File? itr_second_year;
  File? itr_third_year;
  File? bal_first_year;
  File? bal_second_year;
  File? bal_third_year;

  ApplyForLoanRequestModel(
      this.amount,
      this.loan_type,
      this.scheme_id,
      this.itr_first_year,
      this.itr_second_year,
      this.itr_third_year,
      this.bal_first_year,
      this.bal_second_year,
      this.bal_third_year) {}

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "loan_type": loan_type,
        "scheme_id": scheme_id == null
            ? []
            : List<int>.from(scheme_id!.map((x) => x.toInt())),
        "itr_first_year": itr_first_year,
        "itr_second_year": itr_second_year,
        "itr_third_year": itr_third_year,
        "bal_first_year": bal_first_year,
        "bal_second_year": bal_second_year,
        "bal_third_year": bal_third_year,
      };
}
