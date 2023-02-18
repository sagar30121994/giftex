class UpdateProfilePersonalDetailRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? firstName;
  String? profilePicBase64;
  String? lastName;
  String? email;
  String? countryCode;
  String? mobile;
  String? password;
  String? registerFrom;
  String? deviceCode;
  String? nickName;
  String? gender;
  String? dob;
  String? interestedInBidding;
  String? hearAboutus;
  String? interestedIn;
  String? interestedInCategoryId;
  String? nationality;
  String? cRMClientID;

  UpdateProfilePersonalDetailRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.firstName,
        this.profilePicBase64,
        this.lastName,
        this.email,
        this.countryCode,
        this.mobile,
        this.password,
        this.registerFrom,
        this.deviceCode,
        this.nickName,
        this.gender,
        this.dob,
        this.interestedInBidding,
        this.hearAboutus,
        this.interestedIn,
        this.interestedInCategoryId,
        this.nationality,
        this.cRMClientID});

  UpdateProfilePersonalDetailRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    firstName = json['first_name'];
    profilePicBase64 = json['profile_pic_base64'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    password = json['password'];
    registerFrom = json['register_from'];
    deviceCode = json['device_code'];
    nickName = json['nick_name'];
    gender = json['gender'];
    dob = json['dob'];
    interestedInBidding = json['interested_in_bidding'];
    hearAboutus = json['hear_aboutus'];
    interestedIn = json['interested_in'];
    interestedInCategoryId = json['interested_in_categoryId'];
    nationality = json['nationality'];
    cRMClientID = json['CRMClientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['first_name'] = this.firstName;
    data['profile_pic_base64'] = this.profilePicBase64;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['register_from'] = this.registerFrom;
    data['device_code'] = this.deviceCode;
    data['nick_name'] = this.nickName;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['interested_in_bidding'] = this.interestedInBidding;
    data['hear_aboutus'] = this.hearAboutus;
    data['interested_in'] = this.interestedIn;
    data['interested_in_categoryId'] = this.interestedInCategoryId;
    data['nationality'] = this.nationality;
    data['CRMClientID'] = this.cRMClientID;
    return data;
  }
}
