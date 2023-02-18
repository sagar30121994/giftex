class GetHashStrRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? hashData;

  GetHashStrRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.hashData});

  GetHashStrRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    hashData = json['HashData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['HashData'] = this.hashData;
    return data;
  }
}
