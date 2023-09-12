import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegBankingDetailsRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegMyAddressRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegPersonalDetailsRequest.dart';
import 'package:giftex/data/network/models/request/webapimodel/updateaddressRequest.dart';
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

  ProfileViewModelErrorState profileViewModelErrorState = ProfileViewModelErrorState();

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

  @observable
  UpdateAddressRequest? updateAddressRequest;

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

  @observable
  String yourName = "";

  @action
  setYourName(String value) {
    yourName = value;
  }

  @observable
  String addressLine1 = "";

  @action
  setAddressLine1(String value) {
    addressLine1 = value;
  }

  @observable
  String addressLine2 = "";

  @action
  setAddressLine2(String value) {
    addressLine2 = value;
  }

  @observable
  String pinCode = "";

  @action
  setPinCode(String value) {
    pinCode = value;
  }

  @observable
  String gSTNumber = "";

  @action
  setGSTNumber(String value) {
    gSTNumber = value;
  }

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => yourName, validateYourName),
      reaction((_) => addressLine1, validateAddressLine1),
      reaction((_) => addressLine2, validateAddressLine2),
      reaction((_) => pinCode, validatePinCode),
      reaction((_) => gSTNumber, validateGSTNumber),
    ];
  }

  @action
  validateAll() {
    validateYourName(yourName);
    validateAddressLine1(addressLine1);
    validateAddressLine2(addressLine2);
    validatePinCode(pinCode);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void validateYourName(String? value) {
    if (value == null || value.trim() == "") {
      profileViewModelErrorState.yourName = "Please Enter Valid Name";
    } else {
      profileViewModelErrorState.yourName = null;
    }
  }

  @action
  void validateAddressLine1(String? value) {
    if (addressLine1 == null || addressLine1.trim() == "") {
      profileViewModelErrorState.addressLine1 = "Please Enter Valid Address";
    } else {
      profileViewModelErrorState.addressLine1 = null;
    }
  }

  @action
  void validateAddressLine2(String? value) {
    if (addressLine2 == null || addressLine2.trim() == "") {
      profileViewModelErrorState.addressLine2 = "Please Enter Valid Address";
    } else {
      profileViewModelErrorState.addressLine2 = null;
    }
  }

  @action
  void validatePinCode(String? value) {
    if (pinCode == null || pinCode.trim() == "") {
      profileViewModelErrorState.pinCode = "Please Enter Valid Pincode";
    } else {
      profileViewModelErrorState.pinCode = null;
    }
  }

  @action
  void validateGSTNumber(String? value) {
    if (gSTNumber == null || gSTNumber.trim() == "") {
      profileViewModelErrorState.gSTNumber = "Please Enter Valid GSTNumber";
    } else {
      profileViewModelErrorState.gSTNumber = null;
    }
  }

  UpdateRegPersonalDetailsRequest? updateRegPersonalDetailsRequest;
  UpdateRegMyAddressRequest? updateRegMyAddressRequest;
 // UpdateAddressRequest? updateAddressRequest;
  UpdateRegBankingDetailsRequest? updateRegBankingDetailsRequest;

  Future<HttpResponse> UpdateRegMyAddress() async {
    isloading = true;
    updateRegMyAddressRequest = UpdateRegMyAddressRequest();
    updateAddressRequest = UpdateAddressRequest();

    updateRegMyAddressRequest!.cRMClientID = prefrence.getCrmClinetId();
    updateRegMyAddressRequest!.userid = prefrence.getUserId();
    updateRegMyAddressRequest!.authkeyWeb = prefrence.getAuthKeyWeb();

    updateRegMyAddressRequest!.addLine1 = address;

    updateRegMyAddressRequest!.city = '';
    updateRegMyAddressRequest!.email = '';
    updateRegMyAddressRequest!.state = '';
    updateRegMyAddressRequest!.mobile = '';
    updateRegMyAddressRequest!.location = '';
    updateRegMyAddressRequest!.pinCode = '';
    updateRegMyAddressRequest!.addLine2 = '';
    updateRegMyAddressRequest!.yourName = '';
    updateRegMyAddressRequest!.billingCity = '';
    updateRegMyAddressRequest!.billingState = '';
    updateRegMyAddressRequest!.authkeyMobile = '';
    updateRegMyAddressRequest!.billingCountry = '';
    updateRegMyAddressRequest!.billingGstNum = '';
    updateRegMyAddressRequest!.billingLocation = '';
    updateRegMyAddressRequest!.billingPinCode = '';
    updateRegMyAddressRequest!.country = '';
    updateRegMyAddressRequest!.gstNum = '';
    updateRegMyAddressRequest!.isbillingaddress = '';
    updateRegMyAddressRequest!.billingAddLine1 = '';
    updateRegMyAddressRequest!.billingAddLine2 = '';

    HttpResponse httpResponse = await profileRepo!.updateRegMyAddress(updateRegMyAddressRequest);

    if (httpResponse.status == 200) {}
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> deleteMyAddress(String addressId) async {
    isloading = true;
    HttpResponse httpResponse = await profileRepo!.deleteMyAddress(addressId);
    if (httpResponse.status == 200) {
      myPurchaseReponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> setDefaultAddress(String addressId) async {
    isloading = true;
    HttpResponse httpResponse = await profileRepo!.setDefaultAddress(addressId);
    if (httpResponse.status == 200) {
      myPurchaseReponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> AddMyNewAddress(
      String address_id,
      String YourName,
      String AddressLine1,
      String AddressLine2,
      String PinCode,
      String GSTNumber,
      String selectedCountry_name,
      String selectedState_name,
      String selectedCity_name,
      String type,
      String action) async {
    isloading = true;
    updateAddressRequest = UpdateAddressRequest();

    updateAddressRequest!.yourName = YourName;
    updateAddressRequest!.addLine1 = AddressLine1;
    updateAddressRequest!.addLine2 = AddressLine2;
    updateAddressRequest!.pinCode = PinCode;
    updateAddressRequest!.country = selectedCountry_name;
    updateAddressRequest!.state = selectedState_name;
    updateAddressRequest!.city = selectedCity_name;
    updateAddressRequest!.gstNum = GSTNumber;
    updateAddressRequest!.type = type;
    updateAddressRequest!.id = address_id;
    updateAddressRequest!.action = action;
    updateAddressRequest!.location = "";

    HttpResponse httpResponse = await profileRepo!.AddMyAddress(updateAddressRequest);

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

    updateRegBankingDetailsRequest!.email = '';
    updateRegBankingDetailsRequest!.mobile = '';
    updateRegBankingDetailsRequest!.bankName = '';
    updateRegBankingDetailsRequest!.ifscCode = '';
    updateRegBankingDetailsRequest!.swiftCode = '';
    updateRegBankingDetailsRequest!.accountNum = '';
    updateRegBankingDetailsRequest!.photoidNum = '';
    updateRegBankingDetailsRequest!.photoidUrl = '';
    updateRegBankingDetailsRequest!.panCardUrl = '';
    updateRegBankingDetailsRequest!.passportNum = '';
    updateRegBankingDetailsRequest!.passportUrl = '';
    updateRegBankingDetailsRequest!.authkeyMobile = '';
    updateRegBankingDetailsRequest!.photoidBase64 = '';
    updateRegBankingDetailsRequest!.termCondition = '';
    updateRegBankingDetailsRequest!.adhaarCardUrl = '';
    updateRegBankingDetailsRequest!.passportBase64 = '';

    HttpResponse httpResponse = await profileRepo!.updateRegBankingDetails(updateRegBankingDetailsRequest);

    if (httpResponse.status == 200) {}
    aadharBase64 = null;
    panBase64 = null;
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

class ProfileViewModelErrorState = _ProfileViewModelErrorState with _$ProfileViewModelErrorState;

abstract class _ProfileViewModelErrorState with Store {
  @observable
  String? yourName;

  @observable
  String? addressLine1;

  @observable
  String? addressLine2;

  @observable
  String? pinCode;

  @observable
  String? gSTNumber;

  @computed
  bool get hasErrors =>
      yourName != null || addressLine1 != null || addressLine2 != null || pinCode != null || gSTNumber != null;
}
