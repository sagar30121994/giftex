class CareersResponse {
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

  CareersResponse(
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

  CareersResponse.fromJson(Map<String, dynamic> json) {
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
  Null? culture;
  Null? ourValues;
  Null? management;
  Null? accordion;
  Null? artists;
  Null? talkToExpert;
  Null? consign;
  Null? steps;
  Null? guide;
  Null? reachForm;
  Null? location;
  Null? array;
  Vacancies? vacancies;
  WorkEnvironment? workEnvironment;
  Vacancies? employeeSays;
  ApplyForJob? applyForJob;
  Null? blogArray;
  Null? collection;
  Null? aboutArt;
  Null? history;
  Null? artVideos;
  String? title;
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
    vacancies = json['vacancies'] != null ? new Vacancies.fromJson(json['vacancies']) : null;
    workEnvironment = json['workEnvironment'] != null ? new WorkEnvironment.fromJson(json['workEnvironment']) : null;
    employeeSays = json['employeeSays'] != null ? new Vacancies.fromJson(json['employeeSays']) : null;
    applyForJob = json['applyForJob'] != null ? new ApplyForJob.fromJson(json['applyForJob']) : null;
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
    if (this.vacancies != null) {
      data['vacancies'] = this.vacancies!.toJson();
    }
    if (this.workEnvironment != null) {
      data['workEnvironment'] = this.workEnvironment!.toJson();
    }
    if (this.employeeSays != null) {
      data['employeeSays'] = this.employeeSays!.toJson();
    }
    if (this.applyForJob != null) {
      data['applyForJob'] = this.applyForJob!.toJson();
    }
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

class Vacancies {
  String? title;
  List<Array>? array;

  Vacancies({this.title, this.array});

  Vacancies.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? date;
  String? desc;

  Array({this.title, this.date, this.desc});

  Array.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['desc'] = this.desc;
    return data;
  }
}

class WorkEnvironment {
  String? title;
  String? desc;
  Image? image;
  String? videoUrl;

  WorkEnvironment({this.title, this.desc, this.image, this.videoUrl});

  WorkEnvironment.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['videoUrl'] = this.videoUrl;
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

class Array1 {
  String? image;
  String? name;
  String? designation;
  String? desc;

  Array1({this.image, this.name, this.designation, this.desc});

  Array1.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    designation = json['designation'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['desc'] = this.desc;
    return data;
  }
}

class ApplyForJob {
  String? title;
  String? desc;
  List<JobTitle>? jobTitle;
  List<HowYouKnow>? howYouKnow;

  ApplyForJob({this.title, this.desc, this.jobTitle, this.howYouKnow});

  ApplyForJob.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    if (json['jobTitle'] != null) {
      jobTitle = <JobTitle>[];
      json['jobTitle'].forEach((v) {
        jobTitle!.add(new JobTitle.fromJson(v));
      });
    }
    if (json['howYouKnow'] != null) {
      howYouKnow = <HowYouKnow>[];
      json['howYouKnow'].forEach((v) {
        howYouKnow!.add(new HowYouKnow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    if (this.jobTitle != null) {
      data['jobTitle'] = this.jobTitle!.map((v) => v.toJson()).toList();
    }
    if (this.howYouKnow != null) {
      data['howYouKnow'] = this.howYouKnow!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobTitle {
  String? id;
  String? title;

  JobTitle({this.id, this.title});

  JobTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class HowYouKnow {
  String? id;
  String? source;

  HowYouKnow({this.id, this.source});

  HowYouKnow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
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
