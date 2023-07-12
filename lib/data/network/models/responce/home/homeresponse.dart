class HomeBanerResponse {
  dynamic seo;
  PageContent? pageContent;
  dynamic status;
  dynamic message;
  dynamic navigation;
  dynamic auctionArray;
  dynamic servicesArray;
  dynamic collectors;
  dynamic news;
  dynamic videos;
  dynamic blogs;
  dynamic heading;
  dynamic desc;
  dynamic image;
  dynamic link;
  dynamic title;

  HomeBanerResponse(
      {this.seo,
      this.pageContent,
      this.status,
      this.message,
      this.navigation,
      this.auctionArray,
      this.servicesArray,
      this.collectors,
      this.news,
      this.videos,
      this.blogs,
      this.heading,
      this.desc,
      this.image,
      this.link,
      this.title});

  HomeBanerResponse.fromJson(Map<String, dynamic> json) {
    seo = json['seo'];
    pageContent = json['pageContent'] != null ? new PageContent.fromJson(json['pageContent']) : null;
    status = json['status'];
    message = json['message'];
    navigation = json['navigation'];
    auctionArray = json['auctionArray'];
    servicesArray = json['servicesArray'];
    collectors = json['collectors'];
    news = json['news'];
    videos = json['videos'];
    blogs = json['blogs'];
    heading = json['heading'];
    desc = json['desc'];
    image = json['image'];
    link = json['link'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seo'] = this.seo;
    if (this.pageContent != null) {
      data['pageContent'] = this.pageContent!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['navigation'] = this.navigation;
    data['auctionArray'] = this.auctionArray;
    data['servicesArray'] = this.servicesArray;
    data['collectors'] = this.collectors;
    data['news'] = this.news;
    data['videos'] = this.videos;
    data['blogs'] = this.blogs;
    data['heading'] = this.heading;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['link'] = this.link;
    data['title'] = this.title;
    return data;
  }
}

class PageContent {
  List<Banner>? banner;
  dynamic culture;
  dynamic ourValues;
  dynamic management;
  dynamic accordion;
  dynamic artists;
  dynamic talkToExpert;
  dynamic consign;
  dynamic steps;
  dynamic guide;
  dynamic reachForm;
  dynamic location;
  dynamic array;
  dynamic vacancies;
  dynamic workEnvironment;
  dynamic employeeSays;
  dynamic applyForJob;
  dynamic blogArray;
  dynamic collection;
  dynamic aboutArt;
  dynamic history;
  dynamic artVideos;
  dynamic title;
  dynamic desc;
  dynamic dataTabArray;
  dynamic latestnews;
  dynamic videos;
  dynamic newsDetail;
  dynamic bannerArray;
  dynamic bannerItem;
  dynamic blogDetail;
  dynamic blogDetailsArray;
  dynamic departments;
  dynamic pressDetail;

  PageContent(
      {this.banner,
      this.culture,
      this.ourValues,
      this.management,
      this.accordion,
      this.artists,
      this.talkToExpert,
      this.consign,
      this.steps,
      this.guide,
      this.reachForm,
      this.location,
      this.array,
      this.vacancies,
      this.workEnvironment,
      this.employeeSays,
      this.applyForJob,
      this.blogArray,
      this.collection,
      this.aboutArt,
      this.history,
      this.artVideos,
      this.title,
      this.desc,
      this.dataTabArray,
      this.latestnews,
      this.videos,
      this.newsDetail,
      this.bannerArray,
      this.bannerItem,
      this.blogDetail,
      this.blogDetailsArray,
      this.departments,
      this.pressDetail});

  PageContent.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
    culture = json['culture'];
    ourValues = json['ourValues'];
    management = json['management'];
    accordion = json['accordion'];
    artists = json['artists'];
    talkToExpert = json['talkToExpert'];
    consign = json['consign'];
    steps = json['steps'];
    guide = json['guide'];
    reachForm = json['reachForm'];
    location = json['location'];
    array = json['array'];
    vacancies = json['vacancies'];
    workEnvironment = json['workEnvironment'];
    employeeSays = json['employeeSays'];
    applyForJob = json['applyForJob'];
    blogArray = json['blogArray'];
    collection = json['collection'];
    aboutArt = json['aboutArt'];
    history = json['history'];
    artVideos = json['artVideos'];
    title = json['title'];
    desc = json['desc'];
    dataTabArray = json['dataTabArray'];
    latestnews = json['latestnews'];
    videos = json['videos'];
    newsDetail = json['newsDetail'];
    bannerArray = json['bannerArray'];
    bannerItem = json['bannerItem'];
    blogDetail = json['blogDetail'];
    blogDetailsArray = json['blogDetailsArray'];
    departments = json['departments'];
    pressDetail = json['pressDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    data['culture'] = this.culture;
    data['ourValues'] = this.ourValues;
    data['management'] = this.management;
    data['accordion'] = this.accordion;
    data['artists'] = this.artists;
    data['talkToExpert'] = this.talkToExpert;
    data['consign'] = this.consign;
    data['steps'] = this.steps;
    data['guide'] = this.guide;
    data['reachForm'] = this.reachForm;
    data['location'] = this.location;
    data['array'] = this.array;
    data['vacancies'] = this.vacancies;
    data['workEnvironment'] = this.workEnvironment;
    data['employeeSays'] = this.employeeSays;
    data['applyForJob'] = this.applyForJob;
    data['blogArray'] = this.blogArray;
    data['collection'] = this.collection;
    data['aboutArt'] = this.aboutArt;
    data['history'] = this.history;
    data['artVideos'] = this.artVideos;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['dataTabArray'] = this.dataTabArray;
    data['latestnews'] = this.latestnews;
    data['videos'] = this.videos;
    data['newsDetail'] = this.newsDetail;
    data['bannerArray'] = this.bannerArray;
    data['bannerItem'] = this.bannerItem;
    data['blogDetail'] = this.blogDetail;
    data['blogDetailsArray'] = this.blogDetailsArray;
    data['departments'] = this.departments;
    data['pressDetail'] = this.pressDetail;
    return data;
  }
}

class Banner {
  String? title1;
  String? title2;
  String? title3;
  dynamic title;
  Button? button;
  Image? image;
  dynamic desc;
  dynamic innerTitle;

  Banner({this.title1, this.title2, this.title3, this.title, this.button, this.image, this.desc, this.innerTitle});

  Banner.fromJson(Map<String, dynamic> json) {
    title1 = json['title_1'];
    title2 = json['title_2'];
    title3 = json['title_3'];
    title = json['title'];
    button = json['button'] != null ? new Button.fromJson(json['button']) : null;
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
    if (this.button != null) {
      data['button'] = this.button!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['desc'] = this.desc;
    data['innerTitle'] = this.innerTitle;
    return data;
  }
}

class Button {
  String? text;
  Cta? cta;
  Result? result;

  Button({this.text, this.cta, this.result});

  Button.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    cta = json['cta'] != null ? new Cta.fromJson(json['cta']) : null;
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.cta != null) {
      data['cta'] = this.cta!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Cta {
  String? type;
  String? link;

  Cta({this.type, this.link});

  Cta.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['link'] = this.link;
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
  dynamic date;
  String? auctionURL;
  String? auctionName;
  String? announcedAudio;
  String? image;
  String? auctionDate;
  String? auctionEndDate;
  String? auctionId;
  String? displayDate;
  String? auctionStatus;
  int? remainingSeconds;
  dynamic totalSaleValue;
  dynamic totalSaleValueUSD;
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
