class InsertReachUsFormRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? fullname;
  String? emailid;
  String? department;
  String? phonenumber;
  String? query;

  InsertReachUsFormRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.fullname,
        this.emailid,
        this.department,
        this.phonenumber,
        this.query});

  InsertReachUsFormRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    fullname = json['fullname'];
    emailid = json['emailid'];
    department = json['department'];
    phonenumber = json['phonenumber'];
    query = json['query'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['fullname'] = this.fullname;
    data['emailid'] = this.emailid;
    data['department'] = this.department;
    data['phonenumber'] = this.phonenumber;
    data['query'] = this.query;
    return data;
  }
}
