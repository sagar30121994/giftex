class PressResponse {
  Seo? seo;
  PageContent? pageContent;
  dynamic? status;
  dynamic? message;
  dynamic? navigation;
  dynamic? auctionArray;
  dynamic? servicesArray;
  dynamic? collectors;
  dynamic? news;
  dynamic? videos;
  dynamic? blogs;
  dynamic? heading;
  dynamic? desc;
  dynamic? image;
  dynamic? link;
  dynamic? title;

  PressResponse(
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

  PressResponse.fromJson(Map<String, dynamic> json) {
    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;
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
    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }
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
  dynamic? banner;
  dynamic? culture;
  dynamic? ourValues;
  dynamic? management;
  dynamic? accordion;
  dynamic? artists;
  dynamic? talkToExpert;
  dynamic? consign;
  dynamic? steps;
  dynamic? guide;
  dynamic? reachForm;
  dynamic? location;
  List<Array>? array;
  dynamic? vacancies;
  dynamic? workEnvironment;
  dynamic? employeeSays;
  dynamic? applyForJob;
  dynamic? blogArray;
  dynamic? collection;
  dynamic? aboutArt;
  dynamic? history;
  dynamic? artVideos;
  String? title;
  dynamic? desc;
  dynamic? dataTabArray;
  dynamic? latestnews;
  dynamic? videos;
  dynamic? newsDetail;
  dynamic? bannerArray;
  dynamic? bannerItem;
  BlogDetail? blogDetail;
  dynamic? blogDetailsArray;
  dynamic? departments;
  PressDetail? pressDetail;

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
    banner = json['banner'];
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
    if (json['array'] != null) {
      array = <Array>[];
      json['array'].forEach((v) {
        array!.add(new Array.fromJson(v));
      });
    }
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
    blogDetail = json['blogDetail'] != null ? new BlogDetail.fromJson(json['blogDetail']) : null;
    blogDetailsArray = json['blogDetailsArray'];
    departments = json['departments'];
    pressDetail = json['pressDetail'] != null ? new PressDetail.fromJson(json['pressDetail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner'] = this.banner;
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
    if (this.array != null) {
      data['array'] = this.array!.map((v) => v.toJson()).toList();
    }
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
    if (this.blogDetail != null) {
      data['blogDetail'] = this.blogDetail!.toJson();
    }
    data['blogDetailsArray'] = this.blogDetailsArray;
    data['departments'] = this.departments;
    if (this.pressDetail != null) {
      data['pressDetail'] = this.pressDetail!.toJson();
    }
    return data;
  }
}

class Array {
  String? id;
  String? title;
  String? credits;
  String? timestamp;
  String? pageUrl;
  dynamic? pageName;
  Image? image;

  Array({this.id, this.title, this.credits, this.timestamp, this.pageUrl, this.pageName, this.image});

  Array.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['title'];
    credits = json['credits'];
    timestamp = json['timestamp'];
    pageUrl = json['pageUrl'];
    pageName = json['pageName'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['title'] = this.title;
    data['credits'] = this.credits;
    data['timestamp'] = this.timestamp;
    data['pageUrl'] = this.pageUrl;
    data['pageName'] = this.pageName;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
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

class BlogDetail {
  String? title;
  Image? image;
  String? credits;
  String? timestamp;
  String? desc;

  BlogDetail({this.title, this.image, this.credits, this.timestamp, this.desc});

  BlogDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    credits = json['credits'];
    timestamp = json['timestamp'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['credits'] = this.credits;
    data['timestamp'] = this.timestamp;
    data['desc'] = this.desc;
    return data;
  }
}

class PressDetail {
  dynamic? id;
  String? title;
  Image? image;
  String? credits;
  String? timestamp;
  String? desc;
  String? readMoreUrl;

  PressDetail({this.id, this.title, this.image, this.credits, this.timestamp, this.desc, this.readMoreUrl});

  PressDetail.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    credits = json['credits'];
    timestamp = json['timestamp'];
    desc = json['desc'];
    readMoreUrl = json['readMoreUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['credits'] = this.credits;
    data['timestamp'] = this.timestamp;
    data['desc'] = this.desc;
    data['readMoreUrl'] = this.readMoreUrl;
    return data;
  }
}
