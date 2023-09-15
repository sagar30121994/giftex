import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/cmsweb/getDepartmentDetails.dart';
import 'package:giftex/data/network/models/responce/home/CheckAppVersionResponse.dart';
import 'package:giftex/data/network/models/responce/home/CheckFeatureResponse.dart';
import 'package:giftex/data/network/models/responce/home/GetSellDetailsResponse.dart';
import 'package:giftex/data/network/models/responce/home/getArtMovementResponse.dart';
import 'package:giftex/data/network/models/responce/home/getDepartmentsResponse.dart';
import 'package:giftex/data/network/models/responce/home/getOurCollectorResponse.dart';
import 'package:giftex/data/network/models/responce/home/homeresponse.dart';
import 'package:giftex/data/network/models/responce/home/newsblogsvideoresponse.dart';
import 'package:giftex/data/network/models/responce/home/recordpricelots.dart';
import 'package:giftex/data/network/models/responce/home/upcommingauctionresponse.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';
import 'package:giftex/data/network/repository/webcmsapimodel/webcmsapimodelrepo.dart';
import 'package:mobx/mobx.dart';

import '../../data/network/models/responce/home/getBuyDetailsResponse.dart';

part 'homeviewmodel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  WebCmsApiModelRepo? webCmsApiModelRepo;

  @observable
  HomeBanerResponse? homeBanerResponse;

  @observable
  bool search = false;

  @observable
  HomeUpcommingAuctionResponse? homeUpcommingAuctionResponse;

  @observable
  RecordPriceLots? recordPriceLots;

  @observable
  HomeNewsVideosBlogsResponse? homeNewsVideosBlogsResponse;

  _HomeViewModel() {
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

    HttpResponse httpResponse = await webCmsApiModelRepo!.getHomeBanner();

    if (httpResponse.status == 200) {
      homeBanerResponse = httpResponse.data;
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> getHomeUpcommingAuctionBaner() async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await webCmsApiModelRepo!.getHomeUpcomingAuction();

    if (httpResponse.status == 200) {
      homeBanerResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  Future<HttpResponse> getRecordPrizeLots() async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await webCmsApiModelRepo!.gethomeRecordPriceLots();

    if (httpResponse.status == 200) {
      recordPriceLots = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  Future<HttpResponse> getNewsVideos() async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await webCmsApiModelRepo!.getNewsVideos();

    if (httpResponse.status == 200) {
      homeNewsVideosBlogsResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }

  Future<HttpResponse> gethomeRecordPriceLots() async {
    isLoadingForNews = true;

    HttpResponse httpResponse = await webCmsApiModelRepo!.gethomeRecordPriceLots();

    if (httpResponse.status == 200) {
      recordPriceLots = httpResponse.data;
    }
    isLoadingForNews = false;
    return httpResponse;
  }

  @observable
  UpComingLotsResponse? getFeaturedItemsResponse = UpComingLotsResponse();
  @observable
  bool isloadingfeatureditems = false;

  Future<HttpResponse> getfeatureditems() async {
    isloadingfeatureditems = true;
    getFeaturedItemsResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.featureditems();
    if (httpResponse.status == 200) {
      getFeaturedItemsResponse = httpResponse.data;
    }
    isloadingfeatureditems = false;
    return httpResponse;
  }

  @observable
  GetBuyDetailsResponse? getBuyDetailsResponse = GetBuyDetailsResponse();
  @observable
  bool isloadingbuyDetails = false;

  Future<HttpResponse> getBuyDetails() async {
    isloadingbuyDetails = true;
    getBuyDetailsResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.getBuyDetails();
    if (httpResponse.status == 200) {
      getBuyDetailsResponse = httpResponse.data;
    }
    isloadingbuyDetails = false;
    return httpResponse;
  }

  @observable
  GetSellDetailsResponse? getSellDetailsResponse = GetSellDetailsResponse();
  @observable
  bool isloadingsellDetails = false;

  Future<HttpResponse> getSellDetails() async {
    isloadingsellDetails = true;
    getSellDetailsResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.getSellDetails();
    if (httpResponse.status == 200) {
      getSellDetailsResponse = httpResponse.data;
    }
    isloadingsellDetails = false;
    return httpResponse;
  }

  @observable
  GetDepartmentsResponse? getDepartmentsResponse = GetDepartmentsResponse();
  @observable
  bool isloadingdepartments = false;

  Future<HttpResponse> getDepartments() async {
    isloadingdepartments = true;
    getDepartmentsResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.getDepartments();
    if (httpResponse.status == 200) {
      getDepartmentsResponse = httpResponse.data;
    }
    isloadingdepartments = false;
    return httpResponse;
  }

  @observable
  GetDepartmentdetailsResponse? getDepartmentDetailsResponse = GetDepartmentdetailsResponse();
  @observable
  bool isloadingdepartmentdetails = false;

  Future<HttpResponse> getDepartmentDetails(String pageID) async {
    isloadingdepartmentdetails = true;
    getDepartmentDetailsResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.getDepartmentDetails(pageID);
    if (httpResponse.status == 200) {
      getDepartmentDetailsResponse = httpResponse.data;
    }
    isloadingdepartmentdetails = false;
    return httpResponse;
  }

  @observable
  GetOurCollectorResponse? getOurCollectorResponse = GetOurCollectorResponse();
  @observable
  bool isloadingourCollector = false;

  Future<HttpResponse> getOurCollector() async {
    isloadingourCollector = true;
    getOurCollectorResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.getOurCollector();
    if (httpResponse.status == 200) {
      getOurCollectorResponse = httpResponse.data;
    }
    isloadingourCollector = false;
    return httpResponse;
  }

  @observable
  String? selectedyear = '';
  @observable
  List<String> historyYearList = [];
  @observable
  GetArtMovementResponse? getArtMovementResponse = GetArtMovementResponse();
  @observable
  bool isloadingartmovement = false;

  Future<HttpResponse> getArtsMovement() async {
    isloadingartmovement = true;
    getArtMovementResponse = null;
    historyYearList = [];
    HttpResponse httpResponse = await webCmsApiModelRepo!.getArtsMovement();
    if (httpResponse.status == 200) {
      getArtMovementResponse = httpResponse.data;
      if (getArtMovementResponse != null) {
        getArtMovementResponse!.pageContent!.history!.array!.forEach((element) {
          if (!historyYearList.contains(element.year ?? '')) {
            historyYearList.add(element.year ?? '');
          }
        });
      }
      selectedyear = historyYearList.first;
    }
    isloadingartmovement = false;
    return httpResponse;
  }

  @observable
  UpComingLotsResponse? getRecordPriceArtworkResponse = UpComingLotsResponse();
  @observable
  bool isloadinggetpriceartwork = false;

  Future<HttpResponse> getRecordpriceartwork() async {
    isloadinggetpriceartwork = true;
    getRecordPriceArtworkResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.recordPriceLots();
    if (httpResponse.status == 200) {
      getRecordPriceArtworkResponse = httpResponse.data;
    }
    isloadinggetpriceartwork = false;
    return httpResponse;
  }

  @observable
  CheckFeatureResponse? checkFeatureResponse = CheckFeatureResponse();
  Future<HttpResponse> checkFeature() async {
    isLoading = true;
    checkFeatureResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.checkFeature();
    if (httpResponse.status == 200) {
      checkFeatureResponse = httpResponse.data;
    }
    isLoading = false;
    return httpResponse;
  }

  @observable
  CheckAppVersionResponse? checkAppVersionResponse = CheckAppVersionResponse();
  Future<HttpResponse> checkAppVersion() async {
    isLoading = true;
    checkAppVersionResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.checkAppVersion();
    if (httpResponse.status == 200) {
      checkAppVersionResponse = httpResponse.data;
    }
    isLoading = false;
    return httpResponse;
  }
}
