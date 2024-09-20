import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/BaseApiResponse.dart';
import 'package:swfl/Data/Model/TermsModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

part 'BnplService.g.dart';

@riverpod
Future<TermsModel> bnplTerms(BnplTermsRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.bnplTerms);
  return termsModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<BaseApiResponse> bnplRequest(BnplRequestRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.requestBnpl);
  return baseApiResponseFromMap(jsonEncode(response.data));
}
