class LoginResponse {
  String? status;
  String? message;
  bool? isLoggedinCountexceed;
  Result? result;

  LoginResponse(
      {this.status, this.message, this.isLoggedinCountexceed, this.result});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    isLoggedinCountexceed = json['isLoggedinCountexceed'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['isLoggedinCountexceed'] = this.isLoggedinCountexceed;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? email;
  String? mobile;
  String? countryCode;
  String? userid;
  String? authkeyWeb;
  String? firstName;
  String? lastName;
  String? profilePicUrl;
  String? profileCompleteness;
  String? otp;
  String? cRMClientID;

  Result(
      {this.email,
        this.mobile,
        this.countryCode,
        this.userid,
        this.authkeyWeb,
        this.firstName,
        this.lastName,
        this.profilePicUrl,
        this.profileCompleteness,
        this.otp,
        this.cRMClientID});

  Result.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    userid = json['userid'];
    authkeyWeb = json['authkey_web'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePicUrl = json['profile_pic_url'];
    profileCompleteness = json['profile_completeness'];
    otp = json['otp'];
    cRMClientID = json['CRMClientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['country_code'] = this.countryCode;
    data['userid'] = this.userid;
    data['authkey_web'] = this.authkeyWeb;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_pic_url'] = this.profilePicUrl;
    data['profile_completeness'] = this.profileCompleteness;
    data['otp'] = this.otp;
    data['CRMClientID'] = this.cRMClientID;
    return data;
  }
}
