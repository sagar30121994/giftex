class SingleAuctionDetsilaResponse {
  String? status;
  String? message;
  Result? result;

  SingleAuctionDetsilaResponse({this.status, this.message, this.result});

  SingleAuctionDetsilaResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? auctionTitle;
  String? auctionDate;
  String? auctionId;
  String? displayDate;
  String? cataloguePDF;
  String? walkThrough3D;
  String? banner;
  String? overviewMessage;
  String? closingScheduleMessage;
  List<ClosingScheduleList>? closingScheduleList;
  Calendar? calendar;
  String? status;

  Result(
      {this.auctionTitle,
        this.auctionDate,
        this.auctionId,
        this.displayDate,
        this.cataloguePDF,
        this.walkThrough3D,
        this.banner,
        this.overviewMessage,
        this.closingScheduleMessage,
        this.closingScheduleList,
        this.calendar,
        this.status});

  Result.fromJson(Map<String, dynamic> json) {
    auctionTitle = json['AuctionTitle'];
    auctionDate = json['AuctionDate'];
    auctionId = json['AuctionId'];
    displayDate = json['DisplayDate'];
    cataloguePDF = json['CataloguePDF'];
    walkThrough3D = json['WalkThrough3D'];
    banner = json['Banner'];
    overviewMessage = json['OverviewMessage'];
    closingScheduleMessage = json['ClosingScheduleMessage'];
    if (json['ClosingScheduleList'] != null) {
      closingScheduleList = <ClosingScheduleList>[];
      json['ClosingScheduleList'].forEach((v) {
        closingScheduleList!.add(new ClosingScheduleList.fromJson(v));
      });
    }
    calendar = json['Calendar'] != null
        ? new Calendar.fromJson(json['Calendar'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuctionTitle'] = this.auctionTitle;
    data['AuctionDate'] = this.auctionDate;
    data['AuctionId'] = this.auctionId;
    data['DisplayDate'] = this.displayDate;
    data['CataloguePDF'] = this.cataloguePDF;
    data['WalkThrough3D'] = this.walkThrough3D;
    data['Banner'] = this.banner;
    data['OverviewMessage'] = this.overviewMessage;
    data['ClosingScheduleMessage'] = this.closingScheduleMessage;
    if (this.closingScheduleList != null) {
      data['ClosingScheduleList'] =
          this.closingScheduleList!.map((v) => v.toJson()).toList();
    }
    if (this.calendar != null) {
      data['Calendar'] = this.calendar!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class ClosingScheduleList {
  int? groups;
  String? lotNumber;
  String? iST;
  String? eST;
  String? pST;
  String? uK;
  String? japan;
  String? china;

  ClosingScheduleList(
      {this.groups,
        this.lotNumber,
        this.iST,
        this.eST,
        this.pST,
        this.uK,
        this.japan,
        this.china});

  ClosingScheduleList.fromJson(Map<String, dynamic> json) {
    groups = json['Groups'];
    lotNumber = json['LotNumber'];
    iST = json['IST'];
    eST = json['EST'];
    pST = json['PST'];
    uK = json['UK'];
    japan = json['Japan'];
    china = json['China'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Groups'] = this.groups;
    data['LotNumber'] = this.lotNumber;
    data['IST'] = this.iST;
    data['EST'] = this.eST;
    data['PST'] = this.pST;
    data['UK'] = this.uK;
    data['Japan'] = this.japan;
    data['China'] = this.china;
    return data;
  }
}

class Calendar {
  String? start;
  String? end;
  String? timezone;
  String? title;
  String? description;
  String? location;
  String? organizer;

  Calendar(
      {this.start,
        this.end,
        this.timezone,
        this.title,
        this.description,
        this.location,
        this.organizer});

  Calendar.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
    timezone = json['timezone'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    organizer = json['organizer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    data['timezone'] = this.timezone;
    data['title'] = this.title;
    data['description'] = this.description;
    data['location'] = this.location;
    data['organizer'] = this.organizer;
    return data;
  }
}
