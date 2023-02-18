class UpcomingAuctionRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? auctionStatus;

  UpcomingAuctionRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.auctionStatus});

  UpcomingAuctionRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    auctionStatus = json['AuctionStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['AuctionStatus'] = this.auctionStatus;
    return data;
  }
}
