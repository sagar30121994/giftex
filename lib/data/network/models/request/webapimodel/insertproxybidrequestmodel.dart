class InsertProxyBidReqeustModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? lotId;
  String? currencyType;
  String? liveBidAmount;
  String? proxyBidAmount;
  CurrentBid? currentBid;

  InsertProxyBidReqeustModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.lotId,
        this.currencyType,
        this.liveBidAmount,
        this.proxyBidAmount,
        this.currentBid});

  InsertProxyBidReqeustModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    lotId = json['LotId'];
    currencyType = json['CurrencyType'];
    liveBidAmount = json['LiveBidAmount'];
    proxyBidAmount = json['ProxyBidAmount'];
    currentBid = json['CurrentBid'] != null
        ? new CurrentBid.fromJson(json['CurrentBid'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['LotId'] = this.lotId;
    data['CurrencyType'] = this.currencyType;
    data['LiveBidAmount'] = this.liveBidAmount;
    data['ProxyBidAmount'] = this.proxyBidAmount;
    if (this.currentBid != null) {
      data['CurrentBid'] = this.currentBid!.toJson();
    }
    return data;
  }
}

class CurrentBid {
  String? iNR;
  String? uSD;

  CurrentBid({this.iNR, this.uSD});

  CurrentBid.fromJson(Map<String, dynamic> json) {
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
