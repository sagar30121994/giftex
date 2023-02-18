class GetPaymentGridRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;

  GetPaymentGridRequestModel({this.authkeyWeb, this.authkeyMobile, this.userid});

  GetPaymentGridRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    return data;
  }
}
