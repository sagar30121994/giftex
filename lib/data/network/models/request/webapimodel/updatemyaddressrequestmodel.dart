class UpdateMyAddressRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  Address? address;
  String? email;
  String? mobile;
  String? cRMClientID;
  String? yourName;
  String? addLine1;
  String? addLine2;
  String? pinCode;
  String? country;
  String? state;
  String? city;
  String? location;
  String? gstNum;
  String? billingAddLine1;
  String? billingAddLine2;
  String? billingPinCode;
  String? billingCountry;
  String? billingState;
  String? billingCity;
  String? billingLocation;
  String? billingGstNum;
  String? isbillingaddress;

  UpdateMyAddressRequestModel(
      {this.authkeyWeb,
        this.authkeyMobile,
        this.userid,
        this.address,
        this.email,
        this.mobile,
        this.cRMClientID,
        this.yourName,
        this.addLine1,
        this.addLine2,
        this.pinCode,
        this.country,
        this.state,
        this.city,
        this.location,
        this.gstNum,
        this.billingAddLine1,
        this.billingAddLine2,
        this.billingPinCode,
        this.billingCountry,
        this.billingState,
        this.billingCity,
        this.billingLocation,
        this.billingGstNum,
        this.isbillingaddress});

  UpdateMyAddressRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    email = json['email'];
    mobile = json['mobile'];
    cRMClientID = json['CRMClientID'];
    yourName = json['your_name'];
    addLine1 = json['add_line1'];
    addLine2 = json['add_line2'];
    pinCode = json['pin_code'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    location = json['location'];
    gstNum = json['gst_num'];
    billingAddLine1 = json['billing_add_line1'];
    billingAddLine2 = json['billing_add_line2'];
    billingPinCode = json['billing_pin_code'];
    billingCountry = json['billing_country'];
    billingState = json['billing_state'];
    billingCity = json['billing_city'];
    billingLocation = json['billing_location'];
    billingGstNum = json['billing_gst_num'];
    isbillingaddress = json['isbillingaddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['CRMClientID'] = this.cRMClientID;
    data['your_name'] = this.yourName;
    data['add_line1'] = this.addLine1;
    data['add_line2'] = this.addLine2;
    data['pin_code'] = this.pinCode;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['location'] = this.location;
    data['gst_num'] = this.gstNum;
    data['billing_add_line1'] = this.billingAddLine1;
    data['billing_add_line2'] = this.billingAddLine2;
    data['billing_pin_code'] = this.billingPinCode;
    data['billing_country'] = this.billingCountry;
    data['billing_state'] = this.billingState;
    data['billing_city'] = this.billingCity;
    data['billing_location'] = this.billingLocation;
    data['billing_gst_num'] = this.billingGstNum;
    data['isbillingaddress'] = this.isbillingaddress;
    return data;
  }
}

class Address {
  String? type;
  String? id;
  String? yourName;
  String? addLine1;
  String? addLine2;
  String? pinCode;
  String? country;
  String? state;
  String? city;
  String? location;
  String? gstNum;
  String? action;

  Address(
      {this.type,
        this.id,
        this.yourName,
        this.addLine1,
        this.addLine2,
        this.pinCode,
        this.country,
        this.state,
        this.city,
        this.location,
        this.gstNum,
        this.action});

  Address.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    yourName = json['your_name'];
    addLine1 = json['add_line1'];
    addLine2 = json['add_line2'];
    pinCode = json['pin_code'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    location = json['location'];
    gstNum = json['gst_num'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['your_name'] = this.yourName;
    data['add_line1'] = this.addLine1;
    data['add_line2'] = this.addLine2;
    data['pin_code'] = this.pinCode;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['location'] = this.location;
    data['gst_num'] = this.gstNum;
    data['action'] = this.action;
    return data;
  }
}
