import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/home/homeresponse.dart';
import 'package:giftex/data/network/models/responce/home/newsblogsvideoresponse.dart';
import 'package:giftex/data/network/models/responce/home/recordpricelots.dart';
import 'package:giftex/data/network/models/responce/home/upcommingauctionresponse.dart';
import 'package:giftex/data/network/repository/webcmsapimodel/webcmsapimodelrepo.dart';
import 'package:mobx/mobx.dart';


part 'homeviewmodel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {

  WebCmsApiModelRepo? webCmsApiModelRepo;

  @observable
  HomeBanerResponse? homeBanerResponse;


  @observable
  HomeUpcommingAuctionResponse? homeUpcommingAuctionResponse;


  @observable
  RecordPriceLots? recordPriceLots;


  @observable
  HomeNewsVideosBlogsResponse? homeNewsVideosBlogsResponse;


  _HomeViewModel(){
    webCmsApiModelRepo = WebCmsApiModelRepo();
  }

  @observable
  bool isLoading = false;

  @observable
  int selectedTabIndex = 0;

  @observable
  int selectedNewsTabIndex = 0;

  @observable
  bool isLoadingForUpCommingAuction = false;

  @observable
  bool isLoadingForLots = false;

  @observable
  bool isLoadingForNews = false;

  Future<HttpResponse> getHomeBaner() async {
    isLoading = true;

    HttpResponse httpResponse =
    await webCmsApiModelRepo!.getHomeBanner();

    if(httpResponse.status==200) {
      homeBanerResponse = httpResponse.data;

    }
    isLoading = false;
    return httpResponse;
  }


  Future<HttpResponse> getHomeUpcommingAuctionBaner() async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse =
    await webCmsApiModelRepo!.getHomeUpcomingAuction();

    if(httpResponse.status==200) {
      homeUpcommingAuctionResponse = httpResponse.data;

    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }


    Future<HttpResponse> getNewsVideos() async {
      isLoadingForUpCommingAuction = true;

      HttpResponse httpResponse =
      await webCmsApiModelRepo!.getNewsVideos();

      if(httpResponse.status==200) {
        homeNewsVideosBlogsResponse = httpResponse.data;

      }
      isLoadingForUpCommingAuction = false;
      return httpResponse;
    }


  Future<HttpResponse> gethomeRecordPriceLots() async {
    isLoadingForNews = true;

    HttpResponse httpResponse =
    await webCmsApiModelRepo!.gethomeRecordPriceLots();

    if(httpResponse.status==200) {
      recordPriceLots = httpResponse.data;

    }
    isLoadingForNews = false;
    return httpResponse;
  }


}