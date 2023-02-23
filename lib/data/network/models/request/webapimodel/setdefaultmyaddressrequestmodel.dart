class SetDefaultAddressRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? addressId;

  SetDefaultAddressRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.addressId});

  SetDefaultAddressRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    addressId = json['address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['address_id'] = this.addressId;
    return data;
  }
}
