import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/MoneyRequestModel.dart';
import 'package:swfl/Data/Model/WithdrawlListModel.dart';

import '../../Data/Model/BnplStatementModel.dart';
import '../../Data/SharedPrefs/SharedUtility.dart';
import '../../ui/utils/routes.dart';
import '../../ui/utils/routes_strings.dart';
import '../Dio/DioProvider.dart';

part 'WalletService.g.dart';

@riverpod
Future<Map<String, dynamic>> addMoney(
  AddMoneyRef ref, {
  String? amount,
  String? paymentType,
  File? image,
}) async {
  FormData formData =  FormData.fromMap({
    "amount": amount,
    'payment_type': paymentType,
    'image': await MultipartFile.fromFile(
      image?.path ?? "",
      filename: 'image.png',
      contentType: DioMediaType("image", "png"),
    ),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.addMoney, data: formData);

  return response.data;
}

@riverpod
Stream<BnplStatementModel> walletStatement(WalletStatementRef ref,
    {String? pastDate, String? currentDate}) async* {
  var response = await ref.watch(dioProvider).post(ApiClient.getWalletStatement,
      queryParameters: {'from_date': pastDate, "to_date": currentDate});

  yield bnplStatementModelFromMap(jsonEncode(response.data));
}
@riverpod
Future<Map<String, dynamic>> withdrawMoney(
  WithdrawMoneyRef ref, {
  String? amount,
  String? remark,
}) async {
  FormData formData = FormData.fromMap({
    "requested_amount": amount,
    'remark': remark,
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.withdrawMoney, data: formData);

  return response.data;
}

@riverpod
Stream<MoneyRequestModel> moneyRequestList(MoneyRequestListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.moneyRequestList);

  yield moneyRequestModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<WithdrawlResponseModel> withdrawlRequests(
    WithdrawlRequestsRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.withdrawlList);

  yield withdrawlResponseModelFromMap(jsonEncode(response.data));
}
