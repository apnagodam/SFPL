import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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
    ..interceptors.add(PrettyDioLogger(
        responseBody: true,
        request: true,
        requestBody: true,
        requestHeader: true))
    ..interceptors.add(Diointerceptor(ref));
}

class ApiClient {
  static const aadharSendOtp = 'aadhar_send_otp';
/*
Wallet api
*
*
*
*/
  static const addMoney = 'add-money-request';

  static const appliedList = 'sanction_limit';
  static const applyForLoan = 'sanction_limit_store';
  static const approvedRequests = 'loan-list/approved';
/*
Bank api
*
*
*
*/
  static const bankList = 'bank_list';

  static const baseUrl = "https://apnagodamfinance.com/api/";
  static const bnplListing = 'bnpl-listing';
/*
BNPL api
*
*
*
*/
  static const bnplTerms = 'bnpl-kfc';

  static const cancelLoanRequest = 'cancel-loan-request';
  static const closedRequests = 'loan-list/closed';
  static const directorSendOtp =
      'director_partners_add_send_otp'; // api for partner and director

  static const downloadDrfLink = "download_drf";
  static const fetchRegisteredUserData = 'register_check';
  static const getAuthorisationLetter =
      'auth_letter_download'; //auth_letter_upload

  static const getBnplDebitStatement = 'bnpl-debit-statement';
  static const getBnplPower = 'bnpl-power';
  static const getBnplStatement = 'bnpl-hold-statement';
  static const getBusinessProfile = 'business_profile';
  static const getDistricts = 'district-list';
  static const getExpiredLoans = "loan_expiry";
/*
 profiles apis
*/
  static const getGstProfiles = 'gst_profile';

  static const getListOfPartnersDirectors = 'partenrs_director_list';

  static const fetchAddedDirectorsPartners = 'partners_director_list_get';
  static const getLoanDetails = 'get-loan-details';
  static const getLoanRequestForm = 'loan-request-form';
  static const getLoansNearExpiry = "loan_near_expiry";
  static const getMandiTaxProfile = 'mandi_profile';
  static const getPledgedCommodity = 'total_pledged_commodity';
  static const getRepaymentData = "get-terminal-commodity-stack";
  static const getRepaymentSettlementList = 'repayment-details-drf-wise';
/*
repayment api
*
*
*
*/
  static const getRepaymentTerminal = "terminal-data-for-loan";

  static const getSanctionHoldList = 'limit-hold';
  static const getSanctionSchemes = 'sanctiond-limit-schemes';
  static const sendWhatsAppPdf = 'settlement_report_whatsapp';
  /*

Loan api
*
*
*
*/
  static const getSchemes = 'scheme-list';

/*
state and district api
*
*
*
*/
  static const getStates = "states";

  static const getStockList = 'my-stock';
/*
surepass api
*
*
*
*/
  static const getSurepassLoanAgreementUrl = 'loan_agr_download/';
  static const mergedEsignApis = 'sanction_merge_letter/';
  static const getSurepassPdcUrl = 'v1/pdc_download/';
  static const getSurepassSanctionUrl = 'sanction_letter_download/';
  static const getTerms = 'sanction-limit-terms';
  static const getTotalLoanAmount = 'total_loan_amount';
  static const getWalletStatement = 'wallet-statement';
/*
dashboard api
*
*
*
*/
  static const getdashboardData = "dashboard_data";

  static const login = 'v1/login';
  static const loginInfo = 'login-info';
  static const logout = 'logout';
  static const moneyRequestList = 'add-money-list';
  static const pendingRequests = 'loan-list/pending';
  static const registerBNPL = 'register_bnpl';
  /*
Authentication api
*
*
*
*/
  static const registerUser = 'register';

  static const rejectedRequests = 'loan-list/rejected';
  static const repayGatepass = 'gate-pass-settlement-pay';
  static const requestBnpl = 'bnpl-request';
  static const sendAadharVerificationOtp = 'otp-send_aadhar-zoop';
  static const sendDirectorVerifyOtp = 'director_partners_update_send_otp';
  static const submitDirectorDetails =
      'partenrs_director_add'; // api for partner and director submission

  static const submitLoanRequest = "loan-request-submit";
  static const submitSanctionDocuments = 'post_sanction_document_upload';
  static const testBaseUrl = 'https://test.apnagodamfinance.com/api/';
  static const updateAddress = 'address_update';
  static const updateDirectorPartner = 'partenrs_director_update';
  static const uploadAggrement = 'triparty-upload-pdf';
  static const uploadAuthorisationLetter = 'auth_letter_upload';
  static const verifAadharOtp = 'otp-verify_aadhar-zoop';
  static const verifyAdharOtp = 'aadhar_submit_otp';
  static const verifyOtp = 'v1/otp_verify';
  static const verifyRegisteredUserData = 'register_check_otp';
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

  /*
Partners and directors api
*
*
*
*/
}
