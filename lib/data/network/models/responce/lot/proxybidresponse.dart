class ProxyBidResponse {
  String? status;
  String? message;
  String? bidStatus;
  String? bidMessage;

  ProxyBidResponse(
      {this.status, this.message, this.bidStatus, this.bidMessage});

  ProxyBidResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    bidStatus = json['bidStatus'];
    bidMessage = json['bidMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['bidStatus'] = this.bidStatus;
    data['bidMessage'] = this.bidMessage;
    return data;
  }
}
