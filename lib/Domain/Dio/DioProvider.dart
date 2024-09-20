import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: ApiClient.testBaseUrl, headers: {
    "Authorization": "Bearer ${ref.watch(sharedUtilityProvider).getToken()}",
  }))
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
}

@riverpod
Dio aadharDio(DioRef ref) {
  return Dio(
      BaseOptions(baseUrl: "https://sandbox.surepass.io/api/v1/", headers: {
    "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyNjQ2MTc5MiwianRpIjoiM2UzOWVlZWEtMmNkMC00ZGVlLWEzNGYtZDI2NjEyOTBmMjhlIiwidHlwZSI6ImFjY2VzcyIsImlkZW50aXR5IjoiZGV2LnNhbmpheUBzdXJlcGFzcy5pbyIsIm5iZiI6MTcyNjQ2MTc5MiwiZXhwIjoxNzI5MDUzNzkyLCJlbWFpbCI6InNhbmpheUBzdXJlcGFzcy5pbyIsInRlbmFudF9pZCI6Im1haW4iLCJ1c2VyX2NsYWltcyI6eyJzY29wZXMiOlsidXNlciJdfX0.2-lXrzeHsncSF4AJvhJhoogm6UQkqSFTheAaMmMa4Mk",
  }))
    ..interceptors.add(LogInterceptor(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
    ));
}

class ApiClient {
  static const baseUrl = "https://apnagodamfinance.com/finance/api/";
  static const testBaseUrl = 'https://test.apnagodamfinance.com/api/';

/*
state and district api
*
*
*
*/

  static const getStates = "states";
  static const getDistricts = 'district-list';

  /*
Authentication api
*
*
*
*/
  static const registerUser = 'register';
  static const verifyOtp = 'otp_verify';
  static const login = 'login';
  static const logout = 'logout';
  static const loginInfo = 'login-info';

  static const aadharSendOtp = 'aadhar_send_otp';
  static const verifyAdharOtp = 'aadhar_submit_otp';

  static const registerBNPL = 'register_bnpl';

  static const updateAddress = 'address_update';

  /*
Loan api
*
*
*
*/
  static const getSchemes = 'scheme-list';
  static const applyForLoan = 'sanction_limit_store';
  static const appliedList = 'sanction_limit';
  static const getTerms = 'sanction-limit-terms';

/*
Wallet api
*
*
*
*/
  static const addMoney = 'add-money-request';
  static const moneyRequestList = 'add-money-list';
  static const withdrawMoney = 'add-withdrawal-request';
  static const withdrawlList = 'add-withdrawal-list';

/*
verification api
*
*
*
*/

  static const wspAgreementList = 'wsp_list';
  static const wspTripartyAgreement = 'triparty-agreement';
  static const uploadAggrement = 'triparty-upload-pdf';

/*
BNPL api
*
*
*
*/

  static const bnplTerms = 'bnpl-kfc';
  static const requestBnpl = 'bnpl-request';
}
