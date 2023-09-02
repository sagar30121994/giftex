class GetBuyDetailsResponse {
  Seo? seo;
  PageContent? pageContent;
  dynamic? status;
  dynamic? message;

  GetBuyDetailsResponse(
      {this.seo, this.pageContent, this.status, this.message});

  GetBuyDetailsResponse.fromJson(Map<String, dynamic> json) {
    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;
    pageContent = json['pageContent'] != null
        ? new PageContent.fromJson(json['pageContent'])
        : null;
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
  Banner? consign;
  List<Accordion>? accordion;

  PageContent({this.banner, this.consign, this.accordion});

  PageContent.fromJson(Map<String, dynamic> json) {
    banner =
        json['banner'] != null ? new Banner.fromJson(json['banner']) : null;
    consign =
        json['consign'] != null ? new Banner.fromJson(json['consign']) : null;
    if (json['accordion'] != null) {
      accordion = <Accordion>[];
      json['accordion'].forEach((v) {
        accordion!.add(new Accordion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    if (this.consign != null) {
      data['consign'] = this.consign!.toJson();
    }
    if (this.accordion != null) {
      data['accordion'] = this.accordion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  String? title;
  Image? image;
  String? desc;

  Banner({this.title, this.image, this.desc});

  Banner.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
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

class Accordion {
  String? title;
  String? desc;

  Accordion({this.title, this.desc});

  Accordion.fromJson(Map<String, dynamic> json) {
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
