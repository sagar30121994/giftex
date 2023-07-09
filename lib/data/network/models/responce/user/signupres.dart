class SignUpResponse {
  String? status;
  String? message;
  String? clientID;

  SignUpResponse({this.status, this.message, this.clientID});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    clientID = json['clientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['clientID'] = this.clientID;
    return data;
  }
}
