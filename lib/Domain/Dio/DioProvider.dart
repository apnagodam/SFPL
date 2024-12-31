import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/ui/utils/DioInterceptor.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: ApiClient.testBaseUrl, headers: {
    "Authorization": "Bearer ${ref.watch(sharedUtilityProvider).getToken()}",
  }))
    ..interceptors.add(Diointerceptor(ref));
}

class ApiClient {
  static const baseUrl = "https://apnagodamfinance.com/api/";
  static const testBaseUrl = 'https://test.apnagodamfinance.com/api/';
/*
dashboard api
*
*
*
*/
  static const getdashboardData = "dashboard_data";

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
  static const verifyOtp = 'v1/otp_verify';
  static const login = 'v1/login';
  static const logout = 'logout';
  static const loginInfo = 'login-info';

  static const aadharSendOtp = 'aadhar_send_otp';
  static const verifyAdharOtp = 'aadhar_submit_otp';

  static const registerBNPL = 'register_bnpl';

  static const updateAddress = 'address_update';

  /*
Partners and directors api
*
*
*
*/

  static const directorSendOtp =
      'director_partners_add_send_otp'; // api for partner and director

  static const submitDirectorDetails =
      'partenrs_director_add'; // api for partner and director submission
  static const getListOfPartnersDirectors = 'partenrs_director_list';
  static const updateDirectorPartner = 'partenrs_director_update';
  static const sendDirectorVerifyOtp = 'director_partners_update_send_otp';

  static const getAuthorisationLetter =
      'auth_letter_download'; //auth_letter_upload

  static const uploadAuthorisationLetter = 'auth_letter_upload';
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

  static const getLoansNearExpiry = "loan_near_expiry";
  static const getExpiredLoans = "loan_expiry";

  static const getPledgedCommodity = 'total_pledged_commodity';
  static const getTotalLoanAmount = 'total_loan_amount';

  static const downloadDrfLink = "download_drf";
  static const getSanctionHoldList = 'limit-hold';

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
  static const bankList = 'bank_list';

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

/*
surepass api
*
*
*
*/
  static const getSurepassLoanAgreementUrl = 'loan_agr_download/';
  static const getSurepassPdcUrl = 'pdc_download/';
  static const getSurepassSanctionUrl = 'sanction_letter_download/';
}
