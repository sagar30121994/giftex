import 'package:giftex/data/local/client/localprefsmodel.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegBankingDetailsRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegMyAddressRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegPersonalDetailsRequest.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';
import 'package:giftex/data/network/models/responce/profile/GetCityResponse.dart';
import 'package:giftex/data/network/models/responce/profile/GetRegInfoResponse.dart';
import 'package:giftex/data/network/models/responce/profile/GetUserAllDetailsResponse.dart';
import 'package:giftex/data/network/models/responce/purchase/mypurchasereponse.dart';
import 'package:giftex/data/network/models/responce/user/dashboardoverviewreponse.dart';
import 'package:giftex/data/network/models/responce/user/getlastbidresponce.dart';
import 'package:giftex/data/network/repository/auction/auctionrepo.dart';
import 'package:giftex/data/network/repository/profile/profileRopo.dart';
import 'package:giftex/data/network/repository/userdetails/userrepo.dart';
import 'package:mobx/mobx.dart';

import '../../data/network/models/request/webapimodel/getcityrequestmodel.dart';

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
  UpComingLotsResponse? myAuctionGalleryResponce;

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

  Future<HttpResponse> UpdateRegMyAddressnew(String YourName, String AddressLine1, String AddressLine2, String PinCode,
      String GSTNumber, String selectedCountry_name, String selectedState_name, String selectedCity_name) async {
    isloading = true;
    updateRegMyAddressRequest = UpdateRegMyAddressRequest();

    updateRegMyAddressRequest!.cRMClientID = prefrence.getCrmClinetId();
    updateRegMyAddressRequest!.userid = prefrence.getUserId();
    updateRegMyAddressRequest!.authkeyWeb = prefrence.getAuthKeyWeb();
    updateRegMyAddressRequest!.yourName = YourName;
    updateRegMyAddressRequest!.addLine1 = AddressLine1;
    updateRegMyAddressRequest!.addLine2 = AddressLine2;
    updateRegMyAddressRequest!.pinCode = PinCode;
    updateRegMyAddressRequest!.country = name;
    updateRegMyAddressRequest!.state = name;
    updateRegMyAddressRequest!.city = name;
    updateRegMyAddressRequest!.gstNum = GSTNumber;
    updateRegMyAddressRequest!.billingAddLine1 = "";
    updateRegMyAddressRequest!.billingPinCode = "";
    updateRegMyAddressRequest!.mobile = "";
    updateRegMyAddressRequest!.email = "";
    updateRegMyAddressRequest!.location = "";
    updateRegMyAddressRequest!.billingAddLine2 = "";
    updateRegMyAddressRequest!.billingCity = "";
    updateRegMyAddressRequest!.billingCountry = "";
    updateRegMyAddressRequest!.billingGstNum = "";
    updateRegMyAddressRequest!.billingLocation = "";
    updateRegMyAddressRequest!.billingState = "";
    updateRegMyAddressRequest!.isbillingaddress = "";
    updateRegMyAddressRequest!.authkeyMobile = "";

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

  @observable
  String? aadharBase64;
  @observable
  String? panBase64;

  Future<HttpResponse> updateRegBankingDetails() async {
    isloading = true;
    updateRegBankingDetailsRequest = UpdateRegBankingDetailsRequest();

    updateRegBankingDetailsRequest!.cRMClientID = prefrence.getCrmClinetId();
    updateRegBankingDetailsRequest!.userid = prefrence.getUserId();
    updateRegBankingDetailsRequest!.authkeyWeb = prefrence.getAuthKeyWeb();

    updateRegBankingDetailsRequest!.panCardNum = panNo;
    updateRegBankingDetailsRequest!.adhaarCardNum = aadharNo;

    updateRegBankingDetailsRequest!.adhaarCardBase64 = aadharBase64;
    updateRegBankingDetailsRequest!.panCardBase64 = panBase64;

    updateRegBankingDetailsRequest!.email ='';
    updateRegBankingDetailsRequest!.mobile ='';
    updateRegBankingDetailsRequest!.bankName ='';
    updateRegBankingDetailsRequest!.ifscCode ='';
    updateRegBankingDetailsRequest!.swiftCode ='';
    updateRegBankingDetailsRequest!.accountNum ='';
    updateRegBankingDetailsRequest!.photoidNum ='';
    updateRegBankingDetailsRequest!.photoidUrl ='';
    updateRegBankingDetailsRequest!.panCardUrl ='';
    updateRegBankingDetailsRequest!.passportNum ='';
    updateRegBankingDetailsRequest!.passportUrl ='';
    updateRegBankingDetailsRequest!.authkeyMobile ='';
    updateRegBankingDetailsRequest!.photoidBase64 ='';
    updateRegBankingDetailsRequest!.termCondition ='';
    updateRegBankingDetailsRequest!.adhaarCardUrl ='';
    updateRegBankingDetailsRequest!.passportBase64 ='';



    HttpResponse httpResponse = await profileRepo!.updateRegBankingDetails(updateRegBankingDetailsRequest);

    if (httpResponse.status == 200) {}
    aadharBase64=null;
    panBase64=null;
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
    myAuctionGalleryResponce = null;
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

  @observable
  GetRegInfoResponse? getRegInfoResponse = GetRegInfoResponse();

  Future<HttpResponse> getRegInfo() async {
    isloading = true;

    HttpResponse httpResponse = await profileRepo!.getRegInfo();

    if (httpResponse.status == 200) {
      getRegInfoResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  @observable
  bool isloadingcity = false;
  @observable
  GetCityResponse? getCityResponse = GetCityResponse();

  Future<HttpResponse> getCity(String stateID) async {
    isloadingcity = true;
    GetCityRequestModel model = GetCityRequestModel();
    model.authkeyWeb = prefrence.getAuthKeyWeb();
    model.userid = prefrence.getUserId();
    model.authkeyMobile = '';
    model.stateId = int.tryParse(stateID) ?? 0;

    HttpResponse httpResponse = await profileRepo!.getCity(model);

    if (httpResponse.status == 200) {
      getCityResponse = httpResponse.data;
    }
    isloadingcity = false;
    return httpResponse;
  }
}
