import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/BaseApiResponse.dart';
import 'package:swfl/Data/Model/BnplListingModel.dart';
import 'package:swfl/Data/Model/BnplPowerModel.dart';
import 'package:swfl/Data/Model/TermsModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

part 'BnplService.g.dart';

@riverpod
Future<TermsModel> bnplTerms(BnplTermsRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.bnplTerms);
  return termsModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<BaseApiResponse> bnplRequest(BnplRequestRef ref,
    {String? requestedAmount, String? type}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.requestBnpl,
      queryParameters: {
        "requested_amount": requestedAmount,
        "amount_type": type
      }); //addition,deletion
  return baseApiResponseFromMap(jsonEncode(response.data));
}

@riverpod
Stream<BnplListingModel> bnplList(BnplListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.bnplListing);
  yield bnplListingModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<BnplPowerModel> bnplPower(BnplPowerRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getBnplPower);
  return bnplPowerModelFromMap(jsonEncode(response.data));
}
