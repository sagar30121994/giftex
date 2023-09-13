class PaymentResponce {
  String? txnid;
  String? udf5;
  String? udf1;
  String? udf2;
  String? curl;
  String? firstname;
  String? key;
  String? furl;
  String? pg;
  String? phone;
  String? surl;
  String? amount;
  String? lastname;
  String? productinfo;
  String? email;
  String? hash;
  Null? formHtml;
  String? formPostUrl;

  PaymentResponce(
      {this.txnid,
      this.udf5,
      this.udf1,
      this.udf2,
      this.curl,
      this.firstname,
      this.key,
      this.furl,
      this.pg,
      this.phone,
      this.surl,
      this.amount,
      this.lastname,
      this.productinfo,
      this.email,
      this.hash,
      this.formHtml,
      this.formPostUrl});

  PaymentResponce.fromJson(Map<String, dynamic> json) {
    txnid = json['txnid'];
    udf5 = json['udf5'];
    udf1 = json['udf1'];
    udf2 = json['udf2'];
    curl = json['curl'];
    firstname = json['firstname'];
    key = json['key'];
    furl = json['furl'];
    pg = json['pg'];
    phone = json['phone'];
    surl = json['surl'];
    amount = json['amount'];
    lastname = json['lastname'];
    productinfo = json['productinfo'];
    email = json['email'];
    hash = json['hash'];
    formHtml = json['formHtml'];
    formPostUrl = json['formPostUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txnid'] = this.txnid;
    data['udf5'] = this.udf5;
    data['udf1'] = this.udf1;
    data['udf2'] = this.udf2;
    data['curl'] = this.curl;
    data['firstname'] = this.firstname;
    data['key'] = this.key;
    data['furl'] = this.furl;
    data['pg'] = this.pg;
    data['phone'] = this.phone;
    data['surl'] = this.surl;
    data['amount'] = this.amount;
    data['lastname'] = this.lastname;
    data['productinfo'] = this.productinfo;
    data['email'] = this.email;
    data['hash'] = this.hash;
    data['formHtml'] = this.formHtml;
    data['formPostUrl'] = this.formPostUrl;
    return data;
  }
}
