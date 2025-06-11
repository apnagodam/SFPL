import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/Model/AadharResponseModel.dart';
import 'package:swfl/Data/Model/AdharVerifyOtpModel.dart';
import 'package:swfl/Data/Model/BaseApiResponse.dart';
import 'package:swfl/Data/Model/OtpVerifyModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';
import 'package:swfl/ui/utils/routes.dart';

import '../../Data/Model/BankListModel.dart';
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
    String? partnerDirectorCount,
    dynamic? panCardImage,
    dynamic? profileImage,
    dynamic? chequeImage,
    dynamic? aadharImage,
    dynamic? adharBackImage,
    dynamic? proprietorProof,
    dynamic? moaAoa,
    dynamic? boardResolution,
    dynamic? directorProof,
    dynamic addressProof}) async {
  if (panCardImage is String) {}
  FormData formData = FormData.fromMap({
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
    "partner_director_count": partnerDirectorCount,
    if (panCardImage != null)
      'pancard_image': panCardImage is String
          ? panCardImage
          : await MultipartFile.fromFile(
              panCardImage?.path ?? "",
              filename: 'pan.png',
              contentType: DioMediaType("image", "png"),
            ),
    if (profileImage != null)
      'profile_image': profileImage is String
          ? profileImage
          : await MultipartFile.fromFile(profileImage?.path ?? "",
              contentType: DioMediaType("image", "png"),
              filename: 'profile.png'),
    if (chequeImage != null)
      'cheque_image': chequeImage is String
          ? chequeImage
          : await MultipartFile.fromFile(chequeImage?.path ?? "",
              contentType: DioMediaType("image", "png"),
              filename: 'cheque.png'),
    if (aadharImage != null)
      'aadhar_image': aadharImage is String
          ? aadharImage
          : await MultipartFile.fromFile(aadharImage?.path ?? "",
              contentType: DioMediaType("image", "png"),
              filename: 'aadharImage.png'),
    if (adharBackImage != null)
      'aadhar_back_image': adharBackImage is String
          ? adharBackImage
          : await MultipartFile.fromFile(adharBackImage?.path ?? "",
              contentType: DioMediaType("image", "png"),
              filename: 'adharBackImage.png'),
    if (proprietorProof != null)
      'proprietorship_proof': proprietorProof is String
          ? proprietorProof
          : await MultipartFile.fromFile(
              proprietorProof.path,
              filename: 'proprietorProof.png',
              contentType: DioMediaType("image", "png"),
            ),
    if (moaAoa != null)
      'moa_aoa': moaAoa is String
          ? moaAoa
          : await MultipartFile.fromFile(
              moaAoa.path,
              filename: 'moaAoa.png',
              contentType: DioMediaType("image", "png"),
            ),
    if (boardResolution != null)
      'partnership_deed': boardResolution is String
          ? boardResolution
          : await MultipartFile.fromFile(
              boardResolution.path,
              filename: 'partnershipdeed.png',
              contentType: DioMediaType("image", "png"),
            ),
    if (boardResolution != null)
      'board_resolution': boardResolution is String
          ? boardResolution
          : await MultipartFile.fromFile(
              boardResolution.path,
              filename: 'boardResolution.png',
              contentType: DioMediaType("image", "png"),
            ),
    if (directorProof != null)
      'proof_director': directorProof is String
          ? directorProof
          : await MultipartFile.fromFile(
              directorProof.path,
              filename: 'directorProof.png',
              contentType: DioMediaType("image", "png"),
            ),
    if (addressProof != null)
      'address_proof': addressProof is String
          ? addressProof
          : await MultipartFile.fromFile(
              addressProof.path,
              filename: 'addressProof.png',
              contentType: DioMediaType("image", "png"),
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
      queryParameters: {'phone': panCard, 'otp': otp});
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
      .post(ApiClient.login, queryParameters: {'phone': panNumber});
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> logout(LogoutRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.logout);
  return response.data;
}

@riverpod
Stream<OtpVerifyModel> loginInfo(LoginInfoRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.loginInfo);
  ref
      .watch(sharedUtilityProvider)
      .setUser(otpVerifyModelFromMap(jsonEncode(response.data)).data);

  yield otpVerifyModelFromMap(jsonEncode(response.data));
}

// @riverpod
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
    {String? address,
    String? stateAddress,
    String? district,
    String? pincode}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.updateAddress, data: {
    'address': address,
    'state': stateAddress,
    'district': district,
    'pincode': pincode
  });
  return baseApiResponseFromMap(jsonEncode(response.data));
}

@riverpod
Stream<BankListModel> bankList(BankListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.bankList);
  yield bankListModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> sendDirectorOtp(SendDirectorOtpRef ref,
    {String? phoneNumber}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.directorSendOtp, queryParameters: {'phone': phoneNumber});

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> submitDirectorDetails(SubmitDirectorDetailsRef ref,
    {required String personName,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    required dynamic profilePhoto}) async {
  FormData formData = new FormData.fromMap({
    'name': personName,
    'phone': phoneNumber,
    'pancard_no': panNo,
    'aadhar_no': aadharNo,
    "otp": otp,
    'profile_photo': profilePhoto is String
        ? profilePhoto
        : await MultipartFile.fromFile(
            profilePhoto?.path ?? "",
            filename: 'profile.png',
            contentType: DioMediaType("image", "png"),
          ),
  });

  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.submitDirectorDetails, data: formData);

  return response.data;
}

@riverpod
Stream<Map<String, dynamic>> fetchRegisteredUserData(
    FetchRegisteredUserDataRef ref,
    {required String panCardNo,
    required String phone}) async* {
  var response = await ref.watch(dioProvider).post(
      ApiClient.fetchRegisteredUserData,
      data: {'pancard_no': panCardNo, 'phone': phone});

  yield response.data;
}

@riverpod
Future<Map<String, dynamic>> verifyRegisteredUserOtp(
    VerifyRegisteredUserOtpRef ref,
    {required Map<String, dynamic> data}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.verifyRegisteredUserData, data: data);

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> sendAadharVerificationOtp(
    SendAadharVerificationOtpRef ref,
    {required String aadharNo}) async {
  // return {"status": "1", "message": "yay!"};

  var response = await ref.watch(dioProvider).post(
      ApiClient.sendAadharVerificationOtp,
      queryParameters: {"aadhar_no": aadharNo});
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> verifyAadharVerificationOtp(
    VerifyAadharVerificationOtpRef ref,
    {required String aadharNo,
    required String requestId,
    required String otp}) async {
  // return {"status": "1", "message": "tet!"};

  var response = await ref.watch(dioProvider).post(ApiClient.verifAadharOtp,
      queryParameters: {
        "aadhar_no": aadharNo,
        "request_id": requestId,
        "otp": otp
      });
  return response.data;
}
