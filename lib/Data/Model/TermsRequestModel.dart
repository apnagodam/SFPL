
import 'dart:convert';

String termsRequestModeltoMap(TermsRequestModel data) => json.encode(data.toJson());

class TermsRequestModel {
  List<int>? scheme_id;

  TermsRequestModel(this.scheme_id) {}

  Map<String, dynamic> toJson() => {
    "scheme_id": scheme_id == null ? [] : List<int>.from(scheme_id!.map((x) =>x.toInt())),

  };
}
