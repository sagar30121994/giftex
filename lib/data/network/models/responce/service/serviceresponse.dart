class ServiceResponse {
  Seo? seo;
  PageContent? pageContent;
  String? status;
  String? message;

  ServiceResponse({this.seo, this.pageContent, this.status, this.message});

  ServiceResponse.fromJson(Map<String, dynamic> json) {
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

  PageContent({this.banner, this.talkToExpert});

  PageContent.fromJson(Map<String, dynamic> json) {
    banner = json['banner'] != null ? new Banner.fromJson(json['banner']) : null;
    talkToExpert = json['talkToExpert'] != null ? new TalkToExpert.fromJson(json['talkToExpert']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    if (this.talkToExpert != null) {
      data['talkToExpert'] = this.talkToExpert!.toJson();
    }
    return data;
  }
}

class Banner {
  String? title1;
  String? title2;
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
