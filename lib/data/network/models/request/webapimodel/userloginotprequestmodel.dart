class LoginOtpRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? loginFrom;
  String? deviceCode;
  String? fcmTockenMobile;
  String? fcmTockenWebsite;
  String? otp;

  LoginOtpRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.loginFrom,
        this.deviceCode,
        this.fcmTockenMobile,
        this.fcmTockenWebsite,
        this.otp});

  LoginOtpRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    loginFrom = json['login_from'];
    deviceCode = json['device_code'];
    fcmTockenMobile = json['fcm_tocken_mobile'];
    fcmTockenWebsite = json['fcm_tocken_website'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['login_from'] = this.loginFrom;
    data['device_code'] = this.deviceCode;
    data['fcm_tocken_mobile'] = this.fcmTockenMobile;
    data['fcm_tocken_website'] = this.fcmTockenWebsite;
    data['otp'] = this.otp;
    return data;
  }
}
