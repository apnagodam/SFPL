import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/SanctionLimitListModel.dart';
import 'package:swfl/Data/Model/TermsModel.dart';
import 'package:swfl/Data/Model/TripartyAgreementModel.dart';
import 'package:swfl/Data/Model/WspListModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

import '../../Data/Model/SchemeResponseModel.dart';

part 'LoanService.g.dart';

@riverpod
Future<SchemeResponseModel> schemes(SchemesRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getSchemes);
  return schemeResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<SanctionLimitListModel> appliedList(AppliedListRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.appliedList);
  return sanctionLimitListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<TermsModel> terms(TermsRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getTerms);
  return termsModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> applyForLoan(ApplyForLoanRef ref,
    {String? amount,
    String? loanType,
    String? schemeId,
    File? itr1,
    File? itr2,
    File? itr3,
    File? bs1,
    File? bs2,
    File? bs3}) async {
  FormData formData = new FormData.fromMap({
    "amount": amount,
    'loan_type': loanType,
    'scheme_id': schemeId,
    'itr_first_year': await MultipartFile.fromFile(
      itr1?.path ?? "",
      filename: 'itr1',
      contentType: DioMediaType("image", "jpeg"),
    ),
    'itr_second_year': await MultipartFile.fromFile(itr2?.path ?? "",
        contentType: DioMediaType("image", "jpeg"), filename: 'itr2'),
    'itr_third_year': await MultipartFile.fromFile(itr3?.path ?? "",
        contentType: DioMediaType("image", "jpeg"), filename: 'itr3'),
    'bal_first_year': await MultipartFile.fromFile(bs1?.path ?? "",
        contentType: DioMediaType("image", "jpeg"), filename: 'bal1'),
    'bal_second_year': await MultipartFile.fromFile(bs2?.path ?? "",
        contentType: DioMediaType("image", "jpeg"), filename: 'bal2'),
    'bal_third_year': await MultipartFile.fromFile(
      bs3?.path ?? "",
      filename: 'bal2',
      contentType: DioMediaType("image", "jpeg"),
    ),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.applyForLoan, data: formData);
  return response.data;
}

@riverpod
Future<WspListModel> wspAgreementList(WspAgreementListRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.wspAgreementList);
  return wspListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<TripartyAgreementModel> wspAgreement(WspAgreementRef ref,
    {String? wspId}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.wspTripartyAgreement, queryParameters: {'wsp_id': wspId});
  return tripartyAgreementModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> uploadPdf(
  UploadPdfRef ref, {
  File? agreementFile,
  String? wspId,
}) async {
  FormData formData = FormData.fromMap({
    'wsp_id': wspId,
    'triparty_agr': await MultipartFile.fromFile(
      agreementFile?.path ?? "",
      filename: 'agreement',
    ),
    "type": "application/pdf"
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadAggrement, data: formData);
  return response.data;
}
