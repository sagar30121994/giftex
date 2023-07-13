class GetRegInfoResponse {
  List<CountryList>? countryList;
  List<HearAboutList>? hearAboutList;
  List<InterestedList>? interestedList;
  List<IndianStateList>? indianStateList;
  List<IndianBankList>? indianBankList;
  dynamic? status;
  dynamic? message;

  GetRegInfoResponse(
      {this.countryList,
        this.hearAboutList,
        this.interestedList,
        this.indianStateList,
        this.indianBankList,
        this.status,
        this.message});

  GetRegInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json['countryList'] != null) {
      countryList = <CountryList>[];
      json['countryList'].forEach((v) {
        countryList!.add(new CountryList.fromJson(v));
      });
    }
    if (json['hearAboutList'] != null) {
      hearAboutList = <HearAboutList>[];
      json['hearAboutList'].forEach((v) {
        hearAboutList!.add(new HearAboutList.fromJson(v));
      });
    }
    if (json['interestedList'] != null) {
      interestedList = <InterestedList>[];
      json['interestedList'].forEach((v) {
        interestedList!.add(new InterestedList.fromJson(v));
      });
    }
    if (json['indianStateList'] != null) {
      indianStateList = <IndianStateList>[];
      json['indianStateList'].forEach((v) {
        indianStateList!.add(new IndianStateList.fromJson(v));
      });
    }
    if (json['indianBankList'] != null) {
      indianBankList = <IndianBankList>[];
      json['indianBankList'].forEach((v) {
        indianBankList!.add(new IndianBankList.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countryList != null) {
      data['countryList'] = this.countryList!.map((v) => v.toJson()).toList();
    }
    if (this.hearAboutList != null) {
      data['hearAboutList'] =
          this.hearAboutList!.map((v) => v.toJson()).toList();
    }
    if (this.interestedList != null) {
      data['interestedList'] =
          this.interestedList!.map((v) => v.toJson()).toList();
    }
    if (this.indianStateList != null) {
      data['indianStateList'] =
          this.indianStateList!.map((v) => v.toJson()).toList();
    }
    if (this.indianBankList != null) {
      data['indianBankList'] =
          this.indianBankList!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class CountryList {
  String? code;
  String? name;

  CountryList({this.code, this.name});

  CountryList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class HearAboutList {
  String? id;
  String? name;

  HearAboutList({this.id, this.name});

  HearAboutList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class InterestedList {
  String? id;
  String? name;
  String? img;
  String? categoryID;

  InterestedList({this.id, this.name, this.img, this.categoryID});

  InterestedList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    categoryID = json['CategoryID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['CategoryID'] = this.categoryID;
    return data;
  }
}

class IndianBankList {
  String? full;
  Null? nShort;

  IndianBankList({this.full, this.nShort});

  IndianBankList.fromJson(Map<String, dynamic> json) {
    full = json['full'];
    nShort = json['_short'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full'] = this.full;
    data['_short'] = this.nShort;
    return data;
  }
}

class IndianStateList {
  String? id;
  String? name;

  IndianStateList({this.id, this.name});

  IndianStateList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}