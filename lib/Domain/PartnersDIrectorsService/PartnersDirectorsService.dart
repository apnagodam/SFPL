import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/ListOfDirectorsModel.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';
import 'package:swfl/ui/home/DashboardMenu/AddDirectorPartner/PartnersDirectorsListScreen.dart';
part 'PartnersDirectorsService.g.dart';

@riverpod
Stream<ListOfDirectorsModel> directorsPartnersList(
    DirectorsPartnersListRef ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.getListOfPartnersDirectors);

  ref.watch(isVisible.notifier).state = int.parse(
          '${ref.watch(sharedUtilityProvider).getUser()?.partnerDirectorCount ?? 0}') <
      (listOfDirectorsModelFromJson(jsonEncode(response.data)).data?.length ??
          0);
  yield listOfDirectorsModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> sendVerifyDirectorOtp(SendVerifyDirectorOtpRef ref,
    {String? phoneNumber, String? id}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.sendDirectorVerifyOtp,
      queryParameters: {'phone': phoneNumber, 'id': id});

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> editDirectorPartner(EditDirectorPartnerRef ref,
    {required String personName,
    required String id,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    File? profilePhoto}) async {
  FormData formData = FormData.fromMap({
    'id': id,
    'name': personName,
    'phone': phoneNumber,
    'pancard_no': panNo,
    'aadhar_no': aadharNo,
    "otp": otp,
    if (profilePhoto != null)
      'profile_photo': await MultipartFile.fromFile(
        profilePhoto?.path ?? "",
        filename: 'profile.png',
        contentType: DioMediaType("image", "png"),
      ),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.updateDirectorPartner, data: formData);
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> authorisationLetter(AuthorisationLetterRef ref,
    {required String id}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getAuthorisationLetter, queryParameters: {"id": id});
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> uploadAuthorisationLetter(
    UploadAuthorisationLetterRef ref,
    {String? id,
    File? aggreementFile}) async {
  FormData formData = FormData.fromMap({
    'id': id,
    'auth_letter': await MultipartFile.fromFile(
      aggreementFile?.path ?? "",
      filename: 'agreement.pdf',
    ),
    "type": "document/pdf"
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadAuthorisationLetter, data: formData);

  return response.data;
}
