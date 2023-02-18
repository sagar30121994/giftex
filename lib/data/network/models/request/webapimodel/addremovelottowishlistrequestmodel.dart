class AddRemoveToWishlistRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  String? lotId;
  String? like;

  AddRemoveToWishlistRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.lotId,
        this.like});

  AddRemoveToWishlistRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    lotId = json['LotId'];
    like = json['Like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    data['LotId'] = this.lotId;
    data['Like'] = this.like;
    return data;
  }
}
