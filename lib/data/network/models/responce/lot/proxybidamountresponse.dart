class GetProxyBidAmountResponse {
  String? status;
  String? message;
  Result? result;

  GetProxyBidAmountResponse({this.status, this.message, this.result});

  GetProxyBidAmountResponse.fromJson(Map<String, dynamic> json) {
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
  String? bidIncrementPercentage;
  List<NextValidBid>? nextValidBid;

  Result({this.bidIncrementPercentage, this.nextValidBid});

  Result.fromJson(Map<String, dynamic> json) {
    bidIncrementPercentage = json['BidIncrementPercentage'];
    if (json['NextValidBid'] != null) {
      nextValidBid = <NextValidBid>[];
      json['NextValidBid'].forEach((v) {
        nextValidBid!.add(new NextValidBid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BidIncrementPercentage'] = this.bidIncrementPercentage;
    if (this.nextValidBid != null) {
      data['NextValidBid'] = this.nextValidBid!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextValidBid {
  String? iNR;
  String? uSD;

  NextValidBid({this.iNR, this.uSD});

  NextValidBid.fromJson(Map<String, dynamic> json) {
    iNR = json['INR'];
    uSD = json['USD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['INR'] = this.iNR;
    data['USD'] = this.uSD;
    return data;
  }
}
