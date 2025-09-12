import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:swfl/Data/Model/BusinessProfileModel.dart';
import 'package:swfl/Data/Model/MandiTaxProfileModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

import '../../Data/Model/GstProfileModel.dart';

part 'ProfilesService.g.dart';

@riverpod
Stream<GstProfileModel> gstProfile(GstProfileRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getGstProfiles);
  yield gstProfileModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<BusinessProfileModel> businessProfile(BusinessProfileRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getBusinessProfile);
  yield businessProfileModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<MandiTaxProfileModel> mandiTaxProfile(MandiTaxProfileRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getMandiTaxProfile);
  yield mandiTaxProfileModelFromJson(jsonEncode(response.data));
}
