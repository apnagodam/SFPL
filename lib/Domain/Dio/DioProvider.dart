import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: ApiClient.testBaseUrl, headers: {
    "Authorization": "Bearer ${ref.watch(sharedUtilityProvider).getToken()}",
  }))
    ..interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      handler.next(request);
    }, onResponse: (response, handler) {
      if (response.data['status'].toString() == '3') {
        showErrorDialog(OneContext().context!,
            titleText: 'You have been Logged out!',
            messageText: "Please Login Again!", action: () {
          ref.watch(goRouterProvider).goNamed(RoutesStrings.login);
          ref.watch(sharedUtilityProvider).sharedPreferences.clear();
        });
      }
      // if (response.data['status'].toString() == "0") {
      //   errorToast(OneContext().context!, '${response.data['message']}');
      // }
      handler.next(response);
    }, onError: (e, handler) {
      //   ref.watch(goRouterProvider).goNamed(RoutesStrings.login);
      handler.next(e);
    }));
}

@riverpod
Dio aadharDio(DioRef ref) {
  return Dio(
      BaseOptions(baseUrl: "https://sandbox.surepass.io/api/v1/", headers: {
    "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyNjQ2MTc5MiwianRpIjoiM2UzOWVlZWEtMmNkMC00ZGVlLWEzNGYtZDI2NjEyOTBmMjhlIiwidHlwZSI6ImFjY2VzcyIsImlkZW50aXR5IjoiZGV2LnNhbmpheUBzdXJlcGFzcy5pbyIsIm5iZiI6MTcyNjQ2MTc5MiwiZXhwIjoxNzI5MDUzNzkyLCJlbWFpbCI6InNhbmpheUBzdXJlcGFzcy5pbyIsInRlbmFudF9pZCI6Im1haW4iLCJ1c2VyX2NsYWltcyI6eyJzY29wZXMiOlsidXNlciJdfX0.2-lXrzeHsncSF4AJvhJhoogm6UQkqSFTheAaMmMa4Mk",
  }));
  // ..interceptors.add(LogInterceptor(
  //   requestBody: true,
  //   requestHeader: true,
  //   responseHeader: true,
  //   responseBody: true,
  // ));
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

  static const getStockList = 'my-stock';
  static const getLoanRequestForm = 'loan-request-form';

  static const getLoanDetails = 'get-loan-details';

  static const submitLoanRequest = "loan-request-submit";
  static const cancelLoanRequest = 'cancel-loan-request';

  static const approvedRequests = 'loan-list/approved';
  static const pendingRequests = 'loan-list/pending';
  static const rejectedRequests = 'loan-list/rejected';
  static const closedRequests = 'loan-list/closed';

  static const submitSanctionDocuments = 'post_sanction_document_upload';

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
  static const bnplListing = 'bnpl-listing';
  static const getBnplPower = 'bnpl-power';
  static const getBnplStatement = 'bnpl-hold-statement';
  static const getBnplDebitStatement = 'bnpl-debit-statement';
}
