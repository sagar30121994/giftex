class VerifyEmailResponse {
  String? status;
  String? message;
  Result? result;

  VerifyEmailResponse({this.status, this.message, this.result});

  VerifyEmailResponse.fromJson(Map<String, dynamic> json) {
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
  String? otp;
  String? sOtp;

  Result({this.otp, this.sOtp});

  Result.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    sOtp = json['s_otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['s_otp'] = this.sOtp;
    return data;
  }
}
