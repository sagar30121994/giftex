class MyPurchaseReponse {
  List<Data>? data;

  MyPurchaseReponse({this.data});

  MyPurchaseReponse.fromJson(List<dynamic> json) {
    if (json != null) {
      data = <Data>[];
      json.forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  Lot? lot;
  String? orderNumber;
  dynamic? lotID;
  dynamic? completedStage;
  String? deliveryDate;
  String? clientID;
  Address? address;
  dynamic? buyerBankName;
  String? clientEmailid;
  String? mobilenumber;
  String? clientName;
  dynamic? invoiceUploadFile;
  dynamic? buyerInvoiceTotalAmountUSD;
  String? title;
  String? itemImagesURL;
  String? artistName;
  dynamic? productsize;
  String? auctionSeqReferenceNo;
  String? auctionMargin;
  dynamic? buyerPkeyID;
  String? buyerInvoiceNo;
  String? buyerInventoryId;
  String? buyerLotNo;
  dynamic? buyerCustomerId;
  String? buyerInvoiceDate;
  String? buyerInvoicePaymentStatus;
  dynamic? buyerInvoiceItemName;
  String? buyerHSNCode;
  dynamic? buyerInvoiceUploadFile;
  dynamic? buyerInvoiceFileName;
  dynamic? buyerInvoiceQty;
  dynamic? buyerInvoiceAmount;
  dynamic? buyerInvoiceCGST;
  dynamic? buyerInvoiceSGST;
  dynamic? buyerInvoiceIGST;
  dynamic? buyerInvoiceCGSTPer;
  dynamic? buyerInvoiceSGSTPer;
  dynamic? buyerInvoiceIGSTPer;
  dynamic? buyerInvoiceTotalAmount;
  dynamic? buyerNonTaxAmount;
  dynamic? buyerInvoiceTaxableAount;
  bool? buyerInvoiceTcsAplicable;
  dynamic? buyerInvoiceTcsAplicablePer;
  dynamic? buyerInvoiceTcsAplicableValue;
  dynamic? buyerInvoicePaymentTerms;
  dynamic? buyerBankDetails;
  dynamic? invoiceIRNNo;
  dynamic? invoiceACKNo;
  dynamic? buyerTaxInvoiceNo;
  List<SubItemList>? subItemList;

  Data(
      {this.lot,
      this.orderNumber,
      this.lotID,
      this.completedStage,
      this.deliveryDate,
      this.clientID,
      this.address,
      this.buyerBankName,
      this.clientEmailid,
      this.mobilenumber,
      this.clientName,
      this.invoiceUploadFile,
      this.buyerInvoiceTotalAmountUSD,
      this.title,
      this.itemImagesURL,
      this.artistName,
      this.productsize,
      this.auctionSeqReferenceNo,
      this.auctionMargin,
      this.buyerPkeyID,
      this.buyerInvoiceNo,
      this.buyerInventoryId,
      this.buyerLotNo,
      this.buyerCustomerId,
      this.buyerInvoiceDate,
      this.buyerInvoicePaymentStatus,
      this.buyerInvoiceItemName,
      this.buyerHSNCode,
      this.buyerInvoiceUploadFile,
      this.buyerInvoiceFileName,
      this.buyerInvoiceQty,
      this.buyerInvoiceAmount,
      this.buyerInvoiceCGST,
      this.buyerInvoiceSGST,
      this.buyerInvoiceIGST,
      this.buyerInvoiceCGSTPer,
      this.buyerInvoiceSGSTPer,
      this.buyerInvoiceIGSTPer,
      this.buyerInvoiceTotalAmount,
      this.buyerNonTaxAmount,
      this.buyerInvoiceTaxableAount,
      this.buyerInvoiceTcsAplicable,
      this.buyerInvoiceTcsAplicablePer,
      this.buyerInvoiceTcsAplicableValue,
      this.buyerInvoicePaymentTerms,
      this.buyerBankDetails,
      this.invoiceIRNNo,
      this.invoiceACKNo,
      this.buyerTaxInvoiceNo,
      this.subItemList});

  Data.fromJson(Map<String, dynamic> json) {
    lot = json['lot'] != null ? new Lot.fromJson(json['lot']) : null;
    orderNumber = json['OrderNumber'];
    lotID = json['Lot_ID'];
    completedStage = json['CompletedStage'];
    deliveryDate = json['DeliveryDate'];
    clientID = json['ClientID'];
    address = json['Address'] != null ? new Address.fromJson(json['Address']) : null;
    buyerBankName = json['Buyer_BankName'];
    clientEmailid = json['ClientEmailid'];
    mobilenumber = json['Mobilenumber'];
    clientName = json['ClientName'];
    invoiceUploadFile = json['Invoice_UploadFile'];
    buyerInvoiceTotalAmountUSD = json['Buyer_Invoice_TotalAmount_USD'];
    title = json['Title'];
    itemImagesURL = json['ItemImagesURL'];
    artistName = json['ArtistName'];
    productsize = json['productsize'];
    auctionSeqReferenceNo = json['auctionSeq_ReferenceNo'];
    auctionMargin = json['auction_Margin'];
    buyerPkeyID = json['Buyer_Pkey_ID'];
    buyerInvoiceNo = json['Buyer_InvoiceNo'];
    buyerInventoryId = json['Buyer_Inventory_Id'];
    buyerLotNo = json['Buyer_LotNo'];
    buyerCustomerId = json['Buyer_CustomerId'];
    buyerInvoiceDate = json['Buyer_Invoice_Date'];
    buyerInvoicePaymentStatus = json['Buyer_Invoice_PaymentStatus'];
    buyerInvoiceItemName = json['Buyer_Invoice_ItemName'];
    buyerHSNCode = json['Buyer_HSN_Code'];
    buyerInvoiceUploadFile = json['Buyer_Invoice_UploadFile'];
    buyerInvoiceFileName = json['Buyer_Invoice_FileName'];
    buyerInvoiceQty = json['Buyer_Invoice_Qty'];
    buyerInvoiceAmount = json['Buyer_Invoice_Amount'];
    buyerInvoiceCGST = json['Buyer_Invoice_CGST'];
    buyerInvoiceSGST = json['Buyer_Invoice_SGST'];
    buyerInvoiceIGST = json['Buyer_Invoice_IGST'];
    buyerInvoiceCGSTPer = json['Buyer_Invoice_CGST_Per'];
    buyerInvoiceSGSTPer = json['Buyer_Invoice_SGST_Per'];
    buyerInvoiceIGSTPer = json['Buyer_Invoice_IGST_Per'];
    buyerInvoiceTotalAmount = json['Buyer_Invoice_TotalAmount'];
    buyerNonTaxAmount = json['Buyer_NonTaxAmount'];
    buyerInvoiceTaxableAount = json['Buyer_Invoice_TaxableAount'];
    buyerInvoiceTcsAplicable = json['Buyer_Invoice_TcsAplicable'];
    buyerInvoiceTcsAplicablePer = json['Buyer_Invoice_TcsAplicable_Per'];
    buyerInvoiceTcsAplicableValue = json['Buyer_Invoice_TcsAplicable_Value'];
    buyerInvoicePaymentTerms = json['Buyer_Invoice_PaymentTerms'];
    buyerBankDetails = json['Buyer_BankDetails'];
    invoiceIRNNo = json['Invoice_IRNNo'];
    invoiceACKNo = json['Invoice_ACKNo'];
    buyerTaxInvoiceNo = json['Buyer_TaxInvoiceNo'];
    if (json['subItemList'] != null) {
      subItemList = <SubItemList>[];
      json['subItemList'].forEach((v) {
        subItemList!.add(new SubItemList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lot != null) {
      data['lot'] = this.lot!.toJson();
    }
    data['OrderNumber'] = this.orderNumber;
    data['Lot_ID'] = this.lotID;
    data['CompletedStage'] = this.completedStage;
    data['DeliveryDate'] = this.deliveryDate;
    data['ClientID'] = this.clientID;
    if (this.address != null) {
      data['Address'] = this.address!.toJson();
    }
    data['Buyer_BankName'] = this.buyerBankName;
    data['ClientEmailid'] = this.clientEmailid;
    data['Mobilenumber'] = this.mobilenumber;
    data['ClientName'] = this.clientName;
    data['Invoice_UploadFile'] = this.invoiceUploadFile;
    data['Buyer_Invoice_TotalAmount_USD'] = this.buyerInvoiceTotalAmountUSD;
    data['Title'] = this.title;
    data['ItemImagesURL'] = this.itemImagesURL;
    data['ArtistName'] = this.artistName;
    data['productsize'] = this.productsize;
    data['auctionSeq_ReferenceNo'] = this.auctionSeqReferenceNo;
    data['auction_Margin'] = this.auctionMargin;
    data['Buyer_Pkey_ID'] = this.buyerPkeyID;
    data['Buyer_InvoiceNo'] = this.buyerInvoiceNo;
    data['Buyer_Inventory_Id'] = this.buyerInventoryId;
    data['Buyer_LotNo'] = this.buyerLotNo;
    data['Buyer_CustomerId'] = this.buyerCustomerId;
    data['Buyer_Invoice_Date'] = this.buyerInvoiceDate;
    data['Buyer_Invoice_PaymentStatus'] = this.buyerInvoicePaymentStatus;
    data['Buyer_Invoice_ItemName'] = this.buyerInvoiceItemName;
    data['Buyer_HSN_Code'] = this.buyerHSNCode;
    data['Buyer_Invoice_UploadFile'] = this.buyerInvoiceUploadFile;
    data['Buyer_Invoice_FileName'] = this.buyerInvoiceFileName;
    data['Buyer_Invoice_Qty'] = this.buyerInvoiceQty;
    data['Buyer_Invoice_Amount'] = this.buyerInvoiceAmount;
    data['Buyer_Invoice_CGST'] = this.buyerInvoiceCGST;
    data['Buyer_Invoice_SGST'] = this.buyerInvoiceSGST;
    data['Buyer_Invoice_IGST'] = this.buyerInvoiceIGST;
    data['Buyer_Invoice_CGST_Per'] = this.buyerInvoiceCGSTPer;
    data['Buyer_Invoice_SGST_Per'] = this.buyerInvoiceSGSTPer;
    data['Buyer_Invoice_IGST_Per'] = this.buyerInvoiceIGSTPer;
    data['Buyer_Invoice_TotalAmount'] = this.buyerInvoiceTotalAmount;
    data['Buyer_NonTaxAmount'] = this.buyerNonTaxAmount;
    data['Buyer_Invoice_TaxableAount'] = this.buyerInvoiceTaxableAount;
    data['Buyer_Invoice_TcsAplicable'] = this.buyerInvoiceTcsAplicable;
    data['Buyer_Invoice_TcsAplicable_Per'] = this.buyerInvoiceTcsAplicablePer;
    data['Buyer_Invoice_TcsAplicable_Value'] = this.buyerInvoiceTcsAplicableValue;
    data['Buyer_Invoice_PaymentTerms'] = this.buyerInvoicePaymentTerms;
    data['Buyer_BankDetails'] = this.buyerBankDetails;
    data['Invoice_IRNNo'] = this.invoiceIRNNo;
    data['Invoice_ACKNo'] = this.invoiceACKNo;
    data['Buyer_TaxInvoiceNo'] = this.buyerTaxInvoiceNo;
    if (this.subItemList != null) {
      data['subItemList'] = this.subItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lot {
  String? auctionId;
  String? lotId;
  dynamic? auctionInventoryPID;
  String? exportType;
  String? bidCount;
  String? lotDesc;
  String? category;
  dynamic? lotDetDesc;
  dynamic? categoryID;
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
  dynamic? detailInfo;
  dynamic? additionalInfo;
  dynamic? remadynamicimeObj;
  dynamic? remainingSecondsInNumber;
  dynamic? lastStatus;
  String? auctionStatus;
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
  Bidincrement? bidincrement;
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

  Lot(
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
      this.remadynamicimeObj,
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

  Lot.fromJson(Map<String, dynamic> json) {
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
    leadingUser = json['LeadingUser'] != null ? new LeadingUser.fromJson(json['LeadingUser']) : null;
    liveStatus = json['LiveStatus'] != null ? new LiveStatus.fromJson(json['LiveStatus']) : null;
    url3D = json['Url3D'];
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    lotTitle = json['LotTitle'];
    isLiked = json['IsLiked'];
    proxyStatus = json['ProxyStatus'] != null ? new ProxyStatus.fromJson(json['ProxyStatus']) : null;
    bidAccess = json['BidAccess'] != null ? new BidAccess.fromJson(json['BidAccess']) : null;
    status = json['Status'];
    estimateFrom = json['EstimateFrom'] != null ? new Bid.fromJson(json['EstimateFrom']) : null;
    estimateTo = json['EstimateTo'] != null ? new Bid.fromJson(json['EstimateTo']) : null;
    estimateDisplayText = json['EstimateDisplayText'] != null ? new Bid.fromJson(json['EstimateDisplayText']) : null;
    openingBid = json['OpeningBid'] != null ? new Bid.fromJson(json['OpeningBid']) : null;
    detailInfo = json['DetailInfo'];
    additionalInfo = json['AdditionalInfo'];
    remadynamicimeObj = json['remadynamicimeObj'];
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
    bidincrement = json['Bidincrement'] != null ? new Bidincrement.fromJson(json['Bidincrement']) : null;
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
    data['remadynamicimeObj'] = this.remadynamicimeObj;
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
    if (this.bidincrement != null) {
      data['Bidincrement'] = this.bidincrement!.toJson();
    }
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

class Next5ValidBid {
  String? iNR;
  String? uSD;

  Next5ValidBid({this.iNR, this.uSD});

  Next5ValidBid.fromJson(Map<String, dynamic> json) {
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
  List<Next5ValidBid>? next5ValidBid;
  String? status;
  String? isOutBid;

  LiveStatus(
      {this.remainingSeconds, this.currentBid, this.nextValidBid, this.next5ValidBid, this.status, this.isOutBid});

  LiveStatus.fromJson(Map<String, dynamic> json) {
    remainingSeconds = json['remainingSeconds'];
    currentBid = json['CurrentBid'] != null ? new Bid.fromJson(json['CurrentBid']) : null;
    nextValidBid = json['NextValidBid'] != null ? new Bid.fromJson(json['NextValidBid']) : null;
    if (json['Next5ValidBid'] != null) {
      next5ValidBid = <Next5ValidBid>[];
      json['Next5ValidBid'].forEach((v) {
        next5ValidBid!.add(new Next5ValidBid.fromJson(v));
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
      data['Next5ValidBid'] = this.next5ValidBid!.map((v) => v.toJson()).toList();
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
  String? id;
  String? status;
  dynamic? maxProxyAmount;
  Bid? proxyAmount;

  ProxyStatus({this.id, this.status, this.maxProxyAmount, this.proxyAmount});

  ProxyStatus.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    status = json['Status'];
    maxProxyAmount = json['MaxProxyAmount'];
    proxyAmount = json['ProxyAmount'] != null ? new Bid.fromJson(json['ProxyAmount']) : null;
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

class Bidincrement {
  dynamic? below;
  dynamic? above;

  Bidincrement({this.below, this.above});

  Bidincrement.fromJson(Map<String, dynamic> json) {
    below = json['below'];
    above = json['above'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['below'] = this.below;
    data['above'] = this.above;
    return data;
  }
}

class Address {
  String? clientId;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? pincode;
  String? country;
  String? state;
  String? city;
  dynamic? isActive;
  dynamic? id;
  String? billingAddressName;
  String? gSTnumber;

  Address(
      {this.clientId,
      this.addressType,
      this.addressLine1,
      this.addressLine2,
      this.landmark,
      this.pincode,
      this.country,
      this.state,
      this.city,
      this.isActive,
      this.id,
      this.billingAddressName,
      this.gSTnumber});

  Address.fromJson(Map<String, dynamic> json) {
    clientId = json['ClientId'];
    addressType = json['AddressType'];
    addressLine1 = json['AddressLine1'];
    addressLine2 = json['AddressLine2'];
    landmark = json['Landmark'];
    pincode = json['Pincode'];
    country = json['Country'];
    state = json['State'];
    city = json['City'];
    isActive = json['IsActive'];
    id = json['Id'];
    billingAddressName = json['BillingAddressName'];
    gSTnumber = json['GSTnumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClientId'] = this.clientId;
    data['AddressType'] = this.addressType;
    data['AddressLine1'] = this.addressLine1;
    data['AddressLine2'] = this.addressLine2;
    data['Landmark'] = this.landmark;
    data['Pincode'] = this.pincode;
    data['Country'] = this.country;
    data['State'] = this.state;
    data['City'] = this.city;
    data['IsActive'] = this.isActive;
    data['Id'] = this.id;
    data['BillingAddressName'] = this.billingAddressName;
    data['GSTnumber'] = this.gSTnumber;
    return data;
  }
}

class SubItemList {
  String? key;
  dynamic? value;

  SubItemList({this.key, this.value});

  SubItemList.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Key'] = this.key;
    data['Value'] = this.value;
    return data;
  }
}
