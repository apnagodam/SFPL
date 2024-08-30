import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: ApiClient.baseUrl, headers: {
    "Authorization": "Bearer ${ref.watch(sharedUtilityProvider).getToken()}",
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
}
