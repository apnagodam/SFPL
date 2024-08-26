import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/MoneyRequestModel.dart';

import '../Dio/DioProvider.dart';

part 'WalletService.g.dart';

@riverpod
Future<Map<String, dynamic>> addMoney(
  AddMoneyRef ref, {
  String? amount,
  String? paymentType,
  File? image,
}) async {
  FormData formData = new FormData.fromMap({
    "amount": amount,
    'payment_type': paymentType,
    'image': await MultipartFile.fromFile(
      image?.path ?? "",
      filename: 'image',
      contentType: DioMediaType("image", "jpeg"),
    ),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.addMoney, data: formData);
  return response.data;
}

@riverpod
Future<MoneyRequestModel> moneyRequestList(MoneyRequestListRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.moneyRequestList);
  return moneyRequestModelFromJson(jsonEncode(response.data));
}
