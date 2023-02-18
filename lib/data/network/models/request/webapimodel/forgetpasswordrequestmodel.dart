class ForgetPasswordRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? email;

  ForgetPasswordRequestModel({this.authkeyWeb, this.authkeyMobile, this.userid, this.email});

  ForgetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['email'] = this.email;
    return data;
  }
}
