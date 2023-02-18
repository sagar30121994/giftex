class UpdateRegPersonalDetailsRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? mobile;
  String? password;
  String? registerFrom;
  String? deviceCode;
  String? gender;
  String? dob;
  String? interestedInBidding;
  String? hearAboutus;
  String? interestedIn;
  String? nationality;
  String? cRMClientID;
  String? interestedInCategoryId;

  UpdateRegPersonalDetailsRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.firstName,
        this.lastName,
        this.email,
        this.countryCode,
        this.mobile,
        this.password,
        this.registerFrom,
        this.deviceCode,
        this.gender,
        this.dob,
        this.interestedInBidding,
        this.hearAboutus,
        this.interestedIn,
        this.nationality,
        this.cRMClientID,
        this.interestedInCategoryId});

  UpdateRegPersonalDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    password = json['password'];
    registerFrom = json['register_from'];
    deviceCode = json['device_code'];
    gender = json['gender'];
    dob = json['dob'];
    interestedInBidding = json['interested_in_bidding'];
    hearAboutus = json['hear_aboutus'];
    interestedIn = json['interested_in'];
    nationality = json['nationality'];
    cRMClientID = json['CRMClientID'];
    interestedInCategoryId = json['interested_in_categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['register_from'] = this.registerFrom;
    data['device_code'] = this.deviceCode;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['interested_in_bidding'] = this.interestedInBidding;
    data['hear_aboutus'] = this.hearAboutus;
    data['interested_in'] = this.interestedIn;
    data['nationality'] = this.nationality;
    data['CRMClientID'] = this.cRMClientID;
    data['interested_in_categoryId'] = this.interestedInCategoryId;
    return data;
  }
}
