import 'package:firebase_database/firebase_database.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/request/webapimodel/showintrestinauctionrequestmodel.dart';
import 'package:giftex/data/network/models/responce/home/seachRsponse.dart' as search;
import 'package:giftex/data/network/models/responce/liveauction/auctionresultresponse.dart';
import 'package:giftex/data/network/models/responce/liveauction/singleauctiondetailsresponse.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';
import 'package:giftex/data/network/models/responce/lot/additionalchargereponse.dart';
import 'package:giftex/data/network/models/responce/lot/bidhistoryresponse.dart';
import 'package:giftex/data/network/models/responce/lot/proxybidamountresponse.dart';
import 'package:giftex/data/network/models/responce/lot/proxybidresponse.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';
import 'package:giftex/data/network/repository/auction/auctionrepo.dart';
import 'package:giftex/data/network/repository/lot/lotrepo.dart';
import 'package:giftex/data/network/repository/webapimodel/webapimodelrepo.dart';
import 'package:mobx/mobx.dart';

part 'auctionviewmodel.g.dart';

class AuctionViewModel = _AuctionViewModel with _$AuctionViewModel;

abstract class _AuctionViewModel with Store {
  @observable
  String auctionType = "live";

  late AuctionRepo auctionRepo;
  late LotRepo lotRepo;
  late WebapimodelRepo webapimodelRepo;

  late LocalSharedPrefrence localSharedPrefrence;

  @observable
  String liveAuctionType = "browselist";

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
  int count = 1;

  @observable
  Auctions? selectedAuction;

  @observable
  AutionResultResponse? autionResultResponse;

  @observable
  UpcomingAuctionResponse? searchResponse;

