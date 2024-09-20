import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/AadharResponseModel.dart';
import 'package:swfl/Data/Model/AdharVerifyOtpModel.dart';
import 'package:swfl/Data/Model/BaseApiResponse.dart';
import 'package:swfl/Data/Model/OtpVerifyModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';

part 'AuthenticationService.g.dart';

@riverpod
Future<Map<String, dynamic>> registerUser(RegisterUserRef ref,
    {String? panCard,
    String? phone,
    String? userName,
    String? constitution,
    String? email,
    String? adharNo,
    String? address,
    String? locationState,
    String? district,
    String? pincode,
    String? bankName,
    String? bankBranch,
    String? bankAccount,
    String? ifscCode,
    String? propDocType,
    String? propDocNumber,
    String? firmName,
    File? panCardImage,
    File? profileImage,
    File? chequeImage,
    File? aadharImage,
    File? adharBackImage,
    File? proprietorProof}) async {
  FormData formData = new FormData.fromMap({
    "pancard_no": panCard,
    'phone': phone,
    'name': userName,
    'constitution': constitution,
    'email': email,
    'aadhar_no': adharNo,
    'address': address,
    'state': locationState,
    'district': district,
    'pincode': pincode,
    'bank_name': bankName,
    'bank_branch': bankBranch,
    'bank_acc_no': bankAccount,
    'bank_ifsc_code': ifscCode,
    'proprietorship_proof_doc': propDocType,
    'proprietorship_proof_no': propDocNumber,
    'firm_name': firmName,
    'pancard_image': await MultipartFile.fromFile(
      panCardImage?.path ?? "",
      filename: 'pan',
      contentType: DioMediaType("image", "jpeg"),
    ),
    'profile_image': await MultipartFile.fromFile(profileImage?.path ?? "",
        contentType: DioMediaType("image", "jpeg"), filename: 'profile'),
    'cheque_image': await MultipartFile.fromFile(chequeImage?.path ?? "",
        contentType: DioMediaType("image", "jpeg"), filename: 'cheque'),
    'aadhar_image': await MultipartFile.fromFile(aadharImage?.path ?? "",
        contentType: DioMediaType("image", "jpeg"), filename: 'aadharImage'),
    'aadhar_back_image': await MultipartFile.fromFile(
        adharBackImage?.path ?? "",
        contentType: DioMediaType("image", "jpeg"),
        filename: 'adharBackImage'),
    'proprietorship_proof': await MultipartFile.fromFile(
      proprietorProof?.path ?? "",
      filename: 'proprietorProof',
      contentType: DioMediaType("image", "jpeg"),
    ),
  });

  var response =
      await ref.watch(dioProvider).post(ApiClient.registerUser, data: formData);
  return response.data;
}

@riverpod
Future<OtpVerifyModel> verifyOtp(VerifyOtpRef ref,
    {String? panCard, String? otp}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.verifyOtp,
      queryParameters: {'pancard_no': panCard, 'otp': otp});
  var body = otpVerifyModelFromMap(jsonEncode(response.data));
  if (body.status.toString() == "1") {
    ref.watch(sharedUtilityProvider).setToken(body.data?.token ?? "");
    ref.invalidate(dioProvider);
    ref.watch(sharedUtilityProvider).setUser(body.data);
  }
  return body;
}

@riverpod
Future<AadharResponseModel> sendAadharOtp(SendAadharOtpRef ref,
    {String? aadharNo}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.aadharSendOtp, queryParameters: {'aadhar_no': aadharNo});

  return aadharResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<AdharVerifyOtpModel> verifyAadharOtp(VerifyAadharOtpRef ref,
    {String? clientId, String? otp, String? aadharNumber}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.verifyAdharOtp,
      queryParameters: {
        'client_id': clientId,
        'otp': otp,
        'aadhar_no': aadharNumber
      });

  return adharVerifyOtpModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> login(LoginRef ref, {String? panNumber}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.login, queryParameters: {'pancard_no': panNumber});
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> logout(LogoutRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.logout);
  return response.data;
}

@riverpod
Future<OtpVerifyModel> loginInfo(LoginInfoRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.loginInfo);
  return otpVerifyModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseApiResponse> registerBnpl(RegisterBnplRef ref,
    {String? constitution,
    String? type,
    String? pancardNo,
    String? bnplName,
    String? phoneNo}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.registerBNPL, data: {
    'constitution': constitution,
    'type': type,
    'pancard_no': pancardNo,
    'name': bnplName,
    'phone': phoneNo,
  });
  return baseApiResponseFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseApiResponse> updateAddress(UpdateAddressRef ref,
    {String? address, String? stateAddress, String? district, String? pincode}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.updateAddress, data: {
    'address': address,
    'state': stateAddress,
    'district': district,
    'pincode': pincode
  });
  return baseApiResponseFromMap(jsonEncode(response.data));
}
