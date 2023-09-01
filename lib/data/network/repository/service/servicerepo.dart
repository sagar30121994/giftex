import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegBankingDetailsRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegMyAddressRequest.dart';
import 'package:giftex/data/network/models/request/kyc/UpdateRegPersonalDetailsRequest.dart';
import 'package:giftex/data/network/models/responce/profile/GetRegInfoResponse.dart';
import 'package:giftex/data/network/models/responce/service/serviceresponse.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';

class ServiceRepo {
  DioClientNew? httpClient;
  LocalSharedPrefrence? localSharedPrefrence;
  ServiceRepo() {
    httpClient = DioClientNew();
    localSharedPrefrence = LocalSharedPrefrence();
  }

  Future<HttpResponse> getServiceDetails(String sdrvice) async {
    HttpResponse httpResponse = HttpResponse();

    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.Service().getServiceDetails, body: {
      "authkey_web": "",
      "authkey_mobile": "",
      "ServiceType": sdrvice,
      "userid": "",
      "CRMClientID": ""
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = ServiceResponse.fromJson(responce.data);
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

  Future<HttpResponse> updateRegMyAddress(UpdateRegMyAddressRequest? updateRegMyAddressRequest) async {
    HttpResponse httpResponse = HttpResponse();

    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.KYC().UpdateRegMyAddress, body: updateRegMyAddressRequest!.toJson())
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
        .post(BaseUrl.baseUrl + endPoints.KYC().UpdateRegMyAddress, body: updateRegBankingDetailsRequest!.toJson())
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
}
