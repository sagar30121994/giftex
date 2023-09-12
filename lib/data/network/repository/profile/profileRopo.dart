import 'package:dio/dio.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegBankingDetailsRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegMyAddressRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegPersonalDetailsRequest.dart';
import 'package:giftex/data/network/models/request/webapimodel/getcityrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/updateaddressRequest.dart';
import 'package:giftex/data/network/models/responce/profile/GetCityResponse.dart';
import 'package:giftex/data/network/models/responce/profile/GetRegInfoResponse.dart';
import 'package:giftex/data/network/models/responce/profile/GetUserAllDetailsResponse.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';

class ProfileRepo {
  DioClientNew? httpClient;
  LocalSharedPrefrence? localSharedPrefrence;

  ProfileRepo() {
    httpClient = DioClientNew();
    localSharedPrefrence = LocalSharedPrefrence();
  }

  Future<HttpResponse> getUserAllDetails() async {
    HttpResponse httpResponse = HttpResponse();

    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();
    await httpClient!.post(BaseUrl.baseUrl + endPoints.Profile().getUserAllDetails, body: {
      "authkey_web": authKey,
      "authkey_mobile": "",
      "userid": userid,
      "CRMClientID": crmClientId
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetUserAllDetailsResponse.fromJson(responce.data);
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }

  Future<HttpResponse> getRegInfo() async {
    HttpResponse httpResponse = HttpResponse();

    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();
    await httpClient!.post(BaseUrl.baseUrl + endPoints.WebApiModel().reginfo, body: {
      "authkey_web": authKey,
      "authkey_mobile": "",
      "userid": userid,
      "CRMClientID": crmClientId
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetRegInfoResponse.fromJson(responce.data);
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }

  Future<HttpResponse> updateRegPersonalDetails(
      UpdateRegPersonalDetailsRequest? updateRegPersonalDetailsRequest) async {
    HttpResponse httpResponse = HttpResponse();

    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.KYC().UpdateRegPersonalDetails,
            body: updateRegPersonalDetailsRequest!.toJson())
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }

  Future<HttpResponse> AddMyAddress(UpdateAddressRequest? updateRegMyAddressRequest) async {
    HttpResponse httpResponse = HttpResponse();
    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();

    await httpClient!.post(BaseUrl.baseUrl + endPoints.WebApiModel().updatemyaddress, body: {
      "authkey_web": authKey,
      "authkey_mobile": "",
      "userid": userid,
      "CRMClientID": crmClientId,
      "email": "",
      "mobile": "",
      "your_name": "",
      "address": updateRegMyAddressRequest!.toJson()
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }

  Future<HttpResponse> updateRegMyAddress(UpdateRegMyAddressRequest? updateRegMyAddressRequest) async {
    HttpResponse httpResponse = HttpResponse();

    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updatemyaddress, body: updateRegMyAddressRequest!.toJson())
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }

  Future<HttpResponse> getDashboardOverview() async {
    HttpResponse httpResponse = HttpResponse();

    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();
    await httpClient!.post(BaseUrl.baseUrl + endPoints.Profile().getDashboardOverview, body: {
      "authkey_web": authKey,
      "authkey_mobile": "",
      "userid": userid,
      "CRMClientID": crmClientId
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }

  Future<HttpResponse> updateRegBankingDetails(UpdateRegBankingDetailsRequest? updateRegBankingDetailsRequest) async {
    HttpResponse httpResponse = HttpResponse();

    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.KYC().UpdateRegBankingDetails, body: updateRegBankingDetailsRequest!.toJson())
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }

  Future<HttpResponse> getCity(GetCityRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    httpClient!.client!.options = BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().getcity, body: model.toJson())
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetCityResponse.fromJson(responce.data);
      } else {
        httpResponse.status = responce.statusCode;
        httpResponse.message = responce.data['message'];
        httpResponse.data = null;
      }
      return httpResponse;
    }).catchError((err) {
      print(err);
      httpResponse.status = 400;
      httpResponse.message = err.toString();
      httpResponse.data = err.toString();
      return httpResponse;
    });

    return httpResponse;
  }
}
