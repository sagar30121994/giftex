class LiveAuctionReviewLotRequestModel {
  String? userid;
  String? authkeyWeb;
  String? authkeyMobile;
  String? filterType;
  String? auctionID;

  LiveAuctionReviewLotRequestModel(
      {this.userid,
        this.authkeyWeb,
        this.authkeyMobile,
        this.filterType,
        this.auctionID});

  LiveAuctionReviewLotRequestModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    filterType = json['filterType'];
    auctionID = json['auctionID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['filterType'] = this.filterType;
    data['auctionID'] = this.auctionID;
    return data;
  }
}
