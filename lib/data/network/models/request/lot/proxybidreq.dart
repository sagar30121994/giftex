class GetProxyBidAmountReq {
  String? userId;
  String? authkeyMobile;
  String? authkeyWeb;
  String? cRMClientID;
  String? auctionId;
  int? auctionInventoryPID;
  String? auctionStatus;
  String? bidIncrementPercentage;
  String? lotId;
  NextValidBid? nextValidBid;

  GetProxyBidAmountReq(
      {this.userId,
        this.authkeyMobile,
        this.authkeyWeb,
        this.cRMClientID,
        this.auctionId,
        this.auctionInventoryPID,
        this.auctionStatus,
        this.bidIncrementPercentage,
        this.lotId,
        this.nextValidBid});

  GetProxyBidAmountReq.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    authkeyMobile = json['authkey_mobile'];
    authkeyWeb = json['authkey_web'];
    cRMClientID = json['CRMClientID'];
    auctionId = json['AuctionId'];
    auctionInventoryPID = json['AuctionInventoryPID'];
    auctionStatus = json['AuctionStatus'];
    bidIncrementPercentage = json['BidIncrementPercentage'];
    lotId = json['LotId'];
    nextValidBid = json['NextValidBid'] != null
        ? new NextValidBid.fromJson(json['NextValidBid'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['authkey_mobile'] = this.authkeyMobile;
    data['authkey_web'] = this.authkeyWeb;
    data['CRMClientID'] = this.cRMClientID;
    data['AuctionId'] = this.auctionId;
    data['AuctionInventoryPID'] = this.auctionInventoryPID;
    data['AuctionStatus'] = this.auctionStatus;
    data['BidIncrementPercentage'] = this.bidIncrementPercentage;
    data['LotId'] = this.lotId;
    if (this.nextValidBid != null) {
      data['NextValidBid'] = this.nextValidBid!.toJson();
    }
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
