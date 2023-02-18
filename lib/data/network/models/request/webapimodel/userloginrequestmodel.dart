class LoginReqestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? email;
  String? countryCode;
  String? mobile;
  String? password;
  String? loginFrom;
  String? deviceCode;
  String? fcmTockenMobile;
  String? fcmTockenWebsite;

  LoginReqestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.email,
        this.countryCode,
        this.mobile,
        this.password,
        this.loginFrom,
        this.deviceCode,
        this.fcmTockenMobile,
        this.fcmTockenWebsite});

  LoginReqestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    password = json['password'];
    loginFrom = json['login_from'];
    deviceCode = json['device_code'];
    fcmTockenMobile = json['fcm_tocken_mobile'];
    fcmTockenWebsite = json['fcm_tocken_website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['login_from'] = this.loginFrom;
    data['device_code'] = this.deviceCode;
    data['fcm_tocken_mobile'] = this.fcmTockenMobile;
    data['fcm_tocken_website'] = this.fcmTockenWebsite;
    return data;
  }
}
