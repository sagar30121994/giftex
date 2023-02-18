class AdditionaalChargesRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? lotId;
  bool? isleading;
  String? nextValidBidAmount;
  String? currencyType;

  AdditionaalChargesRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.lotId,
        this.isleading,
        this.nextValidBidAmount,
        this.currencyType});

  AdditionaalChargesRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    lotId = json['LotId'];
    isleading = json['Isleading'];
    nextValidBidAmount = json['NextValidBidAmount'];
    currencyType = json['CurrencyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['LotId'] = this.lotId;
    data['Isleading'] = this.isleading;
    data['NextValidBidAmount'] = this.nextValidBidAmount;
    data['CurrencyType'] = this.currencyType;
    return data;
  }
}
