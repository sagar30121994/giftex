// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auctionviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuctionViewModel on _AuctionViewModel, Store {
  final _$auctionTypeAtom = Atom(name: '_AuctionViewModel.auctionType');

  @override
  String get auctionType {
    _$auctionTypeAtom.reportRead();
    return super.auctionType;
  }

  @override
  set auctionType(String value) {
    _$auctionTypeAtom.reportWrite(value, super.auctionType, () {
      super.auctionType = value;
    });
  }

  final _$liveAuctionTypeAtom = Atom(name: '_AuctionViewModel.liveAuctionType');

  @override
  String get liveAuctionType {
    _$liveAuctionTypeAtom.reportRead();
    return super.liveAuctionType;
  }

  @override
  set liveAuctionType(String value) {
    _$liveAuctionTypeAtom.reportWrite(value, super.liveAuctionType, () {
      super.liveAuctionType = value;
    });
  }

  final _$isLoadingForUpCommingAuctionAtom =
      Atom(name: '_AuctionViewModel.isLoadingForUpCommingAuction');

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

  final _$countAtom = Atom(name: '_AuctionViewModel.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$upcomingAuctionResponseAtom =
      Atom(name: '_AuctionViewModel.upcomingAuctionResponse');

  @override
  UpcomingAuctionResponse? get upcomingAuctionResponse {
    _$upcomingAuctionResponseAtom.reportRead();
    return super.upcomingAuctionResponse;
  }

  @override
  set upcomingAuctionResponse(UpcomingAuctionResponse? value) {
    _$upcomingAuctionResponseAtom
        .reportWrite(value, super.upcomingAuctionResponse, () {
      super.upcomingAuctionResponse = value;
    });
  }

  @override
  String toString() {
    return '''
auctionType: ${auctionType},
liveAuctionType: ${liveAuctionType},
isLoadingForUpCommingAuction: ${isLoadingForUpCommingAuction},
count: ${count},
upcomingAuctionResponse: ${upcomingAuctionResponse}
    ''';
  }
}
