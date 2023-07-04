class DashboradOverviewResponse {
  int? totalSpent;
  int? availableAmount;
  int? actualAmount;
  String? name;
  String? designation;
  String? email;
  String? mobile;
  String? thumbImage;
  Executive? executive;

  DashboradOverviewResponse(
      {this.totalSpent,
      this.availableAmount,
      this.actualAmount,
      this.name,
      this.designation,
      this.email,
      this.mobile,
      this.thumbImage,
      this.executive});

  DashboradOverviewResponse.fromJson(Map<String, dynamic> json) {
    totalSpent = json['TotalSpent'];
    availableAmount = json['AvailableAmount'];
    actualAmount = json['ActualAmount'];
    name = json['Name'];
    designation = json['Designation'];
    email = json['Email'];
    mobile = json['Mobile'];
    thumbImage = json['ThumbImage'];
    executive = json['Executive'] != null ? new Executive.fromJson(json['Executive']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalSpent'] = this.totalSpent;
    data['AvailableAmount'] = this.availableAmount;
    data['ActualAmount'] = this.actualAmount;
    data['Name'] = this.name;
    data['Designation'] = this.designation;
    data['Email'] = this.email;
    data['Mobile'] = this.mobile;
    data['ThumbImage'] = this.thumbImage;
    if (this.executive != null) {
      data['Executive'] = this.executive!.toJson();
    }
    return data;
  }
}

class Executive {
  String? name;
  String? designation;
  String? email;
  String? mobile;
  String? thumbImage;

  Executive({this.name, this.designation, this.email, this.mobile, this.thumbImage});

  Executive.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    designation = json['Designation'];
    email = json['Email'];
    mobile = json['Mobile'];
    thumbImage = json['ThumbImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Designation'] = this.designation;
    data['Email'] = this.email;
    data['Mobile'] = this.mobile;
    data['ThumbImage'] = this.thumbImage;
    return data;
  }
}
