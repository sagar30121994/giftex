class InsertCareerFormRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? fullname;
  String? emailid;
  String? jobtitle;
  String? howyouknow;
  String? query;
  String? resume;

  InsertCareerFormRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.fullname,
        this.emailid,
        this.jobtitle,
        this.howyouknow,
        this.query,
        this.resume});

  InsertCareerFormRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    fullname = json['fullname'];
    emailid = json['emailid'];
    jobtitle = json['jobtitle'];
    howyouknow = json['howyouknow'];
    query = json['query'];
    resume = json['resume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['fullname'] = this.fullname;
    data['emailid'] = this.emailid;
    data['jobtitle'] = this.jobtitle;
    data['howyouknow'] = this.howyouknow;
    data['query'] = this.query;
    data['resume'] = this.resume;
    return data;
  }
}
