class HomeBanerResponse {
  PageContent? _pageContent;
  String? _status;
  String? _message;

  HomeBanerResponse(
      {PageContent? pageContent, String? status, String? message}) {
    if (pageContent != null) {
      this._pageContent = pageContent;
    }
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
  }

  PageContent? get pageContent => _pageContent;
  set pageContent(PageContent? pageContent) => _pageContent = pageContent;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;

  HomeBanerResponse.fromJson(Map<String, dynamic> json) {
    _pageContent = json['pageContent'] != null
        ? new PageContent.fromJson(json['pageContent'])
        : null;
    _status = json['status'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._pageContent != null) {
      data['pageContent'] = this._pageContent!.toJson();
    }
    data['status'] = this._status;
    data['message'] = this._message;
    return data;
  }
}

class PageContent {
  List<Banner>? _banner;

  PageContent({List<Banner>? banner}) {
    if (banner != null) {
      this._banner = banner;
    }
  }

  List<Banner>? get banner => _banner;
  set banner(List<Banner>? banner) => _banner = banner;

  PageContent.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      _banner = <Banner>[];
      json['banner'].forEach((v) {
        _banner!.add(new Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._banner != null) {
      data['banner'] = this._banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  String? _title1;
  String? _title2;
  String? _title3;
  String? _title;
  Button? _button;
  Image? _image;
  String? _desc;
  String? _innerTitle;

  Banner(
      {String? title1,
        String? title2,
        String? title3,
        String? title,
        Button? button,
        Image? image,
        String? desc,
        String? innerTitle}) {
    if (title1 != null) {
      this._title1 = title1;
    }
    if (title2 != null) {
      this._title2 = title2;
    }
    if (title3 != null) {
      this._title3 = title3;
    }
    if (title != null) {
      this._title = title;
    }
    if (button != null) {
      this._button = button;
    }
    if (image != null) {
      this._image = image;
    }
    if (desc != null) {
      this._desc = desc;
    }
    if (innerTitle != null) {
      this._innerTitle = innerTitle;
    }
  }

  String? get title1 => _title1;
  set title1(String? title1) => _title1 = title1;
  String? get title2 => _title2;
  set title2(String? title2) => _title2 = title2;
  String? get title3 => _title3;
  set title3(String? title3) => _title3 = title3;
  String? get title => _title;
  set title(String? title) => _title = title;
  Button? get button => _button;
  set button(Button? button) => _button = button;
  Image? get image => _image;
  set image(Image? image) => _image = image;
  String? get desc => _desc;
  set desc(String? desc) => _desc = desc;
  String? get innerTitle => _innerTitle;
  set innerTitle(String? innerTitle) => _innerTitle = innerTitle;

  Banner.fromJson(Map<String, dynamic> json) {
    _title1 = json['title_1'];
    _title2 = json['title_2'];
    _title3 = json['title_3'];
    _title = json['title'];
    _button =
    json['button'] != null ? new Button.fromJson(json['button']) : null;
    _image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    _desc = json['desc'];
    _innerTitle = json['innerTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_1'] = this._title1;
    data['title_2'] = this._title2;
    data['title_3'] = this._title3;
    data['title'] = this._title;
    if (this._button != null) {
      data['button'] = this._button!.toJson();
    }
    if (this._image != null) {
      data['image'] = this._image!.toJson();
    }
    data['desc'] = this._desc;
    data['innerTitle'] = this._innerTitle;
    return data;
  }
}

class Button {
  String? _text;
  Cta? _cta;

  Button({String? text, Cta? cta}) {
    if (text != null) {
      this._text = text;
    }
    if (cta != null) {
      this._cta = cta;
    }
  }

  String? get text => _text;
  set text(String? text) => _text = text;
  Cta? get cta => _cta;
  set cta(Cta? cta) => _cta = cta;

  Button.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _cta = json['cta'] != null ? new Cta.fromJson(json['cta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    if (this._cta != null) {
      data['cta'] = this._cta!.toJson();
    }
    return data;
  }
}

class Cta {
  String? _type;
  String? _link;

  Cta({String? type, String? link}) {
    if (type != null) {
      this._type = type;
    }
    if (link != null) {
      this._link = link;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get link => _link;
  set link(String? link) => _link = link;

  Cta.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['link'] = this._link;
    return data;
  }
}

class Image {
  String? _desktop;
  String? _mobile;

  Image({String? desktop, String? mobile}) {
    if (desktop != null) {
      this._desktop = desktop;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
  }

  String? get desktop => _desktop;
  set desktop(String? desktop) => _desktop = desktop;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;

  Image.fromJson(Map<String, dynamic> json) {
    _desktop = json['desktop'];
    _mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desktop'] = this._desktop;
    data['mobile'] = this._mobile;
    return data;
  }
}
