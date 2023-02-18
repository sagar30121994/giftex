class ForgotToChangeRequestModel {
  String? otp;
  String? email;
  String? confirmPassword;
  String? newPassword;

  ForgotToChangeRequestModel({this.otp, this.email, this.confirmPassword, this.newPassword});

  ForgotToChangeRequestModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    email = json['email'];
    confirmPassword = json['confirmPassword'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['email'] = this.email;
    data['confirmPassword'] = this.confirmPassword;
    data['new_password'] = this.newPassword;
    return data;
  }
}
