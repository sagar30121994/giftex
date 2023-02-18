class GetCityRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  int? stateId;

  GetCityRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.stateId});

  GetCityRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['state_id'] = this.stateId;
    return data;
  }
}
