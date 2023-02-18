class VerifyMobileRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? mobile;
  String? countryCode;

  VerifyMobileRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.mobile,
        this.countryCode});

  VerifyMobileRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['mobile'] = this.mobile;
    data['country_code'] = this.countryCode;
    return data;
  }
}
