class HighlightPDPRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? categoryID;

  HighlightPDPRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.categoryID});

  HighlightPDPRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    categoryID = json['categoryID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['categoryID'] = this.categoryID;
    return data;
  }
}
