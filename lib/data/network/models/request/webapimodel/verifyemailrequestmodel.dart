class VerifyEmailRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? email;
  String? firstName;
  String? lastName;

  VerifyEmailRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.email,
        this.firstName,
        this.lastName});

  VerifyEmailRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
