class GetArtsRequestMdel {
  int? colectionArtId;
  int? collectionId;
  String? artistName;
  String? imagePath;
  String? fullImagePath;
  String? artCaption;
  String? artDescription;
  String? artWidth;
  String? artHeight;
  String? estimateFrom;
  String? estimateTo;
  bool? isActive;
  bool? isDelete;
  String? createdOn;
  int? createdBy;
  String? modifiedOn;
  int? modifiedBy;
  bool? isConsignmentAssigned;

  GetArtsRequestMdel(
      {this.colectionArtId,
        this.collectionId,
        this.artistName,
        this.imagePath,
        this.fullImagePath,
        this.artCaption,
        this.artDescription,
        this.artWidth,
        this.artHeight,
        this.estimateFrom,
        this.estimateTo,
        this.isActive,
        this.isDelete,
        this.createdOn,
        this.createdBy,
        this.modifiedOn,
        this.modifiedBy,
        this.isConsignmentAssigned});

  GetArtsRequestMdel.fromJson(Map<String, dynamic> json) {
    colectionArtId = json['Colection_Art_Id'];
    collectionId = json['CollectionId'];
    artistName = json['Artist_Name'];
    imagePath = json['Image_Path'];
    fullImagePath = json['FullImagePath'];
    artCaption = json['Art_caption'];
    artDescription = json['Art_Description'];
    artWidth = json['Art_width'];
    artHeight = json['Art_height'];
    estimateFrom = json['Estimate_from'];
    estimateTo = json['Estimate_to'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    createdOn = json['CreatedOn'];
    createdBy = json['CreatedBy'];
    modifiedOn = json['ModifiedOn'];
    modifiedBy = json['ModifiedBy'];
    isConsignmentAssigned = json['IsConsignmentAssigned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Colection_Art_Id'] = this.colectionArtId;
    data['CollectionId'] = this.collectionId;
    data['Artist_Name'] = this.artistName;
    data['Image_Path'] = this.imagePath;
    data['FullImagePath'] = this.fullImagePath;
    data['Art_caption'] = this.artCaption;
    data['Art_Description'] = this.artDescription;
    data['Art_width'] = this.artWidth;
    data['Art_height'] = this.artHeight;
    data['Estimate_from'] = this.estimateFrom;
    data['Estimate_to'] = this.estimateTo;
    data['IsActive'] = this.isActive;
    data['IsDelete'] = this.isDelete;
    data['CreatedOn'] = this.createdOn;
    data['CreatedBy'] = this.createdBy;
    data['ModifiedOn'] = this.modifiedOn;
    data['ModifiedBy'] = this.modifiedBy;
    data['IsConsignmentAssigned'] = this.isConsignmentAssigned;
    return data;
  }
}
