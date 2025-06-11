import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/RepaymentDataModel.dart';
import 'package:swfl/Data/Model/RepaymentSettlementList.dart';
import 'package:swfl/Data/Model/RepaymentTerminalData.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

part 'RepaymentService.g.dart';

@riverpod
Stream<RepaymentTerminalData> repaymentTerminalData(
  RepaymentTerminalDataRef ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getRepaymentTerminal,
      );
  yield repaymentTerminalDataFromJson(jsonEncode(response.data));
}

@riverpod
Stream<RepaymentDataModel> repaymentData(RepaymentDataRef ref,
    {String? terminal, String? type, String? commodityName}) async* {
  var response = await ref.watch(dioProvider).post(ApiClient.getRepaymentData,
      queryParameters: {
        'terminal': terminal,
        'type': type,
        'commodity_name': commodityName
      });
  yield repaymentDataModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<RepaymentSettlementList> repaymentSettlementList(
    RepaymentSettlementListRef ref,
    {String? terminal,
    String? commodityName,
    String? stackNumber}) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getRepaymentSettlementList, queryParameters: {
    "terminal": terminal,
    'commodity_name': commodityName,
    'stack_number': stackNumber
  });
  yield repaymentSettlementListFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> repayGatepass(RepayGatepassRef ref,
    {List<String>? financeId,
    String? finalAmount,
    String? paymentType,
    String? partPaymentAmount}) async {
  FormData formData = FormData.fromMap({
    "finance_ids[]": financeId,
    "final_amount": finalAmount,
    "payment_type": paymentType,
    "pay_amount": partPaymentAmount
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.repayGatepass, data: formData);
  return response.data;
}
