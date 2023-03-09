import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';
import 'package:giftex/data/network/repository/auction/auctionrepo.dart';
import 'package:mobx/mobx.dart';


part 'auctionviewmodel.g.dart';

class AuctionViewModel = _AuctionViewModel with _$AuctionViewModel;

abstract class _AuctionViewModel with Store {

  @observable
  String auctionType = "live";

  late AuctionRepo auctionRepo;

  @observable
  String liveAuctionType = "";

  @observable
  bool isLoadingForUpCommingAuction = false;

  @observable
  int count=1;

  _AuctionViewModel(){
    auctionRepo = AuctionRepo();
  }



  @observable
  UpcomingAuctionResponse? upcomingAuctionResponse;


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

}