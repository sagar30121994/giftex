class CreateArtRequestModel {
  String? authkeyWeb;
  String? authkeyMobile;
  String? userid;
  List<MyCollectonArts>? myCollectonArts;

  CreateArtRequestModel(
      {this.authkeyWeb, this.authkeyMobile, this.userid, this.myCollectonArts});

  CreateArtRequestModel.fromJson(Map<String, dynamic> json) {
    authkeyWeb = json['authkey_web'];
    authkeyMobile = json['authkey_mobile'];
    userid = json['userid'];
    if (json['myCollectonArts'] != null) {
      myCollectonArts = <MyCollectonArts>[];
      json['myCollectonArts'].forEach((v) {
        myCollectonArts!.add(new MyCollectonArts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authkey_web'] = this.authkeyWeb;
    data['authkey_mobile'] = this.authkeyMobile;
    data['userid'] = this.userid;
    if (this.myCollectonArts != null) {
      data['myCollectonArts'] =
          this.myCollectonArts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyCollectonArts {
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

  MyCollectonArts(
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

  MyCollectonArts.fromJson(Map<String, dynamic> json) {
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
