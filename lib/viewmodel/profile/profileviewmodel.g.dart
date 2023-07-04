// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModel, Store {
  late final _$isloadingAtom =
      Atom(name: '_ProfileViewModel.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$getUserAllDetailsResponseAtom = Atom(
      name: '_ProfileViewModel.getUserAllDetailsResponse', context: context);

  @override
  GetUserAllDetailsResponse? get getUserAllDetailsResponse {
    _$getUserAllDetailsResponseAtom.reportRead();
    return super.getUserAllDetailsResponse;
  }

  @override
  set getUserAllDetailsResponse(GetUserAllDetailsResponse? value) {
    _$getUserAllDetailsResponseAtom
        .reportWrite(value, super.getUserAllDetailsResponse, () {
      super.getUserAllDetailsResponse = value;
    });
  }

  late final _$myPurchaseReponseAtom =
      Atom(name: '_ProfileViewModel.myPurchaseReponse', context: context);

  @override
  MyPurchaseReponse? get myPurchaseReponse {
    _$myPurchaseReponseAtom.reportRead();
    return super.myPurchaseReponse;
  }

  @override
  set myPurchaseReponse(MyPurchaseReponse? value) {
    _$myPurchaseReponseAtom.reportWrite(value, super.myPurchaseReponse, () {
      super.myPurchaseReponse = value;
    });
  }

  late final _$myAuctionGalleryResponceAtom = Atom(
      name: '_ProfileViewModel.myAuctionGalleryResponce', context: context);

  @override
  MyAuctionGalleryResponce? get myAuctionGalleryResponce {
    _$myAuctionGalleryResponceAtom.reportRead();
    return super.myAuctionGalleryResponce;
  }

  @override
  set myAuctionGalleryResponce(MyAuctionGalleryResponce? value) {
    _$myAuctionGalleryResponceAtom
        .reportWrite(value, super.myAuctionGalleryResponce, () {
      super.myAuctionGalleryResponce = value;
    });
  }

  late final _$dashboradOverviewResponseAtom = Atom(
      name: '_ProfileViewModel.dashboradOverviewResponse', context: context);

  @override
  DashboradOverviewResponse? get dashboradOverviewResponse {
    _$dashboradOverviewResponseAtom.reportRead();
    return super.dashboradOverviewResponse;
  }

  @override
  set dashboradOverviewResponse(DashboradOverviewResponse? value) {
    _$dashboradOverviewResponseAtom
        .reportWrite(value, super.dashboradOverviewResponse, () {
      super.dashboradOverviewResponse = value;
    });
  }

  late final _$getLastBidsResponceAtom =
      Atom(name: '_ProfileViewModel.getLastBidsResponce', context: context);

  @override
  GetLastBidsResponce? get getLastBidsResponce {
    _$getLastBidsResponceAtom.reportRead();
    return super.getLastBidsResponce;
  }

  @override
  set getLastBidsResponce(GetLastBidsResponce? value) {
    _$getLastBidsResponceAtom.reportWrite(value, super.getLastBidsResponce, () {
      super.getLastBidsResponce = value;
    });
  }

  late final _$dobAtom = Atom(name: '_ProfileViewModel.dob', context: context);

  @override
  String get dob {
    _$dobAtom.reportRead();
    return super.dob;
  }

  @override
  set dob(String value) {
    _$dobAtom.reportWrite(value, super.dob, () {
      super.dob = value;
    });
  }

  late final _$gendorAtom =
      Atom(name: '_ProfileViewModel.gendor', context: context);

  @override
  String get gendor {
    _$gendorAtom.reportRead();
    return super.gendor;
  }

  @override
  set gendor(String value) {
    _$gendorAtom.reportWrite(value, super.gendor, () {
      super.gendor = value;
    });
  }

  late final _$panNoAtom =
      Atom(name: '_ProfileViewModel.panNo', context: context);

  @override
  String get panNo {
    _$panNoAtom.reportRead();
    return super.panNo;
  }

  @override
  set panNo(String value) {
    _$panNoAtom.reportWrite(value, super.panNo, () {
      super.panNo = value;
    });
  }

  late final _$aadharNoAtom =
      Atom(name: '_ProfileViewModel.aadharNo', context: context);

  @override
  String get aadharNo {
    _$aadharNoAtom.reportRead();
    return super.aadharNo;
  }

  @override
  set aadharNo(String value) {
    _$aadharNoAtom.reportWrite(value, super.aadharNo, () {
      super.aadharNo = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_ProfileViewModel.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$_ProfileViewModelActionController =
      ActionController(name: '_ProfileViewModel', context: context);

  @override
  dynamic setDOB(dynamic sdob) {
    final _$actionInfo = _$_ProfileViewModelActionController.startAction(
        name: '_ProfileViewModel.setDOB');
    try {
      return super.setDOB(sdob);
    } finally {
      _$_ProfileViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setgendor(dynamic sgendor) {
    final _$actionInfo = _$_ProfileViewModelActionController.startAction(
        name: '_ProfileViewModel.setgendor');
    try {
      return super.setgendor(sgendor);
    } finally {
      _$_ProfileViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setpanNo(dynamic spanNo) {
    final _$actionInfo = _$_ProfileViewModelActionController.startAction(
        name: '_ProfileViewModel.setpanNo');
    try {
      return super.setpanNo(spanNo);
    } finally {
      _$_ProfileViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setaadharNo(dynamic saadharNo) {
    final _$actionInfo = _$_ProfileViewModelActionController.startAction(
        name: '_ProfileViewModel.setaadharNo');
    try {
      return super.setaadharNo(saadharNo);
    } finally {
      _$_ProfileViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setaddress(dynamic saddress) {
    final _$actionInfo = _$_ProfileViewModelActionController.startAction(
        name: '_ProfileViewModel.setaddress');
    try {
      return super.setaddress(saddress);
    } finally {
      _$_ProfileViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
getUserAllDetailsResponse: ${getUserAllDetailsResponse},
myPurchaseReponse: ${myPurchaseReponse},
myAuctionGalleryResponce: ${myAuctionGalleryResponce},
dashboradOverviewResponse: ${dashboradOverviewResponse},
getLastBidsResponce: ${getLastBidsResponce},
dob: ${dob},
gendor: ${gendor},
panNo: ${panNo},
aadharNo: ${aadharNo},
address: ${address}
    ''';
  }
}
