class AutionResultResponse {
  dynamic totalWinning;
  dynamic totalWinningUS;
  dynamic totalLots;
  dynamic totalSoldLots;
  dynamic totalSoldLotsPerCentage;
  dynamic lotsSoldAboveEstimate;
  dynamic lotsSoldAboveEstimatePerCentage;
  List<LotsResult>? lots;

  AutionResultResponse(
      {this.totalWinning,
      this.totalWinningUS,
      this.totalLots,
      this.totalSoldLots,
      this.totalSoldLotsPerCentage,
      this.lotsSoldAboveEstimate,
      this.lotsSoldAboveEstimatePerCentage,
      this.lots});

  AutionResultResponse.fromJson(Map<String, dynamic> json) {
    totalWinning = json['TotalWinning'];
    totalWinningUS = json['TotalWinning_US'];
    totalLots = json['TotalLots'];
    totalSoldLots = json['TotalSoldLots'];
    totalSoldLotsPerCentage = json['TotalSoldLotsPerCentage'];
    lotsSoldAboveEstimate = json['LotsSoldAboveEstimate'];
    lotsSoldAboveEstimatePerCentage = json['LotsSoldAboveEstimatePerCentage'];
    if (json['Lots'] != null) {
      lots = <LotsResult>[];
      json['Lots'].forEach((v) {
        lots!.add(new LotsResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalWinning'] = this.totalWinning;
    data['TotalWinning_US'] = this.totalWinningUS;
    data['TotalLots'] = this.totalLots;
    data['TotalSoldLots'] = this.totalSoldLots;
    data['TotalSoldLotsPerCentage'] = this.totalSoldLotsPerCentage;
    data['LotsSoldAboveEstimate'] = this.lotsSoldAboveEstimate;
    data['LotsSoldAboveEstimatePerCentage'] = this.lotsSoldAboveEstimatePerCentage;
    if (this.lots != null) {
      data['Lots'] = this.lots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LotsResult {
  dynamic? lotId;
  dynamic? isSold;
  dynamic? estimateInRs;
  dynamic? estimateInUs;
  String? estimateInRsStr;
  String? estimateInUsStr;
  dynamic winningValue;
  dynamic? winningValueUs;
  String? lotNo;
  String? artistName;
  String? title;
  dynamic? amount;
  dynamic? amountUS;
  String? thumbnail;
  String? category;
  String? auctionName;
  String? auctionDate;

  LotsResult(
      {this.lotId,
      this.isSold,
      this.estimateInRs,
      this.estimateInUs,
      this.estimateInRsStr,
      this.estimateInUsStr,
      this.winningValue,
      this.winningValueUs,
      this.lotNo,
      this.artistName,
      this.title,
      this.amount,
      this.amountUS,
      this.thumbnail,
      this.category,
      this.auctionName,
      this.auctionDate});

  LotsResult.fromJson(Map<String, dynamic> json) {
    lotId = json['LotId'];
    isSold = json['IsSold'];
    estimateInRs = json['EstimateInRs'];
    estimateInUs = json['EstimateInUs'];
    estimateInRsStr = json['EstimateInRsStr'];
    estimateInUsStr = json['EstimateInUsStr'];
    winningValue = json['WinningValue'];
    winningValueUs = json['WinningValueUs'];
    lotNo = json['LotNo'];
    artistName = json['ArtistName'];
    title = json['Title'];
    amount = json['Amount'];
    amountUS = json['Amount_US'];
    thumbnail = json['thumbnail'];
    category = json['category'];
    auctionName = json['AuctionName'];
    auctionDate = json['AuctionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LotId'] = this.lotId;
    data['IsSold'] = this.isSold;
    data['EstimateInRs'] = this.estimateInRs;
    data['EstimateInUs'] = this.estimateInUs;
    data['EstimateInRsStr'] = this.estimateInRsStr;
    data['EstimateInUsStr'] = this.estimateInUsStr;
    data['WinningValue'] = this.winningValue;
    data['WinningValueUs'] = this.winningValueUs;
    data['LotNo'] = this.lotNo;
    data['ArtistName'] = this.artistName;
    data['Title'] = this.title;
    data['Amount'] = this.amount;
    data['Amount_US'] = this.amountUS;
    data['thumbnail'] = this.thumbnail;
    data['category'] = this.category;
    data['AuctionName'] = this.auctionName;
    data['AuctionDate'] = this.auctionDate;
    return data;
  }
}
