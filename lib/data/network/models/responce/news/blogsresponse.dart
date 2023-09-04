class BlogsResponse {
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

  BlogsResponse(
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

  BlogsResponse.fromJson(Map<String, dynamic> json) {
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
  Null? vacancies;
  Null? workEnvironment;
  Null? employeeSays;
  Null? applyForJob;
  List<BlogArray>? blogArray;
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
  Null? bannerItem;
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
    vacancies = json['vacancies'];
    workEnvironment = json['workEnvironment'];
    employeeSays = json['employeeSays'];
    applyForJob = json['applyForJob'];
    if (json['blogArray'] != null) {
      blogArray = <BlogArray>[];
      json['blogArray'].forEach((v) {
        blogArray!.add(new BlogArray.fromJson(v));
      });
    }
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
    if (this.blogArray != null) {
      data['blogArray'] = this.blogArray!.map((v) => v.toJson()).toList();
    }
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

class BlogArray {
  String? id;
  String? title;
  String? authorName;
  String? pageName;
  String? credits;
  String? timestamp;
  String? date;
  Image? image;
  List<Filters>? filters;
  Null? desc;

  BlogArray(
      {this.id,
      this.title,
      this.authorName,
      this.pageName,
      this.credits,
      this.timestamp,
      this.date,
      this.image,
      this.filters,
      this.desc});

  BlogArray.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['title'];
    authorName = json['authorName'];
    pageName = json['pageName'];
    credits = json['credits'];
    timestamp = json['timestamp'];
    date = json['date'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['Filters'] != null) {
      filters = <Filters>[];
      json['Filters'].forEach((v) {
        filters!.add(new Filters.fromJson(v));
      });
    }
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['title'] = this.title;
    data['authorName'] = this.authorName;
    data['pageName'] = this.pageName;
    data['credits'] = this.credits;
    data['timestamp'] = this.timestamp;
    data['date'] = this.date;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.filters != null) {
      data['Filters'] = this.filters!.map((v) => v.toJson()).toList();
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

class Filters {
  String? name;
  String? value;

  Filters({this.name, this.value});

  Filters.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Value'] = this.value;
    return data;
  }
}
