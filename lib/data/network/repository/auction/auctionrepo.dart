import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/request/auction/analysisrequestmodel.dart';
import 'package:giftex/data/network/models/responce/liveauction/singleauctiondetailsresponse.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';
import 'package:giftex/data/network/models/responce/lot/additionalchargereponse.dart';
import 'package:giftex/data/network/models/responce/lot/bidhistoryresponse.dart';
import 'package:giftex/data/network/models/responce/lot/proxybidamountresponse.dart';
import 'package:giftex/data/network/models/responce/lot/proxybidresponse.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';

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





  Future<HttpResponse> getBidHistoryResponse(String lotId) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().bidHistory,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "LotId": lotId
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        if(httpResponse.data["status"]=="true") {
          httpResponse.data = BidInfoResponse.fromJson(responce.data);
        }
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




  Future<HttpResponse> getLotById(String lotId) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().getLotById,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "LotId": lotId
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';

          httpResponse.data = Lots.fromJson(responce.data);

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





  Future<HttpResponse> getUpcommingAuctionLots(String ids) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().upcommingAuctionLots,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "AuctionId":ids
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = UpComingLotsResponse.fromJson(responce.data);
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


  Future<HttpResponse> myAuctionGallery() async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().myAuctionGallery,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,

        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = UpComingLotsResponse.fromJson(responce.data);
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


  Future<HttpResponse>getReviewauctions(Auctions lot) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().getReviewauctions,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "filterType":"LatestLots",
          "CRMClientID":crmClientId,
          "AuctionId": lot.auctionId

        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = UpComingLotsResponse.fromJson(responce.data);
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


  Future<HttpResponse> getProxyBidAmount(Lots model) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Lots().proxyBidAmount,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "AuctionId":model.auctionId,
          "AuctionInventoryPID":model.auctionInventoryPID,
          "AuctionStatus":model.auctionStatus,
          "BidIncrementPercentage":model.bidIncrementPercentage,
          "LotId":model.lotId,
          "NextValidBid":model.liveStatus!.nextValidBid!.toJson()
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetProxyBidAmountResponse.fromJson(responce.data);
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




  Future<HttpResponse> addremoveToWishlist(Lots model,String flag) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Lots().addremoveToWishlist,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "Like":flag,
          "LotId":model.lotId,

        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetProxyBidAmountResponse.fromJson(responce.data);
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



  Future<HttpResponse> getAdditionalCharges(Lots model) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Lots().proxyBidAmount,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "AuctionId":model.auctionId,
          "isleading":model.leadingUser!.id==userid?true:false,
          "AuctionStatus":model.auctionStatus,
          "nextValidBidAmount":model.liveStatus!.nextValidBid!.iNR,
          "nextValidBid":model.liveStatus!.nextValidBid!.toJson(),
          "BidIncrementPercentage":model.bidIncrementPercentage,
          "currencyType":"INR",
          "LotId":model.lotId
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = AdditionalChargeResponse.fromJson(responce.data);
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



  Future<HttpResponse> placeBid(Lots model,String proxybidampount,String placeBidAmount) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Lots().placeBid,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "CurrentBid":model.liveStatus!.currentBid!.toJson(),
          "ProxyBidAmount":proxybidampount,
          "currencyType":"INR",
          "LiveBidAmount":placeBidAmount,
          "LotId":model.lotId
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = ProxyBidResponse.fromJson(responce.data);
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



  Future<HttpResponse> getSingleAuctionDetails(String ids) async {
    HttpResponse httpResponse = HttpResponse();
    String userid=localSharedPrefrence!.getUserId();
    String authKey=localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId=localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Auction().singleAuctionLots,
        body: {
          "userId":userid,
          "authkey_mobile":"",
          "authkey_web":authKey,
          "CRMClientID":crmClientId,
          "AuctionId":ids
        })
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = SingleAuctionDetsilaResponse.fromJson(responce.data);
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
