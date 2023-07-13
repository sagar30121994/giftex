class ShowIntrestRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? auctionId;
  String? name;
  String? email;
  String? countryCode;
  String? mobile;
  String? message;
  String? CRMClientID;

  ShowIntrestRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.auctionId,
        this.name,
        this.email,
        this.countryCode,
        this.mobile,
        this.CRMClientID,
        this.message});

  ShowIntrestRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    auctionId = json['AuctionId'];
    name = json['name'];
    email = json['email'];
    CRMClientID = json['CRMClientID'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['AuctionId'] = this.auctionId;
    data['CRMClientID'] = this.CRMClientID;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['message'] = this.message;
    return data;
  }
}
