class WhoWeAreResponse {
  Seo? seo;
  PageContent? pageContent;
  Null? status;
  Null? message;
  Null? navigation;
  Null? auctionArray;
  Null? servicesArray;
  Null? collectors;
  Null? news;
  Null? videos;
  Null? blogs;
  Null? heading;
  Null? desc;
  Null? image;
  Null? link;
  Null? title;

  WhoWeAreResponse(
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

  WhoWeAreResponse.fromJson(Map<String, dynamic> json) {
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
  Null? banner;
  Culture? culture;
  OurValues? ourValues;
  Management? management;
  Null? accordion;
  Null? artists;
  Null? talkToExpert;
  Null? consign;
  Null? steps;
  Null? guide;
  Null? reachForm;
  Null? location;
  Null? array;
  Null? vacancies;
  Null? workEnvironment;
  Null? employeeSays;
  Null? applyForJob;
  Null? blogArray;
  Null? collection;
  Null? aboutArt;
  Null? history;
  Null? artVideos;
  Null? title;
  Null? desc;
  Null? dataTabArray;
  Null? latestnews;
  Null? videos;
  Null? newsDetail;
  Null? bannerArray;
  BannerItem? bannerItem;
  Null? blogDetail;
  Null? blogDetailsArray;
  Null? departments;
  Null? pressDetail;

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
    culture = json['culture'] != null ? new Culture.fromJson(json['culture']) : null;
    ourValues = json['ourValues'] != null ? new OurValues.fromJson(json['ourValues']) : null;
    management = json['management'] != null ? new Management.fromJson(json['management']) : null;
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
    bannerItem = json['bannerItem'] != null ? new BannerItem.fromJson(json['bannerItem']) : null;
    blogDetail = json['blogDetail'];
    blogDetailsArray = json['blogDetailsArray'];
    departments = json['departments'];
    pressDetail = json['pressDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner'] = this.banner;
    if (this.culture != null) {
      data['culture'] = this.culture!.toJson();
    }
    if (this.ourValues != null) {
      data['ourValues'] = this.ourValues!.toJson();
    }
    if (this.management != null) {
      data['management'] = this.management!.toJson();
    }
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

class Culture {
  String? title;
  List<Image>? image;
  String? desc1;
  String? desc2;

  Culture({this.title, this.image, this.desc1, this.desc2});

  Culture.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    desc1 = json['desc_1'];
    desc2 = json['desc_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['desc_1'] = this.desc1;
    data['desc_2'] = this.desc2;
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

class OurValues {
  String? title;
  List<Array>? array;

  OurValues({this.title, this.array});

  OurValues.fromJson(Map<String, dynamic> json) {
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

class Array {
  String? desc;
  Image? image;

  Array({this.desc, this.image});

  Array.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Management {
  String? title;
  String? desc;
  List<ExpertProfile>? expertProfile;

  Management({this.title, this.desc, this.expertProfile});

  Management.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
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
    data['desc'] = this.desc;
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

class BannerItem {
  Null? title1;
  Null? title2;
  Null? title3;
  String? title;
  Null? button;
  Image? image;
  String? desc;
  Null? innerTitle;

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
