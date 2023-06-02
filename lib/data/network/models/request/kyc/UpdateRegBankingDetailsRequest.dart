class UpdateRegBankingDetailsRequest {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? email;
  String? mobile;
  String? bankName;
  String? accountNum;
  String? ifscCode;
  String? swiftCode;
  String? panCardNum;
  String? panCardBase64;
  String? panCardUrl;
  String? adhaarCardNum;
  String? adhaarCardBase64;
  String? adhaarCardUrl;
  String? passportNum;
  String? passportBase64;
  String? passportUrl;
  String? photoidNum;
  String? photoidBase64;
  String? photoidUrl;
  String? termCondition;
  String? cRMClientID;

  UpdateRegBankingDetailsRequest(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.email,
        this.mobile,
        this.bankName,
        this.accountNum,
        this.ifscCode,
        this.swiftCode,
        this.panCardNum,
        this.panCardBase64,
        this.panCardUrl,
        this.adhaarCardNum,
        this.adhaarCardBase64,
        this.adhaarCardUrl,
        this.passportNum,
        this.passportBase64,
        this.passportUrl,
        this.photoidNum,
        this.photoidBase64,
        this.photoidUrl,
        this.termCondition,
        this.cRMClientID});

  UpdateRegBankingDetailsRequest.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    email = json['email'];
    mobile = json['mobile'];
    bankName = json['bank_name'];
    accountNum = json['account_num'];
    ifscCode = json['ifsc_code'];
    swiftCode = json['swift_code'];
    panCardNum = json['pan_card_num'];
    panCardBase64 = json['pan_card_base64'];
    panCardUrl = json['pan_card_url'];
    adhaarCardNum = json['adhaar_card_num'];
    adhaarCardBase64 = json['adhaar_card_base64'];
    adhaarCardUrl = json['adhaar_card_url'];
    passportNum = json['passport_num'];
    passportBase64 = json['passport_base64'];
    passportUrl = json['passport_url'];
    photoidNum = json['photoid_num'];
    photoidBase64 = json['photoid_base64'];
    photoidUrl = json['photoid_url'];
    termCondition = json['term_condition'];
    cRMClientID = json['CRMClientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['bank_name'] = this.bankName;
    data['account_num'] = this.accountNum;
    data['ifsc_code'] = this.ifscCode;
    data['swift_code'] = this.swiftCode;
    data['pan_card_num'] = this.panCardNum;
    data['pan_card_base64'] = this.panCardBase64;
    data['pan_card_url'] = this.panCardUrl;
    data['adhaar_card_num'] = this.adhaarCardNum;
    data['adhaar_card_base64'] = this.adhaarCardBase64;
    data['adhaar_card_url'] = this.adhaarCardUrl;
    data['passport_num'] = this.passportNum;
    data['passport_base64'] = this.passportBase64;
    data['passport_url'] = this.passportUrl;
    data['photoid_num'] = this.photoidNum;
    data['photoid_base64'] = this.photoidBase64;
    data['photoid_url'] = this.photoidUrl;
    data['term_condition'] = this.termCondition;
    data['CRMClientID'] = this.cRMClientID;
    return data;
  }
}
