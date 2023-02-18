class GetUserDetailsRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? cRMClientID;

  GetUserDetailsRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.cRMClientID});

  GetUserDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    cRMClientID = json['CRMClientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['CRMClientID'] = this.cRMClientID;
    return data;
  }
}
