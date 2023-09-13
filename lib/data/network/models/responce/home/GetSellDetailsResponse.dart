class GetSellDetailsResponse {
  Seo? seo;
  PageContent? pageContent;
  dynamic status;
  dynamic message;

  GetSellDetailsResponse(
      {this.seo, this.pageContent, this.status, this.message});

  GetSellDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  Steps? steps;
  Guide? guide;
  List<Accordion>? accordion;
  dynamic? notifications;
  EachSteps? consign;

  PageContent(
      {this.banner,
      this.steps,
      this.guide,
      this.accordion,
      this.notifications,
      this.consign});

  PageContent.fromJson(Map<String, dynamic> json) {
    banner =
        json['banner'] != null ? new Banner.fromJson(json['banner']) : null;
    steps = json['steps'] != null ? new Steps.fromJson(json['steps']) : null;
    guide = json['guide'] != null ? new Guide.fromJson(json['guide']) : null;
    if (json['accordion'] != null) {
      accordion = <Accordion>[];
      json['accordion'].forEach((v) {
        accordion!.add(new Accordion.fromJson(v));
      });
    }
    notifications = json['notifications'];
    consign = json['consign'] != null
        ? new EachSteps.fromJson(json['consign'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    if (this.steps != null) {
      data['steps'] = this.steps!.toJson();
    }
    if (this.guide != null) {
      data['guide'] = this.guide!.toJson();
    }
    if (this.accordion != null) {
      data['accordion'] = this.accordion!.map((v) => v.toJson()).toList();
    }
    data['notifications'] = this.notifications;
    if (this.consign != null) {
      data['consign'] = this.consign!.toJson();
    }
    return data;
  }
}

class Banner {
  dynamic? title1;
  dynamic? title2;
  dynamic? title3;
  String? title;
  dynamic? button;
  Image? image;
  String? desc;
  dynamic? innerTitle;

  Banner(
      {this.title1,
      this.title2,
      this.title3,
      this.title,
      this.button,
      this.image,
      this.desc,
      this.innerTitle});

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

class Steps {
  String? title;
  List<EachSteps>? eachSteps;

  Steps({this.title, this.eachSteps});

  Steps.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['eachSteps'] != null) {
      eachSteps = <EachSteps>[];
      json['eachSteps'].forEach((v) {
        eachSteps!.add(new EachSteps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.eachSteps != null) {
      data['eachSteps'] = this.eachSteps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EachSteps {
  String? title;
  Image? image;
  String? desc;

  EachSteps({this.title, this.image, this.desc});

  EachSteps.fromJson(Map<String, dynamic> json) {
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

class Guide {
  String? title;
  Image? image;
  String? videoURL;
  String? desc;

  Guide({this.title, this.image, this.videoURL, this.desc});

  Guide.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    videoURL = json['videoURL'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['videoURL'] = this.videoURL;
    data['desc'] = this.desc;
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
