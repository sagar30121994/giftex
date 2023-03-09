class UpcomingAuctionResponse {
  String? status;
  String? message;
  Result? result;

  UpcomingAuctionResponse({this.status, this.message, this.result});

  UpcomingAuctionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Auctions>? auctions;

  Result({this.auctions});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['auctions'] != null) {
      auctions = <Auctions>[];
      json['auctions'].forEach((v) {
        auctions!.add(new Auctions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auctions != null) {
      data['auctions'] = this.auctions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Auctions {
  String? date;
  String? auctionURL;
  String? auctionName;
  String? announcedAudio;
  String? image;
  String? auctionDate;
  String? auctionEndDate;
  String? auctionId;
  String? displayDate;
  int? remainingSeconds;
  int? totalSaleValue;
  // List<Null>? departments;

  Auctions(
      {this.date,
        this.auctionURL,
        this.auctionName,
        this.announcedAudio,
        this.image,
        this.auctionDate,
        this.auctionEndDate,
        this.auctionId,
        this.displayDate,
        this.remainingSeconds,
        this.totalSaleValue,
       });

  Auctions.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    auctionURL = json['AuctionURL'];
    auctionName = json['AuctionName'];
    announcedAudio = json['AnnouncedAudio'];
    image = json['Image'];
    auctionDate = json['AuctionDate'];
    auctionEndDate = json['AuctionEndDate'];
    auctionId = json['AuctionId'];
    displayDate = json['DisplayDate'];
    remainingSeconds = json['remainingSeconds'];
    totalSaleValue = json['TotalSaleValue'];
    // if (json['Departments'] != null) {
    //   departments = <Null>[];
    //   json['Departments'].forEach((v) {
    //     departments!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['AuctionURL'] = this.auctionURL;
    data['AuctionName'] = this.auctionName;
    data['AnnouncedAudio'] = this.announcedAudio;
    data['Image'] = this.image;
    data['AuctionDate'] = this.auctionDate;
    data['AuctionEndDate'] = this.auctionEndDate;
    data['AuctionId'] = this.auctionId;
    data['DisplayDate'] = this.displayDate;
    data['remainingSeconds'] = this.remainingSeconds;
    data['TotalSaleValue'] = this.totalSaleValue;
    // if (this.departments != null) {
    //   data['Departments'] = this.departments!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
