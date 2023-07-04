// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$homeBanerResponseAtom =
      Atom(name: '_HomeViewModel.homeBanerResponse', context: context);

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

  late final _$searchAtom =
      Atom(name: '_HomeViewModel.search', context: context);

  @override
  bool get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(bool value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$homeUpcommingAuctionResponseAtom = Atom(
      name: '_HomeViewModel.homeUpcommingAuctionResponse', context: context);

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

  late final _$recordPriceLotsAtom =
      Atom(name: '_HomeViewModel.recordPriceLots', context: context);

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

  late final _$homeNewsVideosBlogsResponseAtom = Atom(
      name: '_HomeViewModel.homeNewsVideosBlogsResponse', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModel.isLoading', context: context);

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

  late final _$selectedTabIndexAtom =
      Atom(name: '_HomeViewModel.selectedTabIndex', context: context);

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

  late final _$selectedNewsTabIndexAtom =
      Atom(name: '_HomeViewModel.selectedNewsTabIndex', context: context);

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

  late final _$isLoadingForUpCommingAuctionAtom = Atom(
      name: '_HomeViewModel.isLoadingForUpCommingAuction', context: context);

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

  late final _$isLoadingForLotsAtom =
      Atom(name: '_HomeViewModel.isLoadingForLots', context: context);

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

  late final _$isLoadingForNewsAtom =
      Atom(name: '_HomeViewModel.isLoadingForNews', context: context);

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
search: ${search},
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
