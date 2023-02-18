class GetArtistDataRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? iD;

  GetArtistDataRequestModel({this.authkeyWeb, this.authkeyMobile, this.userid, this.iD});

  GetArtistDataRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['ID'] = this.iD;
    return data;
  }
}
