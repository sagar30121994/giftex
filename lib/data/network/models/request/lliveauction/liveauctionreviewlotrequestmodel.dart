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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['userid'] = userid;
    data['authkey_web'] = authkeyWeb;
    data['authkey_mobile'] = authkeyMobile;
    data['filterType'] = filterType;
    data['auctionID'] = auctionID;
    return data;
  }
}
