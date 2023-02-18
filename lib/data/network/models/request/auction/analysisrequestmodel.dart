class AnalysisRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? auctionId;

  AnalysisRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.auctionId});

  AnalysisRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    auctionId = json['AuctionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['AuctionId'] = this.auctionId;
    return data;
  }
}
