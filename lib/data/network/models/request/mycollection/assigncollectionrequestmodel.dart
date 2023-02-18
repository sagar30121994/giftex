class AssignCollectionRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  int? id;

  AssignCollectionRequestModel({this.authkeyWeb, this.authkeyMobile, this.userid, this.id});

  AssignCollectionRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['id'] = this.id;
    return data;
  }
}
