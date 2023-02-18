class PreCheckLoginRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? loginFrom;
  String? deviceCode;

  PreCheckLoginRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.loginFrom,
        this.deviceCode});

  PreCheckLoginRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    loginFrom = json['login_from'];
    deviceCode = json['device_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['login_from'] = this.loginFrom;
    data['device_code'] = this.deviceCode;
    return data;
  }
}
