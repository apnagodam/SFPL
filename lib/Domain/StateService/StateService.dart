import 'dart:convert';

import 'package:swfl/Data/Model/DistrictsResponseModel.dart';
import 'package:swfl/Data/Model/StatesResponseModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

part 'StateService.g.dart';

@riverpod
Future<StatesResponseModel> stateList(StateListRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getStates);
  return statesResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<DistrictsResponseModel> districtList(DistrictListRef ref,{String? code}) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getDistricts,queryParameters: {"code":code});
  return districtsResponseModelFromMap(jsonEncode(response.data));
}
