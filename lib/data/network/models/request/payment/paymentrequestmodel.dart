class PaymentRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  int? amount;

  PaymentRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.amount});

  PaymentRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    amount = json['Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['Amount'] = this.amount;
    return data;
  }
}
