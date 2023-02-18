class LotByIdRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? lotId;

  LotByIdRequestModel({this.authkeyWeb, this.authkeyMobile, this.userid, this.lotId});

  LotByIdRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    lotId = json['LotId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['LotId'] = this.lotId;
    return data;
  }
}
