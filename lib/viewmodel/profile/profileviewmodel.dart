import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegBankingDetailsRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegMyAddressRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegPersonalDetailsRequest.dart';
import 'package:giftex/data/network/models/responce/profile/GetUserAllDetailsResponse.dart';
import 'package:giftex/data/network/models/responce/purchase/mypurchasereponse.dart';
import 'package:giftex/data/network/models/responce/user/dashboardoverviewreponse.dart';
import 'package:giftex/data/network/models/responce/user/getlastbidresponce.dart';
import 'package:giftex/data/network/models/responce/user/myauctiongalleryresponce.dart';
import 'package:giftex/data/network/repository/auction/auctionrepo.dart';
import 'package:giftex/data/network/repository/profile/profileRopo.dart';
import 'package:giftex/data/network/repository/userdetails/userrepo.dart';
import 'package:mobx/mobx.dart';

part 'profileviewmodel.g.dart';

class ProfileViewModel = _ProfileViewModel with _$ProfileViewModel;

abstract class _ProfileViewModel with Store {
  ProfileRepo profileRepo = ProfileRepo();
  AuctionRepo auctionRepo = AuctionRepo();
  UserRepo userRepo = UserRepo();

  late LocalSharedPrefrence prefrence;
  _ProfileViewModel() {
    prefrence = LocalSharedPrefrence();
  }

  @observable
  bool isloading = false;

  @observable
  GetUserAllDetailsResponse? getUserAllDetailsResponse = GetUserAllDetailsResponse();

  @observable
  MyPurchaseReponse? myPurchaseReponse;

  @observable
  MyAuctionGalleryResponce? myAuctionGalleryResponce;

  @observable
  DashboradOverviewResponse? dashboradOverviewResponse;

  @observable
  GetLastBidsResponce? getLastBidsResponce;

  Future<HttpResponse> getUserAllDetails() async {
    isloading = true;

    HttpResponse httpResponse = await profileRepo!.getUserAllDetails();

    if (httpResponse.status == 200) {
      getUserAllDetailsResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  @observable
  String dob = "";
  @action
  setDOB(sdob) {
    dob = sdob;
  }

  @observable
  String gendor = "";
  @action
  setgendor(sgendor) {
    gendor = sgendor;
  }

  @observable
  String panNo = "";
  @action
  setpanNo(spanNo) {
    panNo = spanNo;
  }

  @observable
  String aadharNo = "";
  @action
  setaadharNo(saadharNo) {
    aadharNo = saadharNo;
  }

  @observable
  String address = "";
  @action
  setaddress(saddress) {
    address = saddress;
  }

  UpdateRegPersonalDetailsRequest? updateRegPersonalDetailsRequest;
  UpdateRegMyAddressRequest? updateRegMyAddressRequest;
  UpdateRegBankingDetailsRequest? updateRegBankingDetailsRequest;

  Future<HttpResponse> UpdateRegMyAddress() async {
    isloading = true;
    updateRegMyAddressRequest = UpdateRegMyAddressRequest();

    updateRegMyAddressRequest!.cRMClientID = prefrence.getCrmClinetId();
    updateRegMyAddressRequest!.userid = prefrence.getUserId();
    updateRegMyAddressRequest!.authkeyWeb = prefrence.getAuthKeyWeb();

    updateRegMyAddressRequest!.addLine1 = address;

    HttpResponse httpResponse = await profileRepo!.updateRegMyAddress(updateRegMyAddressRequest);

    if (httpResponse.status == 200) {}
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> updateRegPersonalDetails() async {
    isloading = true;
    updateRegPersonalDetailsRequest = UpdateRegPersonalDetailsRequest();

    updateRegPersonalDetailsRequest!.cRMClientID = prefrence.getCrmClinetId();
    updateRegPersonalDetailsRequest!.userid = prefrence.getUserId();
    updateRegPersonalDetailsRequest!.authkeyWeb = prefrence.getAuthKeyWeb();

    updateRegPersonalDetailsRequest!.dob = dob;
    updateRegPersonalDetailsRequest!.gender = gendor;

    HttpResponse httpResponse = await profileRepo!.updateRegPersonalDetails(updateRegPersonalDetailsRequest);

    if (httpResponse.status == 200) {}
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> updateRegBankingDetails() async {
    isloading = true;
    updateRegBankingDetailsRequest = UpdateRegBankingDetailsRequest();

    updateRegBankingDetailsRequest!.cRMClientID = prefrence.getCrmClinetId();
    updateRegBankingDetailsRequest!.userid = prefrence.getUserId();
    updateRegBankingDetailsRequest!.authkeyWeb = prefrence.getAuthKeyWeb();

    updateRegBankingDetailsRequest!.panCardNum = panNo;
    updateRegBankingDetailsRequest!.adhaarCardNum = aadharNo;

    HttpResponse httpResponse = await profileRepo!.updateRegBankingDetails(updateRegBankingDetailsRequest);

    if (httpResponse.status == 200) {}
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getMyPurchase() async {
    isloading = true;

    HttpResponse httpResponse = await auctionRepo!.getMyPurchase();

    if (httpResponse.status == 200) {
      myPurchaseReponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getAuctionGallery() async {
    isloading = true;

    HttpResponse httpResponse = await userRepo!.getAuctionGallery();

    if (httpResponse.status == 200) {
      myAuctionGalleryResponce = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getDashboardOverview() async {
    isloading = true;

    HttpResponse httpResponse = await userRepo!.getDashboardOverview();

    if (httpResponse.status == 200) {
      dashboradOverviewResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getLast5Bids() async {
    isloading = true;

    HttpResponse httpResponse = await userRepo!.getLast5Bids();

    if (httpResponse.status == 200) {
      getLastBidsResponce = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }
}
