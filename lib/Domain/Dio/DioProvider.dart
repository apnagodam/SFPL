import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/ui/utils/DioInterceptor.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: ApiClient.baseUrl, headers: {
    "Authorization": "Bearer ${ref.watch(sharedUtilityProvider).getToken()}",
  }))
    ..interceptors.add(Diointerceptor(ref));
}

class ApiClient {
  static const baseUrl = "https://apnagodamfinance.com/api/";
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
  static const getSanctionSchemes = 'sanctiond-limit-schemes';

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
  static const getWalletStatement = 'wallet-statement';

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

/*
Bank api
*
*
*
*/
  static const bankList = 'sbt_api/bnpl_bank_list';

/*
repayment api
*
*
*
*/
  static const getRepaymentTerminal = "terminal-data-for-loan";
  static const getRepaymentData = "get-terminal-commodity-stack";
  static const getRepaymentSettlementList = 'repayment-details-drf-wise';
  static const repayGatepass = 'gate-pass-settlement-pay';
}
