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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['authkey_web'] = authkeyWeb;
    data['authkey_mobile'] = authkeyMobile;
    data['userid'] = userid;
    data['categoryID'] = categoryID;
    return data;
  }
}
