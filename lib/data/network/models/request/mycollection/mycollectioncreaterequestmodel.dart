class CreateCollectionRequestmodel {
  int? collectionId;
  String? collectionName;
  int? userId;
  bool? isActive;
  bool? isDelete;
  String? createdOn;
  int? createdBy;
  String? modifiedOn;
  int? modifiedBy;

  CreateCollectionRequestmodel(
      {this.collectionId,
        this.collectionName,
        this.userId,
        this.isActive,
        this.isDelete,
        this.createdOn,
        this.createdBy,
        this.modifiedOn,
        this.modifiedBy});

  CreateCollectionRequestmodel.fromJson(Map<String, dynamic> json) {
    collectionId = json['CollectionId'];
    collectionName = json['CollectionName'];
    userId = json['UserId'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    createdOn = json['CreatedOn'];
    createdBy = json['CreatedBy'];
    modifiedOn = json['ModifiedOn'];
    modifiedBy = json['ModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CollectionId'] = this.collectionId;
    data['CollectionName'] = this.collectionName;
    data['UserId'] = this.userId;
    data['IsActive'] = this.isActive;
    data['IsDelete'] = this.isDelete;
    data['CreatedOn'] = this.createdOn;
    data['CreatedBy'] = this.createdBy;
    data['ModifiedOn'] = this.modifiedOn;
    data['ModifiedBy'] = this.modifiedBy;
    return data;
  }
}
