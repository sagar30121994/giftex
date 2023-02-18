class GetProxyBidRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? lotId;
  String? auctionStatus;
  int? auctionInventoryPID;
  NextValidBid? nextValidBid;
  String? bidIncrementPercentage;

  GetProxyBidRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.lotId,
        this.auctionStatus,
        this.auctionInventoryPID,
        this.nextValidBid,
        this.bidIncrementPercentage});

  GetProxyBidRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    lotId = json['LotId'];
    auctionStatus = json['AuctionStatus'];
    auctionInventoryPID = json['AuctionInventoryPID'];
    nextValidBid = json['NextValidBid'] != null
        ? new NextValidBid.fromJson(json['NextValidBid'])
        : null;
    bidIncrementPercentage = json['BidIncrementPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['LotId'] = this.lotId;
    data['AuctionStatus'] = this.auctionStatus;
    data['AuctionInventoryPID'] = this.auctionInventoryPID;
    if (this.nextValidBid != null) {
      data['NextValidBid'] = this.nextValidBid!.toJson();
    }
    data['BidIncrementPercentage'] = this.bidIncrementPercentage;
    return data;
  }
}

class NextValidBid {
  String? iNR;
  String? uSD;

  NextValidBid({this.iNR, this.uSD});

  NextValidBid.fromJson(Map<String, dynamic> json) {
    iNR = json['INR'];
    uSD = json['USD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['INR'] = this.iNR;
    data['USD'] = this.uSD;
    return data;
  }
}
