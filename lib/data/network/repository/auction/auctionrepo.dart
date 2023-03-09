import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/request/auction/analysisrequestmodel.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';
import '../../models/request/webapimodel/userloginrequestmodel.dart';
import '../../models/responce/user/loginrespose.dart';

class AuctionRepo {
  DioClientNew? httpClient;
  LocalSharedPrefrence? localSharedPrefrence;
  AuctionRepo() {
    httpClient = DioClientNew();
    localSharedPrefrence= LocalSharedPrefrence();
  }

  Future<HttpResponse> auctionAnalysis(AnalysisRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().analysis,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = LoginResponse.fromJson(responce.data);
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



  Future<HttpResponse> getUpcommingAuction(String auctionType) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().upcommingAuction,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "AuctionStatus": auctionType
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
         httpResponse.data = UpcomingAuctionResponse.fromJson(responce.data);
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