  _AuctionViewModel() {
    auctionRepo = AuctionRepo();
    lotRepo = LotRepo();
    webapimodelRepo = WebapimodelRepo();

    localSharedPrefrence = LocalSharedPrefrence();

    //trackFirebaseEvents();
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
  UpComingLotsResponse? myAuctionGalleryResponse;

  @observable
  UpComingLotsResponse? getliveauctionsResponse;

  @observable
  UpComingLotsResponse? getsingleResponse;

  @observable
  String sort = "";

  int page = 1;

  @action
  Future<HttpResponse> getUpcommingAuction(String auction) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await auctionRepo.getUpcommingAuction(auction, page);

    if (httpResponse.status == 200) {
      upcomingAuctionResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  @action
  List<String> getSortingItem() {
    List<String> list = [];

    if (auctionType == "live") {
      upComingLotsResponse!.result!.lots!.forEach((element) {
        if (!list.contains(element.category)) {
          list.add(element.category ?? "");
        }
      });
    } else if (auctionType == "past") {
    } else {}

    return list;
  }

  @action
  Future<HttpResponse> getBidHistoryAuction(String LotId) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await auctionRepo.getBidHistoryResponse(LotId);

    if (httpResponse.status == 200) {
      bidInfoResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> getAuctionResult() async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await auctionRepo.getAuctionAnalysis(selectedAuction!.auctionId!);

    if (httpResponse.status == 200) {
      autionResultResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> getUpcommingBidAuction(String auction) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await auctionRepo.getUpcommingAuctionLots(auction, page);

    if (httpResponse.status == 200) {
      upComingLotsResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  @action
  Future replaceLots(Lots lot) async {
    // isLoadingForUpCommingAuction = true;
    UpComingLotsResponse tempResponse = upComingLotsResponse!;
    for (int i = 0; i < tempResponse.result!.lots!.length; i++) {
      if (tempResponse.result!.lots![i].lotId == lot.lotId) {
        tempResponse.result!.lots!.removeAt(i);
        tempResponse.result!.lots!.insert(i, lot);
      }
    }
    if (liveAuctionType == "browselist") {
      upComingLotsResponse = tempResponse;
    } else if (liveAuctionType == "review") {
      getliveauctionsResponse = tempResponse;
    } else if (liveAuctionType == "mygallery") {
      tempResponse.result!.lots!.sort(
        (a, b) => int.parse(a.lotNumber!).compareTo(int.parse(b.lotNumber!)),
      );

      myAuctionGalleryResponse = tempResponse;
    }
  }

  @action
  Future<HttpResponse> getLotById(String lotId) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await auctionRepo.getLotDetails(lotId);

    if (httpResponse.status == 200) {
      getsingleResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;

    return httpResponse;
  }

  @action
  Future<HttpResponse> myAuctionGallery() async {
    isLoadingForlots = true;

    HttpResponse httpResponse = await auctionRepo.myAuctionGallery();
    UpComingLotsResponse tempResponse = upComingLotsResponse!;
    if (httpResponse.status == 200) {
      tempResponse = httpResponse.data;
      // Map<String, int> tempRespon = {
      //   for (var x in tempResponse.result!.lots!.toSet())
      //   :  tempResponse.result!.lots!.where((item) => item == x).length
      // };
      tempResponse.result!.lots!.sort(
        (a, b) => int.parse(b.lotNumber!).compareTo(int.parse(a.lotNumber!)),
      );

      myAuctionGalleryResponse = tempResponse;
    }
    isLoadingForlots = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> getLotDetails(String lotId) async {
    isLoadingForlots = true;

    HttpResponse httpResponse = await auctionRepo.getLotDetails(lotId);

    if (httpResponse.status == 200) {
      myAuctionGalleryResponse = httpResponse.data;
    }
    isLoadingForlots = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> getReviewauctions({Auctions? lot}) async {
    isLoadingForlots = true;

    HttpResponse httpResponse = await auctionRepo.getReviewauctions(lot: lot);

    if (httpResponse.status == 200) {
      getliveauctionsResponse = httpResponse.data;
    }
    isLoadingForlots = false;
    return httpResponse;
  }

  int getIndex(String inr) {
    for (int i = 0; i < getProxyBidAmountResponse!.result!.nextValidBid!.length; i++) {
      if (getProxyBidAmountResponse!.result!.nextValidBid![i].iNR == inr) {
        return i;
      }
    }
    return 0;
  }

  @observable
//  search.SearchResponse? newsearchResponse=search.SearchResponse();
  UpComingLotsResponse? newsearchResponse=UpComingLotsResponse();

  @action
  Future<HttpResponse> getGlobalauctions(String search) async {
    isLoadingForlots = true;
    newsearchResponse=null;
    HttpResponse httpResponse = await auctionRepo.getGlobalauctions(search);

    if (httpResponse.status == 200) {

      searchResponse = httpResponse.data;
    }
    isLoadingForlots = false;
    return httpResponse;
  }
  Future<HttpResponse> SearchGlobalauctions(String search) async {
    isLoadingForlots = true;
    newsearchResponse=null;
    HttpResponse httpResponse = await auctionRepo.SearchGlobalauctions(search);

    if (httpResponse.status == 200) {
      newsearchResponse=httpResponse.data;

    }
    isLoadingForlots = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> getProxyAmountByLot(Lots lot) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse = await auctionRepo.getProxyBidAmount(lot);

    if (httpResponse.status == 200) {
      getProxyBidAmountResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> addRemoveLotToWishlist(Lots lot, String flag) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse = await auctionRepo.addremoveToWishlist(lot, flag);

    if (httpResponse.status == 200) {
      // getProxyBidAmountResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> getAdditionCharge(Lots lot) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse = await auctionRepo.getAdditionalCharges(lot);

    if (httpResponse.status == 200) {
      additionalChargeResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> placeBid(Lots lot, String proxyamount, String currentBid) async {
    isLoadingForProxy = true;

    HttpResponse httpResponse = await auctionRepo.placeBid(lot, proxyamount, currentBid);

    if (httpResponse.status == 200) {
      proxyBidResponse = httpResponse.data;
    }
    isLoadingForProxy = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> getSingleAuctionDetails(String auction) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await auctionRepo.getSingleAuctionDetails(auction);

    if (httpResponse.status == 200) {
      singleAuctionDetsilaResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  @action
  Future<HttpResponse> sortAUction(String auction, String filterType) async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await auctionRepo.sortLostbyAution(auction, filterType);

    if (httpResponse.status == 200) {
      getliveauctionsResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }



  Future<HttpResponse> showIntrestInAuction(String name, String email, String countryCOde,String phone,String messae,String auctionId) async {
    isLoadingForUpCommingAuction = true;
    ShowIntrestRequestModel requestModel=ShowIntrestRequestModel();
    requestModel.message=messae;
    requestModel.name=name;
    requestModel.email=email;
    requestModel.mobile=phone;
    requestModel.message=messae;
    requestModel.auctionId=auctionId;
    requestModel.countryCode='91';
    requestModel.userid=localSharedPrefrence.getUserId();
    requestModel.authkeyWeb=localSharedPrefrence.getAuthKeyWeb();




    HttpResponse httpResponse = await webapimodelRepo.showIntrestInAuction(requestModel);

    if (httpResponse.status == 200) {
     // getliveauctionsResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  @action
  Future<void> logout() async {
    await localSharedPrefrence.setLoginStatus(false);
    await localSharedPrefrence.setAuthKeyWeb("");
    await localSharedPrefrence.setCrmClinetId("");
    await localSharedPrefrence.setToken("");
  }

  void trackFirebaseEvents() {
    print("******* Tracking events*******");
    final userlikeReference = FirebaseDatabase.instance.ref("userlike/" + localSharedPrefrence.getUserId());

    userlikeReference.onValue.listen((DatabaseEvent event) {
      print(event);
      print("******* events  received *******");
      final data = event.snapshot.value;

      if (liveAuctionType == "mygallery") {
        myAuctionGallery();
      }
    });
  }


}
