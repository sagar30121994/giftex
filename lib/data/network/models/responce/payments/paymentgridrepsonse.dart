class PaymentGridResponse {
  String? status;
  String? message;
  Result? result;

  PaymentGridResponse({this.status, this.message, this.result});

  PaymentGridResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
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
  List<PaymentGrids>? paymentGrids;

  Result({this.paymentGrids});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['paymentGrids'] != null) {
      paymentGrids = <PaymentGrids>[];
      json['paymentGrids'].forEach((v) {
        paymentGrids!.add(new PaymentGrids.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentGrids != null) {
      data['paymentGrids'] = this.paymentGrids!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentGrids {
  String? iD;
  String? paymentAmount;
  String? bidLimitAmount;

  PaymentGrids({this.iD, this.paymentAmount, this.bidLimitAmount});

  PaymentGrids.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    paymentAmount = json['payment_amount'];
    bidLimitAmount = json['bid_limit_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['payment_amount'] = this.paymentAmount;
    data['bid_limit_amount'] = this.bidLimitAmount;
    return data;
  }
}
