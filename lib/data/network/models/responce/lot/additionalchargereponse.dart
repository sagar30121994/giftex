class AdditionalChargeResponse {
  String? status;
  String? message;
  Result? result;

  AdditionalChargeResponse({this.status, this.message, this.result});

  AdditionalChargeResponse.fromJson(Map<String, dynamic> json) {
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
  Price? price;
  List<Taxation>? taxation;
  Price? total;
  List<String>? notes;
  bool? isInternational;
  bool? isUsedGood;

  Result(
      {this.price,
        this.taxation,
        this.total,
        this.notes,
        this.isInternational,
        this.isUsedGood});

  Result.fromJson(Map<String, dynamic> json) {
    price = json['Price'] != null ? new Price.fromJson(json['Price']) : null;
    if (json['Taxation'] != null) {
      taxation = <Taxation>[];
      json['Taxation'].forEach((v) {
        taxation!.add(new Taxation.fromJson(v));
      });
    }
    total = json['Total'] != null ? new Price.fromJson(json['Total']) : null;
    notes = json['Notes'].cast<String>();
    isInternational = json['IsInternational'];
    isUsedGood = json['IsUsedGood'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['Price'] = this.price!.toJson();
    }
    if (this.taxation != null) {
      data['Taxation'] = this.taxation!.map((v) => v.toJson()).toList();
    }
    if (this.total != null) {
      data['Total'] = this.total!.toJson();
    }
    data['Notes'] = this.notes;
    data['IsInternational'] = this.isInternational;
    data['IsUsedGood'] = this.isUsedGood;
    return data;
  }
}

class Price {
  String? iNR;
  String? uSD;

  Price({this.iNR, this.uSD});

  Price.fromJson(Map<String, dynamic> json) {
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

class Taxation {
  String? name;
  Price? value;

  Taxation({this.name, this.value});

  Taxation.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    value = json['Value'] != null ? new Price.fromJson(json['Value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    if (this.value != null) {
      data['Value'] = this.value!.toJson();
    }
    return data;
  }
}
