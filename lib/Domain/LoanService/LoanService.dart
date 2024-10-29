import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/LoanApplyListModel.dart';
import 'package:swfl/Data/Model/LoanDetailsModel.dart';
import 'package:swfl/Data/Model/LoanRequestFormModel.dart';
import 'package:swfl/Data/Model/LoanRequestsStatusModel.dart';
import 'package:swfl/Data/Model/SanctionLimitListModel.dart';
import 'package:swfl/Data/Model/TermsModel.dart';
import 'package:swfl/Data/Model/TripartyAgreementModel.dart';
import 'package:swfl/Data/Model/WspListModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

import '../../Data/Model/SchemeResponseModel.dart';
import '../../Data/SharedPrefs/SharedUtility.dart';
import '../../ui/utils/routes.dart';
import '../../ui/utils/routes_strings.dart';

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
Future<TermsModel> terms(TermsRef ref, {required String? schemeId}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getTerms, queryParameters: {"scheme_id": schemeId});

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
      filename: 'itr1.pdf',
      contentType: DioMediaType("document", "pdf"),
    ),
    'itr_second_year': await MultipartFile.fromFile(itr2?.path ?? "",
        contentType: DioMediaType("document", "pdf"), filename: 'itr2.pdf'),
    'itr_third_year': await MultipartFile.fromFile(itr3?.path ?? "",
        contentType: DioMediaType("document", "pdf"), filename: 'itr3.pdf'),
    'bal_first_year': await MultipartFile.fromFile(bs1?.path ?? "",
        contentType: DioMediaType("document", "pdf"), filename: 'bal1.pdf'),
    'bal_second_year': await MultipartFile.fromFile(bs2?.path ?? "",
        contentType: DioMediaType("document", "pdf"), filename: 'bal2.pdf'),
    'bal_third_year': await MultipartFile.fromFile(
      bs3?.path ?? "",
      filename: 'bal2.pdf',
      contentType: DioMediaType("document", "pdf"),
    ),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.applyForLoan, data: formData);

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> submitSanctionDocuments(
  SubmitSanctionDocumentsRef ref, {
  String? id,
  File? triAgreement,
  File? pdc,
  File? agreement,
}) async {
  FormData formData = new FormData.fromMap({
    "id": id,
    'tri_agreement': await MultipartFile.fromFile(triAgreement?.path ?? "",),
    'pdc': await MultipartFile.fromFile(pdc?.path ?? "",
        contentType: DioMediaType("document", "pdf"), filename: 'itr3.pdf'),
    'agreement': await MultipartFile.fromFile(agreement?.path ?? "",
        contentType: DioMediaType("document", "pdf"), filename: 'bal1.pdf'),
  });
  var response = await ref
      .watch(dioProvider)
      .post("post_sanction_document_upload", data: formData);

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
      filename: 'agreement.pdf',
    ),
    "type": "document/pdf"
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadAggrement, data: formData);

  return response.data;
}

@riverpod
Future<LoanApplyListModel> loanApplyList(LoanApplyListRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getStockList);

  return loanApplyListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<LoanRequestFormModel> loanRequestForm(LoanRequestFormRef ref) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.getLoanRequestForm);

  return loanRequestFormModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<LoanDetailsModel> loanDetails(LoanDetailsRef ref,
    {String? inventoryId,
    String? commodityName,
    String? quantity,
    String? gatePass,
    String? schemeId}) async* {
  var response =
      await ref.watch(dioProvider).post(ApiClient.getLoanDetails, data: {
    'inventory_id': inventoryId,
    'commodity_name': commodityName,
    'quantity': quantity,
    'gate_pass': gatePass,
    'scheme_id': schemeId
  });

  yield loanDetailsModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> submitLoanRequest(SubmitLoanRequestRef ref,
    {String? inventoryId,
    String? commodityName,
    String? quantity,
    String? gatePass,
    String? schemeId,
    String? bankName,
    String? ifscCode,
    String? accountNo,
    String? stackNo,
    String? bags,
    String? terminalName}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.submitLoanRequest, data: {
    'inventory_id': inventoryId,
    'commodity_name': commodityName,
    'quantity': quantity,
    'gate_pass': gatePass,
    'scheme_id': schemeId,
    'bank_name': bankName,
    'ifsc': ifscCode,
    'account_no': accountNo,
    'stack_number': stackNo,
    'bags':bags,
    'terminal': terminalName,
  });

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> cancelLoanRequest(CancelLoanRequestRef ref,
    {String? id}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.cancelLoanRequest, data: {
    'id': id,
  });

  return response.data;
}

@riverpod
Stream<LoanRequestsStatusModel> approvedRequests(
    ApprovedRequestsRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.approvedRequests);

  yield loanRequestsStatusModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<LoanRequestsStatusModel> pendingRequests(PendingRequestsRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.pendingRequests);

  yield loanRequestsStatusModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<LoanRequestsStatusModel> rejectedRequests(
    RejectedRequestsRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.rejectedRequests);

  yield loanRequestsStatusModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<LoanRequestsStatusModel> closedRequests(ClosedRequestsRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.closedRequests);

  return loanRequestsStatusModelFromMap(jsonEncode(response.data));
}
