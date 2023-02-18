class LiveActionResponce{
  List<LiveAuction>? liveauction;

  LiveActionResponce({this.liveauction});

  LiveActionResponce.fromJson(Map<String, dynamic> json) {
    if (json['liveauction'] != null) {
      liveauction = <LiveAuction>[];
      json['liveauction'].forEach((v) {
        liveauction!.add(new LiveAuction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.liveauction != null) {
      data['liveauction'] = this.liveauction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiveAuction{
  int? auctionID;
  String? auctionName;

  LiveAuction({this.auctionID, this.auctionName});

  LiveAuction.fromJson(Map<String, dynamic> json) {
    auctionID = json['auctionID'];
    auctionName = json['AuctionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auctionID'] = this.auctionID;
    data['AuctionName'] = this.auctionName;
    return data;
  }
}
