class GetLiveAuctionReviewRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  int? type;

  GetLiveAuctionReviewRequestModel({this.authkeyWeb, this.authkeyMobile, this.userid, this.type});

  GetLiveAuctionReviewRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['Type'] = this.type;
    return data;
  }
}
