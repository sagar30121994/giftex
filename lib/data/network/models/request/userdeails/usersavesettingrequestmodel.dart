class SaveSettingRequestModel {
  String? userid;
  bool? auctionNotification;
  List<String>? hearAbout;
  bool? physicalCatalouge;
  bool? phoneBinding;
  int? type;

  SaveSettingRequestModel(
      {this.userid,
        this.auctionNotification,
        this.hearAbout,
        this.physicalCatalouge,
        this.phoneBinding,
        this.type});

  SaveSettingRequestModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    auctionNotification = json['AuctionNotification'];
    hearAbout = json['HearAbout'].cast<String>();
    physicalCatalouge = json['PhysicalCatalouge'];
    phoneBinding = json['PhoneBinding'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['AuctionNotification'] = this.auctionNotification;
    data['HearAbout'] = this.hearAbout;
    data['PhysicalCatalouge'] = this.physicalCatalouge;
    data['PhoneBinding'] = this.phoneBinding;
    data['Type'] = this.type;
    return data;
  }
}
