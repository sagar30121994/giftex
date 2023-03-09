class HomeUpcommingAuctionResponse {
  String? _status;
  String? _message;
  List<AuctionArray>? _auctionArray;

  HomeUpcommingAuctionResponse(
      {String? status, String? message, List<AuctionArray>? auctionArray}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (auctionArray != null) {
      this._auctionArray = auctionArray;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<AuctionArray>? get auctionArray => _auctionArray;
  set auctionArray(List<AuctionArray>? auctionArray) =>
      _auctionArray = auctionArray;

  HomeUpcommingAuctionResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['auctionArray'] != null) {
      _auctionArray = <AuctionArray>[];
      json['auctionArray'].forEach((v) {
        _auctionArray!.add(new AuctionArray.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._auctionArray != null) {
      data['auctionArray'] =
          this._auctionArray!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AuctionArray {
  String? _title;
  String? _image;
  String? _displayDate;
  String? _link;
  int? _auctionId;
  String? _status;

  AuctionArray(
      {String? title,
        String? image,
        String? displayDate,
        String? link,
        int? auctionId,
        String? status}) {
    if (title != null) {
      this._title = title;
    }
    if (image != null) {
      this._image = image;
    }
    if (displayDate != null) {
      this._displayDate = displayDate;
    }
    if (link != null) {
      this._link = link;
    }
    if (auctionId != null) {
      this._auctionId = auctionId;
    }
    if (status != null) {
      this._status = status;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get displayDate => _displayDate;
  set displayDate(String? displayDate) => _displayDate = displayDate;
  String? get link => _link;
  set link(String? link) => _link = link;
  int? get auctionId => _auctionId;
  set auctionId(int? auctionId) => _auctionId = auctionId;
  String? get status => _status;
  set status(String? status) => _status = status;

  AuctionArray.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _image = json['image'];
    _displayDate = json['displayDate'];
    _link = json['link'];
    _auctionId = json['auctionId'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['image'] = this._image;
    data['displayDate'] = this._displayDate;
    data['link'] = this._link;
    data['auctionId'] = this._auctionId;
    data['status'] = this._status;
    return data;
  }
}
