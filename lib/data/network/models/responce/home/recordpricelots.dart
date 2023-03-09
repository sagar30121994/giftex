class RecordPriceLots {
  String? status;
  String? message;
  String? heading;
  List<TabArray>? tabArray;

  RecordPriceLots({this.status, this.message, this.heading, this.tabArray});

  RecordPriceLots.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    heading = json['heading'];
    if (json['tabArray'] != null) {
      tabArray = <TabArray>[];
      json['tabArray'].forEach((v) {
        tabArray!.add(new TabArray.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['heading'] = this.heading;
    if (this.tabArray != null) {
      data['tabArray'] = this.tabArray!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TabArray {
  String? tabName;
  List<Lots>? lots;

  TabArray({this.tabName, this.lots});

  TabArray.fromJson(Map<String, dynamic> json) {
    tabName = json['tabName'];
    if (json['lots'] != null) {
      lots = <Lots>[];
      json['lots'].forEach((v) {
        lots!.add(new Lots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tabName'] = this.tabName;
    if (this.lots != null) {
      data['lots'] = this.lots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lots {
  String? auctionId;
  String? lotId;
  int? auctionInventoryPID;
  String? exportType;
  String? ThumbImage;
  String? bidCount;
  String? lotDesc;
  String? category;
  String? lotDetDesc;
  String? categoryID;
  String? lotURL;
  String? lotNumber;
  String? url3D;
  List<Images>? images;
  String? lotTitle;
  String? isLiked;
  String? status;
  EstimateFrom? estimateFrom;
  EstimateFrom? estimateTo;
  EstimateFrom? estimateDisplayText;
  EstimateFrom? openingBid;
  DetailInfo? detailInfo;
  AdditionalInfo? additionalInfo;
  Info? info;

  Lots(
      {this.auctionId,
        this.lotId,
        this.auctionInventoryPID,
        this.exportType,
        this.ThumbImage,
        this.bidCount,
        this.lotDesc,
        this.category,
        this.lotDetDesc,
        this.categoryID,
        this.lotURL,
        this.lotNumber,
        this.url3D,
        this.images,
        this.lotTitle,
        this.isLiked,
        this.status,
        this.estimateFrom,
        this.estimateTo,
        this.estimateDisplayText,
        this.openingBid,
        this.detailInfo,
        this.additionalInfo,
        this.info});

  Lots.fromJson(Map<String, dynamic> json) {
    auctionId = json['AuctionId'];
    lotId = json['LotId'];
    auctionInventoryPID = json['AuctionInventoryPID'];
    exportType = json['ExportType'];
    ThumbImage = json['ThumbImage'];
    bidCount = json['BidCount'];
    lotDesc = json['LotDesc'];
    category = json['Category'];
    lotDetDesc = json['LotDetDesc'];
    categoryID = json['CategoryID'];
    lotURL = json['LotURL'];
    lotNumber = json['LotNumber'];
    url3D = json['Url3D'];
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    lotTitle = json['LotTitle'];
    isLiked = json['IsLiked'];
    ThumbImage = json['ThumbImage'];
    status = json['Status'];
    estimateFrom = json['EstimateFrom'] != null
        ? new EstimateFrom.fromJson(json['EstimateFrom'])
        : null;
    estimateTo = json['EstimateTo'] != null
        ? new EstimateFrom.fromJson(json['EstimateTo'])
        : null;
    estimateDisplayText = json['EstimateDisplayText'] != null
        ? new EstimateFrom.fromJson(json['EstimateDisplayText'])
        : null;
    openingBid = json['OpeningBid'] != null
        ? new EstimateFrom.fromJson(json['OpeningBid'])
        : null;
    detailInfo = json['DetailInfo'] != null
        ? new DetailInfo.fromJson(json['DetailInfo'])
        : null;
    additionalInfo = json['AdditionalInfo'] != null
        ? new AdditionalInfo.fromJson(json['AdditionalInfo'])
        : null;
    info = json['Info'] != null ? new Info.fromJson(json['Info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuctionId'] = this.auctionId;
    data['LotId'] = this.lotId;
    data['ThumbImage'] = this.ThumbImage;
    data['AuctionInventoryPID'] = this.auctionInventoryPID;
    data['ExportType'] = this.exportType;
    data['BidCount'] = this.bidCount;
    data['LotDesc'] = this.lotDesc;
    data['Category'] = this.category;
    data['LotDetDesc'] = this.lotDetDesc;
    data['CategoryID'] = this.categoryID;
    data['LotURL'] = this.lotURL;
    data['LotNumber'] = this.lotNumber;
    data['Url3D'] = this.url3D;
    if (this.images != null) {
      data['Images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['LotTitle'] = this.lotTitle;
    data['IsLiked'] = this.isLiked;
    data['Status'] = this.status;
    if (this.estimateFrom != null) {
      data['EstimateFrom'] = this.estimateFrom!.toJson();
    }
    if (this.estimateTo != null) {
      data['EstimateTo'] = this.estimateTo!.toJson();
    }
    if (this.estimateDisplayText != null) {
      data['EstimateDisplayText'] = this.estimateDisplayText!.toJson();
    }
    if (this.openingBid != null) {
      data['OpeningBid'] = this.openingBid!.toJson();
    }
    if (this.detailInfo != null) {
      data['DetailInfo'] = this.detailInfo!.toJson();
    }
    if (this.additionalInfo != null) {
      data['AdditionalInfo'] = this.additionalInfo!.toJson();
    }
    if (this.info != null) {
      data['Info'] = this.info!.toJson();
    }
    return data;
  }
}

class Images {
  String? thumbImage;
  String? bigImage;

  Images({this.thumbImage, this.bigImage});

  Images.fromJson(Map<String, dynamic> json) {
    thumbImage = json['ThumbImage'];
    bigImage = json['BigImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ThumbImage'] = this.thumbImage;
    data['BigImage'] = this.bigImage;
    return data;
  }
}

class EstimateFrom {
  String? iNR;
  String? uSD;

  EstimateFrom({this.iNR, this.uSD});

  EstimateFrom.fromJson(Map<String, dynamic> json) {
    iNR = json['INR'];
    uSD = json['USD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['INR'] = this.iNR;
    data['USD'] = this.uSD;
    return data;
  }
}

class DetailInfo {
  String? title;
  String? desc;

  DetailInfo({this.title, this.desc});

  DetailInfo.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    desc = json['Desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Desc'] = this.desc;
    return data;
  }
}

class AdditionalInfo {
  String? description;
  List<ConditionReport>? conditionReport;
  String? provenance;

  AdditionalInfo({this.description, this.conditionReport, this.provenance});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    if (json['ConditionReport'] != null) {
      conditionReport = <ConditionReport>[];
      json['ConditionReport'].forEach((v) {
        conditionReport!.add(new ConditionReport.fromJson(v));
      });
    }
    provenance = json['Provenance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    if (this.conditionReport != null) {
      data['ConditionReport'] =
          this.conditionReport!.map((v) => v.toJson()).toList();
    }
    data['Provenance'] = this.provenance;
    return data;
  }
}

class ConditionReport {
  String? title;
  String? pDF;

  ConditionReport({this.title, this.pDF});

  ConditionReport.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    pDF = json['PDF'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['PDF'] = this.pDF;
    return data;
  }
}

class Info {
  String? artistPageName;
  String? title;
  String? lotTitle;
  String? subTitle;
  String? medium;
  String? size;
  String? year;
  String? description;
  String? circa;
  String? artistImage;
  String? artistDescription;

  Info(
      {this.artistPageName,
        this.title,
        this.lotTitle,
        this.subTitle,
        this.medium,
        this.size,
        this.year,
        this.description,
        this.circa,
        this.artistImage,
        this.artistDescription});

  Info.fromJson(Map<String, dynamic> json) {
    artistPageName = json['artistPageName'];
    title = json['Title'];
    lotTitle = json['LotTitle'];
    subTitle = json['SubTitle'];
    medium = json['Medium'];
    size = json['Size'];
    year = json['Year'];
    description = json['Description'];
    circa = json['Circa'];
    artistImage = json['ArtistImage'];
    artistDescription = json['ArtistDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistPageName'] = this.artistPageName;
    data['Title'] = this.title;
    data['LotTitle'] = this.lotTitle;
    data['SubTitle'] = this.subTitle;
    data['Medium'] = this.medium;
    data['Size'] = this.size;
    data['Year'] = this.year;
    data['Description'] = this.description;
    data['Circa'] = this.circa;
    data['ArtistImage'] = this.artistImage;
    data['ArtistDescription'] = this.artistDescription;
    return data;
  }
}
