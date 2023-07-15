class SearchResponse {
  String? status;
  String? message;
  Result? result;

  SearchResponse({this.status, this.message, this.result});

  SearchResponse.fromJson(Map<String, dynamic> json) {
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
  String? auctionId;
  String? auctionStatus;
  List<Lots>? lots;

  Result({this.auctionId, this.auctionStatus, this.lots});

  Result.fromJson(Map<String, dynamic> json) {
    auctionId = json['AuctionId'];
    auctionStatus = json['AuctionStatus'];
    if (json['lots'] != null) {
      lots = <Lots>[];
      json['lots'].forEach((v) {
        lots!.add(new Lots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuctionId'] = this.auctionId;
    data['AuctionStatus'] = this.auctionStatus;
    if (this.lots != null) {
      data['lots'] = this.lots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lots {
  String? auctionId;
  String? lotId;
  dynamic? auctionInventoryPID;
  String? exportType;
  String? bidCount;
  String? lotDesc;
  String? category;
  String? lotDetDesc;
  String? categoryID;
  String? lotURL;
  String? lotNumber;
  LeadingUser? leadingUser;
  LiveStatus? liveStatus;
  String? url3D;
  List<Images>? images;
  String? lotTitle;
  String? isLiked;
  ProxyStatus? proxyStatus;
  BidAccess? bidAccess;
  String? status;
  Bid? estimateFrom;
  Bid? estimateTo;
  Bid? estimateDisplayText;
  Bid? openingBid;
  dynamic detailInfo;
  dynamic additionalInfo;
  dynamic remainTimeObj;
  dynamic? remainingSecondsInNumber;
  dynamic lastStatus;
  dynamic auctionStatus;
  String? thumbImage;
  String? currentBid;
  String? currentBidUS;
  String? artistName;
  String? type;
  String? productsize;
  String? medium;
  String? year;
  String? estimateToLegacy;
  String? estimateFromLegacy;
  String? estimateToLegacyINR;
  String? estimateFromLegacyINR;
  String? bidIncrementPercentage;
  Info? info;
  dynamic bidincrement;
  String? auctionType;
  String? auctionDated;
  String? isHistorical;
  dynamic? dollarRate;
  String? description;
  String? artistImage;
  String? artistDesc;
  String? auctionDate;
  String? auctionMargin;
  dynamic? lotCount;
  String? remainingSecondsFrom;
  dynamic? paginationSize;

  Lots(
      {this.auctionId,
        this.lotId,
        this.auctionInventoryPID,
        this.exportType,
        this.bidCount,
        this.lotDesc,
        this.category,
        this.lotDetDesc,
        this.categoryID,
        this.lotURL,
        this.lotNumber,
        this.leadingUser,
        this.liveStatus,
        this.url3D,
        this.images,
        this.lotTitle,
        this.isLiked,
        this.proxyStatus,
        this.bidAccess,
        this.status,
        this.estimateFrom,
        this.estimateTo,
        this.estimateDisplayText,
        this.openingBid,
        this.detailInfo,
        this.additionalInfo,
        this.remainTimeObj,
        this.remainingSecondsInNumber,
        this.lastStatus,
        this.auctionStatus,
        this.thumbImage,
        this.currentBid,
        this.currentBidUS,
        this.artistName,
        this.type,
        this.productsize,
        this.medium,
        this.year,
        this.estimateToLegacy,
        this.estimateFromLegacy,
        this.estimateToLegacyINR,
        this.estimateFromLegacyINR,
        this.bidIncrementPercentage,
        this.info,
        this.bidincrement,
        this.auctionType,
        this.auctionDated,
        this.isHistorical,
        this.dollarRate,
        this.description,
        this.artistImage,
        this.artistDesc,
        this.auctionDate,
        this.auctionMargin,
        this.lotCount,
        this.remainingSecondsFrom,
        this.paginationSize});

  Lots.fromJson(Map<String, dynamic> json) {
    auctionId = json['AuctionId'];
    lotId = json['LotId'];
    auctionInventoryPID = json['AuctionInventoryPID'];
    exportType = json['ExportType'];
    bidCount = json['BidCount'];
    lotDesc = json['LotDesc'];
    category = json['Category'];
    lotDetDesc = json['LotDetDesc'];
    categoryID = json['CategoryID'];
    lotURL = json['LotURL'];
    lotNumber = json['LotNumber'];
    leadingUser = json['LeadingUser'] != null
        ? new LeadingUser.fromJson(json['LeadingUser'])
        : null;
    liveStatus = json['LiveStatus'] != null
        ? new LiveStatus.fromJson(json['LiveStatus'])
        : null;
    url3D = json['Url3D'];
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    lotTitle = json['LotTitle'];
    isLiked = json['IsLiked'];
    proxyStatus = json['ProxyStatus'] != null
        ? new ProxyStatus.fromJson(json['ProxyStatus'])
        : null;
    bidAccess = json['BidAccess'] != null
        ? new BidAccess.fromJson(json['BidAccess'])
        : null;
    status = json['Status'];
    estimateFrom = json['EstimateFrom'] != null
        ? new Bid.fromJson(json['EstimateFrom'])
        : null;
    estimateTo = json['EstimateTo'] != null
        ? new Bid.fromJson(json['EstimateTo'])
        : null;
    estimateDisplayText = json['EstimateDisplayText'] != null
        ? new Bid.fromJson(json['EstimateDisplayText'])
        : null;
    openingBid = json['OpeningBid'] != null
        ? new Bid.fromJson(json['OpeningBid'])
        : null;
    detailInfo = json['DetailInfo'];
    additionalInfo = json['AdditionalInfo'];
    remainTimeObj = json['remainTimeObj'];
    remainingSecondsInNumber = json['remainingSecondsInNumber'];
    lastStatus = json['LastStatus'];
    auctionStatus = json['AuctionStatus'];
    thumbImage = json['ThumbImage'];
    currentBid = json['CurrentBid'];
    currentBidUS = json['CurrentBid_US'];
    artistName = json['ArtistName'];
    type = json['Type'];
    productsize = json['productsize'];
    medium = json['Medium'];
    year = json['Year'];
    estimateToLegacy = json['EstimateTo_Legacy'];
    estimateFromLegacy = json['EstimateFrom_Legacy'];
    estimateToLegacyINR = json['EstimateTo_Legacy_INR'];
    estimateFromLegacyINR = json['EstimateFrom_Legacy_INR'];
    bidIncrementPercentage = json['BidIncrementPercentage'];
    info = json['Info'] != null ? new Info.fromJson(json['Info']) : null;
    bidincrement = json['Bidincrement'];
    auctionType = json['AuctionType'];
    auctionDated = json['AuctionDated'];
    isHistorical = json['isHistorical'];
    dollarRate = json['DollarRate'];
    description = json['Description'];
    artistImage = json['ArtistImage'];
    artistDesc = json['ArtistDesc'];
    auctionDate = json['AuctionDate'];
    auctionMargin = json['AuctionMargin'];
    lotCount = json['LotCount'];
    remainingSecondsFrom = json['RemainingSecondsFrom'];
    paginationSize = json['PaginationSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuctionId'] = this.auctionId;
    data['LotId'] = this.lotId;
    data['AuctionInventoryPID'] = this.auctionInventoryPID;
    data['ExportType'] = this.exportType;
    data['BidCount'] = this.bidCount;
    data['LotDesc'] = this.lotDesc;
    data['Category'] = this.category;
    data['LotDetDesc'] = this.lotDetDesc;
    data['CategoryID'] = this.categoryID;
    data['LotURL'] = this.lotURL;
    data['LotNumber'] = this.lotNumber;
    if (this.leadingUser != null) {
      data['LeadingUser'] = this.leadingUser!.toJson();
    }
    if (this.liveStatus != null) {
      data['LiveStatus'] = this.liveStatus!.toJson();
    }
    data['Url3D'] = this.url3D;
    if (this.images != null) {
      data['Images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['LotTitle'] = this.lotTitle;
    data['IsLiked'] = this.isLiked;
    if (this.proxyStatus != null) {
      data['ProxyStatus'] = this.proxyStatus!.toJson();
    }
    if (this.bidAccess != null) {
      data['BidAccess'] = this.bidAccess!.toJson();
    }
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
    data['DetailInfo'] = this.detailInfo;
    data['AdditionalInfo'] = this.additionalInfo;
    data['remainTimeObj'] = this.remainTimeObj;
    data['remainingSecondsInNumber'] = this.remainingSecondsInNumber;
    data['LastStatus'] = this.lastStatus;
    data['AuctionStatus'] = this.auctionStatus;
    data['ThumbImage'] = this.thumbImage;
    data['CurrentBid'] = this.currentBid;
    data['CurrentBid_US'] = this.currentBidUS;
    data['ArtistName'] = this.artistName;
    data['Type'] = this.type;
    data['productsize'] = this.productsize;
    data['Medium'] = this.medium;
    data['Year'] = this.year;
    data['EstimateTo_Legacy'] = this.estimateToLegacy;
    data['EstimateFrom_Legacy'] = this.estimateFromLegacy;
    data['EstimateTo_Legacy_INR'] = this.estimateToLegacyINR;
    data['EstimateFrom_Legacy_INR'] = this.estimateFromLegacyINR;
    data['BidIncrementPercentage'] = this.bidIncrementPercentage;
    if (this.info != null) {
      data['Info'] = this.info!.toJson();
    }
    data['Bidincrement'] = this.bidincrement;
    data['AuctionType'] = this.auctionType;
    data['AuctionDated'] = this.auctionDated;
    data['isHistorical'] = this.isHistorical;
    data['DollarRate'] = this.dollarRate;
    data['Description'] = this.description;
    data['ArtistImage'] = this.artistImage;
    data['ArtistDesc'] = this.artistDesc;
    data['AuctionDate'] = this.auctionDate;
    data['AuctionMargin'] = this.auctionMargin;
    data['LotCount'] = this.lotCount;
    data['RemainingSecondsFrom'] = this.remainingSecondsFrom;
    data['PaginationSize'] = this.paginationSize;
    return data;
  }
}

class LeadingUser {
  String? id;
  Bid? bid;
  String? notes;

  LeadingUser({this.id, this.bid, this.notes});

  LeadingUser.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    bid = json['Bid'] != null ? new Bid.fromJson(json['Bid']) : null;
    notes = json['Notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    if (this.bid != null) {
      data['Bid'] = this.bid!.toJson();
    }
    data['Notes'] = this.notes;
    return data;
  }
}

class Bid {
  String? iNR;
  String? uSD;

  Bid({this.iNR, this.uSD});

  Bid.fromJson(Map<String, dynamic> json) {
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

class LiveStatus {
  String? remainingSeconds;
  Bid? currentBid;
  Bid? nextValidBid;
  List<Bid>? next5ValidBid;
  String? status;
  String? isOutBid;

  LiveStatus(
      {this.remainingSeconds,
        this.currentBid,
        this.nextValidBid,
        this.next5ValidBid,
        this.status,
        this.isOutBid});

  LiveStatus.fromJson(Map<String, dynamic> json) {
    remainingSeconds = json['remainingSeconds'];
    currentBid = json['CurrentBid'] != null
        ? new Bid.fromJson(json['CurrentBid'])
        : null;
    nextValidBid = json['NextValidBid'] != null
        ? new Bid.fromJson(json['NextValidBid'])
        : null;
    if (json['Next5ValidBid'] != null) {
      next5ValidBid = <Bid>[];
      json['Next5ValidBid'].forEach((v) {
        next5ValidBid!.add(new Bid.fromJson(v));
      });
    }
    status = json['Status'];
    isOutBid = json['IsOutBid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remainingSeconds'] = this.remainingSeconds;
    if (this.currentBid != null) {
      data['CurrentBid'] = this.currentBid!.toJson();
    }
    if (this.nextValidBid != null) {
      data['NextValidBid'] = this.nextValidBid!.toJson();
    }
    if (this.next5ValidBid != null) {
      data['Next5ValidBid'] =
          this.next5ValidBid!.map((v) => v.toJson()).toList();
    }
    data['Status'] = this.status;
    data['IsOutBid'] = this.isOutBid;
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

class ProxyStatus {
  dynamic id;
  String? status;
  dynamic? maxProxyAmount;
  Bid? proxyAmount;

  ProxyStatus({this.id, this.status, this.maxProxyAmount, this.proxyAmount});

  ProxyStatus.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    status = json['Status'];
    maxProxyAmount = json['MaxProxyAmount'];
    proxyAmount = json['ProxyAmount'] != null
        ? new Bid.fromJson(json['ProxyAmount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Status'] = this.status;
    data['MaxProxyAmount'] = this.maxProxyAmount;
    if (this.proxyAmount != null) {
      data['ProxyAmount'] = this.proxyAmount!.toJson();
    }
    return data;
  }
}

class BidAccess {
  String? access;
  String? reason;

  BidAccess({this.access, this.reason});

  BidAccess.fromJson(Map<String, dynamic> json) {
    access = json['Access'];
    reason = json['Reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Access'] = this.access;
    data['Reason'] = this.reason;
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
