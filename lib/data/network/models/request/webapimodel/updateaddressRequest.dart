class UpdateAddressRequest {
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

  UpdateAddressRequest(
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

  UpdateAddressRequest.fromJson(Map<String, dynamic> json) {
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
