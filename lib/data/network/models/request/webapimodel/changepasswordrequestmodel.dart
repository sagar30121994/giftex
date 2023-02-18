class ChangePasswordRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? currentPassword;
  String? newPassword;

  ChangePasswordRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.currentPassword,
        this.newPassword});

  ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    currentPassword = json['current_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['current_password'] = this.currentPassword;
    data['new_password'] = this.newPassword;
    return data;
  }
}
