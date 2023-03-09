// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  final _$homeBanerResponseAtom =
      Atom(name: '_HomeViewModel.homeBanerResponse');

  @override
  HomeBanerResponse? get homeBanerResponse {
    _$homeBanerResponseAtom.reportRead();
    return super.homeBanerResponse;
  }

  @override
  set homeBanerResponse(HomeBanerResponse? value) {
    _$homeBanerResponseAtom.reportWrite(value, super.homeBanerResponse, () {
      super.homeBanerResponse = value;
    });
  }

  final _$homeUpcommingAuctionResponseAtom =
      Atom(name: '_HomeViewModel.homeUpcommingAuctionResponse');

  @override
  HomeUpcommingAuctionResponse? get homeUpcommingAuctionResponse {
    _$homeUpcommingAuctionResponseAtom.reportRead();
    return super.homeUpcommingAuctionResponse;
  }

  @override
  set homeUpcommingAuctionResponse(HomeUpcommingAuctionResponse? value) {
    _$homeUpcommingAuctionResponseAtom
        .reportWrite(value, super.homeUpcommingAuctionResponse, () {
      super.homeUpcommingAuctionResponse = value;
    });
  }

  final _$recordPriceLotsAtom = Atom(name: '_HomeViewModel.recordPriceLots');

  @override
  RecordPriceLots? get recordPriceLots {
    _$recordPriceLotsAtom.reportRead();
    return super.recordPriceLots;
  }

  @override
  set recordPriceLots(RecordPriceLots? value) {
    _$recordPriceLotsAtom.reportWrite(value, super.recordPriceLots, () {
      super.recordPriceLots = value;
    });
  }

  final _$homeNewsVideosBlogsResponseAtom =
      Atom(name: '_HomeViewModel.homeNewsVideosBlogsResponse');

  @override
  HomeNewsVideosBlogsResponse? get homeNewsVideosBlogsResponse {
    _$homeNewsVideosBlogsResponseAtom.reportRead();
    return super.homeNewsVideosBlogsResponse;
  }

  @override
  set homeNewsVideosBlogsResponse(HomeNewsVideosBlogsResponse? value) {
    _$homeNewsVideosBlogsResponseAtom
        .reportWrite(value, super.homeNewsVideosBlogsResponse, () {
      super.homeNewsVideosBlogsResponse = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeViewModel.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$selectedTabIndexAtom = Atom(name: '_HomeViewModel.selectedTabIndex');

  @override
  int get selectedTabIndex {
    _$selectedTabIndexAtom.reportRead();
    return super.selectedTabIndex;
  }

  @override
  set selectedTabIndex(int value) {
    _$selectedTabIndexAtom.reportWrite(value, super.selectedTabIndex, () {
      super.selectedTabIndex = value;
    });
  }

  final _$selectedNewsTabIndexAtom =
      Atom(name: '_HomeViewModel.selectedNewsTabIndex');

  @override
  int get selectedNewsTabIndex {
    _$selectedNewsTabIndexAtom.reportRead();
    return super.selectedNewsTabIndex;
  }

  @override
  set selectedNewsTabIndex(int value) {
    _$selectedNewsTabIndexAtom.reportWrite(value, super.selectedNewsTabIndex,
        () {
      super.selectedNewsTabIndex = value;
    });
  }

  final _$isLoadingForUpCommingAuctionAtom =
      Atom(name: '_HomeViewModel.isLoadingForUpCommingAuction');

  @override
  bool get isLoadingForUpCommingAuction {
    _$isLoadingForUpCommingAuctionAtom.reportRead();
    return super.isLoadingForUpCommingAuction;
  }

  @override
  set isLoadingForUpCommingAuction(bool value) {
    _$isLoadingForUpCommingAuctionAtom
        .reportWrite(value, super.isLoadingForUpCommingAuction, () {
      super.isLoadingForUpCommingAuction = value;
    });
  }

  final _$isLoadingForLotsAtom = Atom(name: '_HomeViewModel.isLoadingForLots');

  @override
  bool get isLoadingForLots {
    _$isLoadingForLotsAtom.reportRead();
    return super.isLoadingForLots;
  }

  @override
  set isLoadingForLots(bool value) {
    _$isLoadingForLotsAtom.reportWrite(value, super.isLoadingForLots, () {
      super.isLoadingForLots = value;
    });
  }

  final _$isLoadingForNewsAtom = Atom(name: '_HomeViewModel.isLoadingForNews');

  @override
  bool get isLoadingForNews {
    _$isLoadingForNewsAtom.reportRead();
    return super.isLoadingForNews;
  }

  @override
  set isLoadingForNews(bool value) {
    _$isLoadingForNewsAtom.reportWrite(value, super.isLoadingForNews, () {
      super.isLoadingForNews = value;
    });
  }

  @override
  String toString() {
    return '''
homeBanerResponse: ${homeBanerResponse},
homeUpcommingAuctionResponse: ${homeUpcommingAuctionResponse},
recordPriceLots: ${recordPriceLots},
homeNewsVideosBlogsResponse: ${homeNewsVideosBlogsResponse},
isLoading: ${isLoading},
selectedTabIndex: ${selectedTabIndex},
selectedNewsTabIndex: ${selectedNewsTabIndex},
isLoadingForUpCommingAuction: ${isLoadingForUpCommingAuction},
isLoadingForLots: ${isLoadingForLots},
isLoadingForNews: ${isLoadingForNews}
    ''';
  }
}
