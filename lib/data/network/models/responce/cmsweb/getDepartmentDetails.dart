class GetDepartmentdetailsResponse {
  Seo? seo;
  PageContent? pageContent;
  Null? status;
  Null? message;

  GetDepartmentdetailsResponse({this.seo, this.pageContent, this.status, this.message});

  GetDepartmentdetailsResponse.fromJson(Map<String, dynamic> json) {
    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;
    pageContent = json['pageContent'] != null ? new PageContent.fromJson(json['pageContent']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }
    if (this.pageContent != null) {
      data['pageContent'] = this.pageContent!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Seo {
  String? title;
  String? description;
  String? keywords;
  String? type;
  String? image;

  Seo({this.title, this.description, this.keywords, this.type, this.image});

  Seo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['keywords'] = this.keywords;
    data['type'] = this.type;
    data['image'] = this.image;
    return data;
  }
}

class PageContent {
  Banner? banner;
  TalkToExpert? talkToExpert;
  Result? result;

  PageContent({this.banner, this.talkToExpert, this.result});

  PageContent.fromJson(Map<String, dynamic> json) {
    banner = json['banner'] != null ? new Banner.fromJson(json['banner']) : null;
    talkToExpert = json['talkToExpert'] != null ? new TalkToExpert.fromJson(json['talkToExpert']) : null;
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    if (this.talkToExpert != null) {
      data['talkToExpert'] = this.talkToExpert!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Banner {
  Null? title1;
  Null? title2;
  Null? title3;
  String? title;
  Null? button;
  Image? image;
  String? desc;
  String? innerTitle;

  Banner({this.title1, this.title2, this.title3, this.title, this.button, this.image, this.desc, this.innerTitle});

  Banner.fromJson(Map<String, dynamic> json) {
    title1 = json['title_1'];
    title2 = json['title_2'];
    title3 = json['title_3'];
    title = json['title'];
    button = json['button'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    desc = json['desc'];
    innerTitle = json['innerTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_1'] = this.title1;
    data['title_2'] = this.title2;
    data['title_3'] = this.title3;
    data['title'] = this.title;
    data['button'] = this.button;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['desc'] = this.desc;
    data['innerTitle'] = this.innerTitle;
    return data;
  }
}

class Image {
  String? desktop;
  String? mobile;

  Image({this.desktop, this.mobile});

  Image.fromJson(Map<String, dynamic> json) {
    desktop = json['desktop'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desktop'] = this.desktop;
    data['mobile'] = this.mobile;
    return data;
  }
}

class TalkToExpert {
  String? title;
  List<ExpertProfile>? expertProfile;

  TalkToExpert({this.title, this.expertProfile});

  TalkToExpert.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['expertProfile'] != null) {
      expertProfile = <ExpertProfile>[];
      json['expertProfile'].forEach((v) {
        expertProfile!.add(new ExpertProfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.expertProfile != null) {
      data['expertProfile'] = this.expertProfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpertProfile {
  String? name;
  String? designation;
  String? mail;
  Image? image;

  ExpertProfile({this.name, this.designation, this.mail, this.image});

  ExpertProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    mail = json['mail'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['mail'] = this.mail;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
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
  Null? date;
  String? auctionURL;
  String? auctionName;
  String? announcedAudio;
  String? image;
  String? auctionDate;
  String? auctionEndDate;
  String? auctionId;
  String? status;
  String? displayDate;
  Null? auctionStatus;
  int? remainingSeconds;
  double? totalSaleValue;
  double? totalSaleValueUSD;
  List<Departments>? departments;

  Auctions(
      {this.date,
      this.auctionURL,
      this.auctionName,
      this.announcedAudio,
      this.image,
      this.auctionDate,
      this.auctionEndDate,
      this.auctionId,
      this.status,
      this.displayDate,
      this.auctionStatus,
      this.remainingSeconds,
      this.totalSaleValue,
      this.totalSaleValueUSD,
      this.departments});

  Auctions.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    auctionURL = json['AuctionURL'];
    auctionName = json['AuctionName'];
    announcedAudio = json['AnnouncedAudio'];
    image = json['Image'];
    auctionDate = json['AuctionDate'];
    auctionEndDate = json['AuctionEndDate'];
    auctionId = json['AuctionId'];
    status = json['Status'];
    displayDate = json['DisplayDate'];
    auctionStatus = json['AuctionStatus'];
    remainingSeconds = json['remainingSeconds'];
    totalSaleValue = json['TotalSaleValue'];
    totalSaleValueUSD = json['TotalSaleValueUSD'];
    if (json['Departments'] != null) {
      departments = <Departments>[];
      json['Departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }
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
    data['Status'] = this.status;
    data['DisplayDate'] = this.displayDate;
    data['AuctionStatus'] = this.auctionStatus;
    data['remainingSeconds'] = this.remainingSeconds;
    data['TotalSaleValue'] = this.totalSaleValue;
    data['TotalSaleValueUSD'] = this.totalSaleValueUSD;
    if (this.departments != null) {
      data['Departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  String? id;
  String? name;

  Departments({this.id, this.name});

  Departments.fromJson(Map<String, dynamic> json) {
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
