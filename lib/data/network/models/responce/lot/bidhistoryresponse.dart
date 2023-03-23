class BidInfoResponse {
  String? status;
  String? message;
  Result? result;

  BidInfoResponse({this.status, this.message, this.result});

  BidInfoResponse.fromJson(Map<String, dynamic> json) {
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
  List<BidHistory>? bidHistory;

  Result({this.bidHistory});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['BidHistory'] != null) {
      bidHistory = <BidHistory>[];
      json['BidHistory'].forEach((v) {
        bidHistory!.add(new BidHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bidHistory != null) {
      data['BidHistory'] = this.bidHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BidHistory {
  String? name;
  String? notes;
  String? dateTime;
  Amount? amount;

  BidHistory({this.name, this.notes, this.dateTime, this.amount});

  BidHistory.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    notes = json['Notes'];
    dateTime = json['DateTime'];
    amount =
    json['Amount'] != null ? new Amount.fromJson(json['Amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Notes'] = this.notes;
    data['DateTime'] = this.dateTime;
    if (this.amount != null) {
      data['Amount'] = this.amount!.toJson();
    }
    return data;
  }
}

class Amount {
  String? iNR;
  String? uSD;

  Amount({this.iNR, this.uSD});

  Amount.fromJson(Map<String, dynamic> json) {
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
