import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/liveauction/singleauctiondetailsresponse.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';
import 'package:giftex/data/network/models/responce/lot/additionalchargereponse.dart';
import 'package:giftex/data/network/models/responce/lot/bidhistoryresponse.dart';
import 'package:giftex/data/network/models/responce/lot/proxybidamountresponse.dart';
import 'package:giftex/data/network/models/responce/lot/proxybidresponse.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';
import 'package:giftex/data/network/repository/auction/auctionrepo.dart';
import 'package:giftex/data/network/repository/lot/lotrepo.dart';
import 'package:mobx/mobx.dart';


part 'auctionviewmodel.g.dart';

class AuctionViewModel = _AuctionViewModel with _$AuctionViewModel;

abstract class _AuctionViewModel with Store {

  @observable
  String auctionType = "live";

  late AuctionRepo auctionRepo;
  late LotRepo lotRepo;
  late LocalSharedPrefrence localSharedPrefrence;

  @observable
  String liveAuctionType = "";

  @observable
  bool isLoadingForUpCommingAuction = false;

  @observable
  bool isLoadingForlots = false;

  @observable
  bool isLoadingForProxy = false;



  @observable
  bool isGrid = false;


  @observable
  String selectedProxyBid = "";

  @observable
  int count=1;

  @observable
  Auctions? selectedAuction;

  _AuctionViewModel(){
    auctionRepo = AuctionRepo();
    lotRepo = LotRepo();
    localSharedPrefrence=LocalSharedPrefrence();
  }



  @observable
  UpcomingAuctionResponse? upcomingAuctionResponse;


  @observable
  BidInfoResponse? bidInfoResponse;


  @observable
  GetProxyBidAmountResponse? getProxyBidAmountResponse;


  @observable
  AdditionalChargeResponse? additionalChargeResponse;


  @observable
  ProxyBidResponse? proxyBidResponse;


  @observable
  SingleAuctionDetsilaResponse? singleAuctionDetsilaResponse;


  @observable
  UpComingLotsResponse? upComingLotsResponse;

  @observable
  UpComingLotsResponse?  myAuctionGalleryResponse;

  @observable
  UpComingLotsResponse?  getliveauctionsResponse;


  Future<HttpResponse> getUpcommingAuction(String auction) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse =
    await auctionRepo.getUpcommingAuction(auction);

    if(httpResponse.status==200) {
      upcomingAuctionResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  Future<HttpResponse> getBidHistoryAuction(String LotId) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse =
    await auctionRepo.getBidHistoryResponse(LotId);

    if(httpResponse.status==200) {
      bidInfoResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  Future<HttpResponse> getUpcommingBidAuction(String auction) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse =
    await auctionRepo.getUpcommingAuctionLots(auction);

    if(httpResponse.status==200) {
      upComingLotsResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }



  Future<HttpResponse> myAuctionGallery() async {
    isLoadingForlots = true;

    HttpResponse httpResponse =
    await auctionRepo.myAuctionGallery();

    if(httpResponse.status==200) {
      myAuctionGalleryResponse = httpResponse.data;
    }
    isLoadingForlots = false;
    return httpResponse;
  }

  Future<HttpResponse> getReviewauctions(Auctions lot) async {
    isLoadingForlots = true;

    HttpResponse httpResponse =
    await auctionRepo.getReviewauctions(lot);

    if(httpResponse.status==200) {
      getliveauctionsResponse = httpResponse.data;
    }
    isLoadingForlots = false;
    return httpResponse;
  }

  int getIndex(String inr){
    for(int i=0;i<getProxyBidAmountResponse!.result!.nextValidBid!.length;i++){
      if(getProxyBidAmountResponse!.result!.nextValidBid![i].iNR==inr){
        return i;
      }
    }
    return 0;
  }


  Future<HttpResponse> getProxyAmountByLot(Lots lot) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse =
    await auctionRepo.getProxyBidAmount(lot);

    if(httpResponse.status==200) {
      getProxyBidAmountResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }




  Future<HttpResponse> addRemoveLotToWishlist(Lots lot,String flag) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse =
    await auctionRepo.addremoveToWishlist(lot,flag);

    if(httpResponse.status==200) {
      // getProxyBidAmountResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }





  Future<HttpResponse> getAdditionCharge(Lots lot) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse =
    await auctionRepo.getAdditionalCharges(lot);

    if(httpResponse.status==200) {
      additionalChargeResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }



  Future<HttpResponse> placeBid(Lots lot,String proxyamount,String currentBid) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse =
    await auctionRepo.placeBid(lot,proxyamount,currentBid);

    if(httpResponse.status==200) {
      proxyBidResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }



  Future<HttpResponse> getSingleAuctionDetails(String auction) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse =
    await auctionRepo.getSingleAuctionDetails(auction);

    if(httpResponse.status==200) {
      singleAuctionDetsilaResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

}