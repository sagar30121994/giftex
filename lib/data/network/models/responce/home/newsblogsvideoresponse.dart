class HomeNewsVideosBlogsResponse {
  List<News>? news;
  List<Videos>? videos;
  List<Blogs>? blogs;

  HomeNewsVideosBlogsResponse({this.news, this.videos, this.blogs});

  HomeNewsVideosBlogsResponse.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String? title;
  Image? image;
  String? credits;
  String? timestamp;
  String? desc;
  String? readMoreUrl;
  String? pageId;
  String? pageName;

  News(
      {this.title,
        this.image,
        this.credits,
        this.timestamp,
        this.desc,
        this.readMoreUrl,
        this.pageId,
        this.pageName});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    credits = json['credits'];
    timestamp = json['timestamp'];
    desc = json['desc'];
    readMoreUrl = json['readMoreUrl'];
    pageId = json['pageId'];
    pageName = json['pageName'];
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
    data['readMoreUrl'] = this.readMoreUrl;
    data['pageId'] = this.pageId;
    data['pageName'] = this.pageName;
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

class Videos {
  String? title;
  Image? image;
  String? timestamp;
  String? videoUrl;
  String? pageId;
  String? desc;
  String? pageName;

  Videos(
      {this.title,
        this.image,
        this.timestamp,
        this.videoUrl,
        this.pageId,
        this.desc,
        this.pageName});

  Videos.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    timestamp = json['timestamp'];
    videoUrl = json['videoUrl'];
    pageId = json['pageId'];
    desc = json['desc'];
    pageName = json['pageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['timestamp'] = this.timestamp;
    data['videoUrl'] = this.videoUrl;
    data['pageId'] = this.pageId;
    data['desc'] = this.desc;
    data['pageName'] = this.pageName;
    return data;
  }
}

class Blogs {
  String? id;
  String? title;
  String? authorName;
  String? pageName;
  String? credits;
  String? timestamp;
  String? date;
  Image? image;
  List<Filters>? filters;
  String? desc;

  Blogs(
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

  Blogs.fromJson(Map<String, dynamic> json) {
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
