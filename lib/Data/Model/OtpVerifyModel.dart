// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromMap(jsonString);

import 'dart:convert';

OtpVerifyModel otpVerifyModelFromMap(String str) => OtpVerifyModel.fromMap(json.decode(str));

String otpVerifyModelToMap(OtpVerifyModel data) => json.encode(data.toMap());

class OtpVerifyModel {
  dynamic status;
  dynamic message;
  Data? data;

  OtpVerifyModel({
    this.status,
    this.message,
    this.data,
  });

  factory OtpVerifyModel.fromMap(Map<String, dynamic> json) => OtpVerifyModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  bool? isLogin;
  dynamic token;
  dynamic userId;
  dynamic type;
  dynamic? aadharVerify;
  dynamic constitution;
  dynamic name;
  dynamic firmName;
  dynamic pancardNo;
  dynamic aadharNo;
  dynamic address;
  dynamic state;
  dynamic district;
  dynamic pincode;
  dynamic bankName;
  dynamic bankBranch;
  dynamic bankAccNo;
  dynamic bankIfscCode;
  dynamic proprietorshipProofDoc;
  dynamic proprietorshipProofNo;
  dynamic profileImage;
  dynamic chequeImage;
  dynamic pancardImage;
  dynamic aadharImage;
  dynamic aadharBackImage;
  dynamic proprietorshipProof;
  dynamic phone;
  bool? verifiedAccount;
  dynamic wallet;
  List<dynamic>? triparty;

  Data({
    this.isLogin,
    this.token,
    this.userId,
    this.type,
    this.aadharVerify,
    this.constitution,
    this.name,
    this.firmName,
    this.pancardNo,
    this.aadharNo,
    this.address,
    this.state,
    this.district,
    this.pincode,
    this.bankName,
    this.bankBranch,
    this.bankAccNo,
    this.bankIfscCode,
    this.proprietorshipProofDoc,
    this.proprietorshipProofNo,
    this.profileImage,
    this.chequeImage,
    this.pancardImage,
    this.aadharImage,
    this.aadharBackImage,
    this.proprietorshipProof,
    this.phone,
    this.verifiedAccount,
    this.wallet,
    this.triparty,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    isLogin: json["is_login"],
    token: json["token"],
    userId: json["user_id"],
    type: json["type"],
    aadharVerify: json["aadhar_verify"],
    constitution: json["constitution"],
    name: json["name"],
    firmName: json["firm_name"],
    pancardNo: json["pancard_no"],
    aadharNo: json["aadhar_no"],
    address: json["address"],
    state: json["state"],
    district: json["district"],
    pincode: json["pincode"],
    bankName: json["bank_name"],
    bankBranch: json["bank_branch"],
    bankAccNo: json["bank_acc_no"],
    bankIfscCode: json["bank_ifsc_code"],
    proprietorshipProofDoc: json["proprietorship_proof_doc"],
    proprietorshipProofNo: json["proprietorship_proof_no"],
    profileImage: json["profile_image"],
    chequeImage: json["cheque_image"],
    pancardImage: json["pancard_image"],
    aadharImage: json["aadhar_image"],
    aadharBackImage: json["aadhar_back_image"],
    proprietorshipProof: json["proprietorship_proof"],
    phone: json['phone'],
    verifiedAccount: json["verified_account"],
    wallet: json["wallet"],
    triparty: json["triparty"] == null ? [] : List<dynamic>.from(json["triparty"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "is_login": isLogin,
    "token": token,
    "user_id": userId,
    "type": type,
    "aadhar_verify": aadharVerify,
    "constitution": constitution,
    "name": name,
    "firm_name": firmName,
    "pancard_no": pancardNo,
    "aadhar_no": aadharNo,
    "address": address,
    "state": state,
    "district": district,
    "pincode": pincode,
    "bank_name": bankName,
    "bank_branch": bankBranch,
    "bank_acc_no": bankAccNo,
    "bank_ifsc_code": bankIfscCode,
    "proprietorship_proof_doc": proprietorshipProofDoc,
    "proprietorship_proof_no": proprietorshipProofNo,
    "profile_image": profileImage,
    "cheque_image": chequeImage,
    "pancard_image": pancardImage,
    "aadhar_image": aadharImage,
    "aadhar_back_image": aadharBackImage,
    "proprietorship_proof": proprietorshipProof,
    'phone':phone,
    "verified_account": verifiedAccount,
    "wallet": wallet,
    "triparty": triparty == null ? [] : List<dynamic>.from(triparty!.map((x) => x)),
  };
}
