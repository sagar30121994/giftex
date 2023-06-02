import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegBankingDetailsRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegMyAddressRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegPersonalDetailsRequest.dart';
import 'package:giftex/data/network/models/responce/profile/GetUserAllDetailsResponse.dart';
import 'package:giftex/data/network/repository/profile/profileRopo.dart';
import 'package:mobx/mobx.dart';


part 'profileviewmodel.g.dart';

class ProfileViewModel = _ProfileViewModel with _$ProfileViewModel;

abstract class _ProfileViewModel with Store {
  ProfileRepo profileRepo = ProfileRepo();
  late LocalSharedPrefrence prefrence;
  _ProfileViewModel(){
    prefrence=LocalSharedPrefrence();
  }

  @observable
  bool isloading=false;

  @observable
  GetUserAllDetailsResponse? getUserAllDetailsResponse=GetUserAllDetailsResponse();

  Future<HttpResponse> getUserAllDetails() async{
    isloading = true;

    HttpResponse httpResponse =
    await profileRepo!.getUserAllDetails();

    if(httpResponse.status==200) {
      getUserAllDetailsResponse = httpResponse.data;

    }
    isloading = false;
    return httpResponse;
  }



  @observable
  String dob="";
  @action
  setDOB(sdob){
    dob=sdob;
  }

  @observable
  String gendor="";
  @action
  setgendor(sgendor){
    gendor=sgendor;
  }

  @observable
  String panNo="";
  @action
  setpanNo(spanNo){
    panNo=spanNo;
  }
  @observable
  String aadharNo="";
  @action
  setaadharNo(saadharNo){
    aadharNo=saadharNo;
  }
  @observable
  String address="";
  @action
  setaddress(saddress){
    address=saddress;
  }

  UpdateRegPersonalDetailsRequest? updateRegPersonalDetailsRequest;
  UpdateRegMyAddressRequest? updateRegMyAddressRequest;
  UpdateRegBankingDetailsRequest? updateRegBankingDetailsRequest;

  Future<HttpResponse> UpdateRegMyAddress() async{
    isloading = true;
    updateRegMyAddressRequest=UpdateRegMyAddressRequest();

    updateRegMyAddressRequest!.cRMClientID=prefrence.getCrmClinetId();
    updateRegMyAddressRequest!.userid=prefrence.getUserId();
    updateRegMyAddressRequest!.authkeyWeb=prefrence.getAuthKeyWeb();


    updateRegMyAddressRequest!.addLine1=address;

    HttpResponse httpResponse =
    await profileRepo!.updateRegMyAddress(updateRegMyAddressRequest);

    if(httpResponse.status==200) {


    }
    isloading = false;
    return httpResponse;
  }
  Future<HttpResponse> updateRegPersonalDetails() async{
    isloading = true;
    updateRegPersonalDetailsRequest=UpdateRegPersonalDetailsRequest();

    updateRegPersonalDetailsRequest!.cRMClientID=prefrence.getCrmClinetId();
    updateRegPersonalDetailsRequest!.userid=prefrence.getUserId();
    updateRegPersonalDetailsRequest!.authkeyWeb=prefrence.getAuthKeyWeb();


    updateRegPersonalDetailsRequest!.dob=dob;
    updateRegPersonalDetailsRequest!.gender=gendor;

    HttpResponse httpResponse =
    await profileRepo!.updateRegPersonalDetails(updateRegPersonalDetailsRequest);

    if(httpResponse.status==200) {


    }
    isloading = false;
    return httpResponse;
  }
  Future<HttpResponse> updateRegBankingDetails() async{
    isloading = true;
    updateRegBankingDetailsRequest=UpdateRegBankingDetailsRequest();

    updateRegBankingDetailsRequest!.cRMClientID=prefrence.getCrmClinetId();
    updateRegBankingDetailsRequest!.userid=prefrence.getUserId();
    updateRegBankingDetailsRequest!.authkeyWeb=prefrence.getAuthKeyWeb();


    updateRegBankingDetailsRequest!.panCardNum=panNo;
    updateRegBankingDetailsRequest!.adhaarCardNum=aadharNo;

    HttpResponse httpResponse =
    await profileRepo!.updateRegBankingDetails(updateRegBankingDetailsRequest);

    if(httpResponse.status==200) {


    }
    isloading = false;
    return httpResponse;
  }

}