class GetArtMovementResponse {
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

  GetArtMovementResponse(
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

  GetArtMovementResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic? array;
  dynamic? vacancies;
  dynamic? workEnvironment;
  dynamic? employeeSays;
  dynamic? applyForJob;
  dynamic? blogArray;
  dynamic? collection;
  AboutArt? aboutArt;
  History? history;
  ArtVideos? artVideos;
  dynamic? title;
  dynamic? desc;
  dynamic? dataTabArray;
  dynamic? latestnews;
  dynamic? videos;
  dynamic? newsDetail;
  dynamic? bannerArray;
  BannerItem? bannerItem;
  dynamic? blogDetail;
  dynamic? blogDetailsArray;
  dynamic? departments;
  dynamic? pressDetail;

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
    array = json['array'];
    vacancies = json['vacancies'];
    workEnvironment = json['workEnvironment'];
    employeeSays = json['employeeSays'];
    applyForJob = json['applyForJob'];
    blogArray = json['blogArray'];
    collection = json['collection'];
    aboutArt = json['aboutArt'] != null ? new AboutArt.fromJson(json['aboutArt']) : null;
    history = json['history'] != null ? new History.fromJson(json['history']) : null;
    artVideos = json['artVideos'] != null ? new ArtVideos.fromJson(json['artVideos']) : null;
    title = json['title'];
    desc = json['desc'];
    dataTabArray = json['dataTabArray'];
    latestnews = json['latestnews'];
    videos = json['videos'];
    newsDetail = json['newsDetail'];
    bannerArray = json['bannerArray'];
    bannerItem = json['bannerItem'] != null ? new BannerItem.fromJson(json['bannerItem']) : null;
    blogDetail = json['blogDetail'];
    blogDetailsArray = json['blogDetailsArray'];
    departments = json['departments'];
    pressDetail = json['pressDetail'];
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
    data['array'] = this.array;
    data['vacancies'] = this.vacancies;
    data['workEnvironment'] = this.workEnvironment;
    data['employeeSays'] = this.employeeSays;
    data['applyForJob'] = this.applyForJob;
    data['blogArray'] = this.blogArray;
    data['collection'] = this.collection;
    if (this.aboutArt != null) {
      data['aboutArt'] = this.aboutArt!.toJson();
    }
    if (this.history != null) {
      data['history'] = this.history!.toJson();
    }
    if (this.artVideos != null) {
      data['artVideos'] = this.artVideos!.toJson();
    }
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['dataTabArray'] = this.dataTabArray;
    data['latestnews'] = this.latestnews;
    data['videos'] = this.videos;
    data['newsDetail'] = this.newsDetail;
    data['bannerArray'] = this.bannerArray;
    if (this.bannerItem != null) {
      data['bannerItem'] = this.bannerItem!.toJson();
    }
    data['blogDetail'] = this.blogDetail;
    data['blogDetailsArray'] = this.blogDetailsArray;
    data['departments'] = this.departments;
    data['pressDetail'] = this.pressDetail;
    return data;
  }
}

class ArtVideos {
  String? title;
  List<Array>? array;

  ArtVideos({this.title, this.array});

  ArtVideos.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['array'] != null) {
      array = <Array>[];
      json['array'].forEach((v) {
        array!.add(new Array.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.array != null) {
      data['array'] = this.array!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AboutArt {
  String? title;
  String? desc;

  AboutArt({this.title, this.desc});

  AboutArt.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    return data;
  }
}

class History {
  String? title;
  List<Array1>? array;

  History({this.title, this.array});

  History.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['array'] != null) {
      array = <Array1>[];
      json['array'].forEach((v) {
        array!.add(new Array1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.array != null) {
      data['array'] = this.array!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Array1 {
  String? year;
  Image? image;
  String? desc;

  Array1({this.year, this.image, this.desc});

  Array1.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['desc'] = this.desc;
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

class Array {
  Image? image;
  String? videoUrl;
  String? title;
  String? date;

  Array({this.image, this.videoUrl, this.title, this.date});

  Array.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    videoUrl = json['videoUrl'];
    title = json['title'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['videoUrl'] = this.videoUrl;
    data['title'] = this.title;
    data['Date'] = this.date;
    return data;
  }
}

class BannerItem {
  dynamic? title1;
  dynamic? title2;
  dynamic? title3;
  String? title;
  dynamic? button;
  Image? image;
  dynamic? desc;
  dynamic? innerTitle;

  BannerItem({this.title1, this.title2, this.title3, this.title, this.button, this.image, this.desc, this.innerTitle});

  BannerItem.fromJson(Map<String, dynamic> json) {
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
