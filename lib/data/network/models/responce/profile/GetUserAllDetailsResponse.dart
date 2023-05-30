class GetUserAllDetailsResponse {
  String? status;
  String? message;
  Result? result;

  GetUserAllDetailsResponse({this.status, this.message, this.result});

  GetUserAllDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  Profile? profile;

  Result({this.profile});

  Result.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  BasicDetails? basicDetails;
  BankDetails? bankDetails;
  String? isbillingaddress;
  String? profileCompleteness;
  List<Address>? address;
  String? balanceAmount;
  String? dipositedAmount;
  String? cRMClientID;

  Profile(
      {this.basicDetails,
        this.bankDetails,
        this.isbillingaddress,
        this.profileCompleteness,
        this.address,
        this.balanceAmount,
        this.dipositedAmount,
        this.cRMClientID});

  Profile.fromJson(Map<String, dynamic> json) {
    basicDetails = json['basicDetails'] != null
        ? new BasicDetails.fromJson(json['basicDetails'])
        : null;
    bankDetails = json['bankDetails'] != null
        ? new BankDetails.fromJson(json['bankDetails'])
        : null;
    isbillingaddress = json['isbillingaddress'];
    profileCompleteness = json['profile_completeness'];
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
    balanceAmount = json['BalanceAmount'];
    dipositedAmount = json['DipositedAmount'];
    cRMClientID = json['CRMClientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.basicDetails != null) {
      data['basicDetails'] = this.basicDetails!.toJson();
    }
    if (this.bankDetails != null) {
      data['bankDetails'] = this.bankDetails!.toJson();
    }
    data['isbillingaddress'] = this.isbillingaddress;
    data['profile_completeness'] = this.profileCompleteness;
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    data['BalanceAmount'] = this.balanceAmount;
    data['DipositedAmount'] = this.dipositedAmount;
    data['CRMClientID'] = this.cRMClientID;
    return data;
  }
}

class BasicDetails {
  String? email;
  String? countryCode;
  String? mobile;
  String? userid;
  String? firstName;
  String? lastName;
  String? nickName;
  String? profilePicUrl;
  String? gender;
  String? dob;
  String? interestedInBidding;
  String? hearAboutus;
  String? interestedIn;
  String? nationality;

  BasicDetails(
      {this.email,
        this.countryCode,
        this.mobile,
        this.userid,
        this.firstName,
        this.lastName,
        this.nickName,
        this.profilePicUrl,
        this.gender,
        this.dob,
        this.interestedInBidding,
        this.hearAboutus,
        this.interestedIn,
        this.nationality});

  BasicDetails.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    userid = json['userid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nickName = json['nick_name'];
    profilePicUrl = json['profile_pic_url'];
    gender = json['gender'];
    dob = json['dob'];
    interestedInBidding = json['interested_in_bidding'];
    hearAboutus = json['hear_aboutus'];
    interestedIn = json['interested_in'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['userid'] = this.userid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['nick_name'] = this.nickName;
    data['profile_pic_url'] = this.profilePicUrl;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['interested_in_bidding'] = this.interestedInBidding;
    data['hear_aboutus'] = this.hearAboutus;
    data['interested_in'] = this.interestedIn;
    data['nationality'] = this.nationality;
    return data;
  }
}

class BankDetails {
  String? bankName;
  String? accountNum;
  String? ifscCode;
  String? swiftCode;
  String? panCardNum;
  String? panCardUrl;
  String? adhaarCardNum;
  String? adhaarCardUrl;
  String? passportNum;
  String? passportUrl;
  String? photoidNum;
  String? photoidUrl;
  String? termCondition;

  BankDetails(
      {this.bankName,
        this.accountNum,
        this.ifscCode,
        this.swiftCode,
        this.panCardNum,
        this.panCardUrl,
        this.adhaarCardNum,
        this.adhaarCardUrl,
        this.passportNum,
        this.passportUrl,
        this.photoidNum,
        this.photoidUrl,
        this.termCondition});

  BankDetails.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    accountNum = json['account_num'];
    ifscCode = json['ifsc_code'];
    swiftCode = json['swift_code'];
    panCardNum = json['pan_card_num'];
    panCardUrl = json['pan_card_url'];
    adhaarCardNum = json['adhaar_card_num'];
    adhaarCardUrl = json['adhaar_card_url'];
    passportNum = json['passport_num'];
    passportUrl = json['passport_url'];
    photoidNum = json['photoid_num'];
    photoidUrl = json['photoid_url'];
    termCondition = json['term_condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_name'] = this.bankName;
    data['account_num'] = this.accountNum;
    data['ifsc_code'] = this.ifscCode;
    data['swift_code'] = this.swiftCode;
    data['pan_card_num'] = this.panCardNum;
    data['pan_card_url'] = this.panCardUrl;
    data['adhaar_card_num'] = this.adhaarCardNum;
    data['adhaar_card_url'] = this.adhaarCardUrl;
    data['passport_num'] = this.passportNum;
    data['passport_url'] = this.passportUrl;
    data['photoid_num'] = this.photoidNum;
    data['photoid_url'] = this.photoidUrl;
    data['term_condition'] = this.termCondition;
    return data;
  }
}

class Address {
  String? type;
  String? id;
  String? yourName;
  String? addLine1;
  String? addLine2;
  String? pinCode;
  String? country;
  String? state;
  String? city;
  String? location;
  String? gstNum;
  String? action;

  Address(
      {this.type,
        this.id,
        this.yourName,
        this.addLine1,
        this.addLine2,
        this.pinCode,
        this.country,
        this.state,
        this.city,
        this.location,
        this.gstNum,
        this.action});

  Address.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    yourName = json['your_name'];
    addLine1 = json['add_line1'];
    addLine2 = json['add_line2'];
    pinCode = json['pin_code'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    location = json['location'];
    gstNum = json['gst_num'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['your_name'] = this.yourName;
    data['add_line1'] = this.addLine1;
    data['add_line2'] = this.addLine2;
    data['pin_code'] = this.pinCode;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['location'] = this.location;
    data['gst_num'] = this.gstNum;
    data['action'] = this.action;
    return data;
  }
}
