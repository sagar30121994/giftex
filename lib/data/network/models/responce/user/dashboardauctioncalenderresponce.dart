class DashboardCalenderResponce {
  List<DashboardCalender>? dashboardcalender;

  DashboardCalenderResponce({ this.dashboardcalender});

  DashboardCalenderResponce.fromJson(Map<String, dynamic> json) {
    if (json['dashboardcalender'] != null) {
      dashboardcalender = <DashboardCalender>[];
      json['dashboardcalender'].forEach((v) {
        dashboardcalender!.add(new DashboardCalender.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dashboardcalender != null) {
      data['dashboardcalender'] = this.dashboardcalender!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class DashboardCalender {
  String? auctionName;
  String? auctionDate;
  String? auctionEndDate;
  String? auctionId;
  String? auctionURL;
  String? displayDate;

  DashboardCalender(
      {this.auctionName,
        this.auctionDate,
        this.auctionEndDate,
        this.auctionId,
        this.auctionURL,
        this.displayDate});

  DashboardCalender.fromJson(Map<String, dynamic> json) {
    auctionName = json['AuctionName'];
    auctionDate = json['AuctionDate'];
    auctionEndDate = json['AuctionEndDate'];
    auctionId = json['AuctionId'];
    auctionURL = json['AuctionURL'];
    displayDate = json['DisplayDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuctionName'] = this.auctionName;
    data['AuctionDate'] = this.auctionDate;
    data['AuctionEndDate'] = this.auctionEndDate;
    data['AuctionId'] = this.auctionId;
    data['AuctionURL'] = this.auctionURL;
    data['DisplayDate'] = this.displayDate;
    return data;
  }
}
