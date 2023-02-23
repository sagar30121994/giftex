import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giftex/data/network/models/request/auction/analysisrequestmodel.dart';
import 'package:giftex/data/network/models/request/userdeails/getliveauctionreviewrequestmodel.dart';
import 'package:giftex/data/network/models/request/userdeails/userrequestmodel.dart';
import 'package:giftex/data/network/models/request/userdeails/usersavesettingrequestmodel.dart';
import 'package:giftex/data/network/models/responce/user/dashboardauctioncalenderresponce.dart';
import 'package:giftex/data/network/models/responce/user/getlastbidresponce.dart';
import 'package:giftex/data/network/models/responce/user/getlastpurchaseresponce.dart';
import 'package:giftex/data/network/models/responce/user/highligtsresponce.dart';
import 'package:giftex/data/network/models/responce/user/liveauctionreviewresponce.dart';
import 'package:giftex/data/network/models/responce/user/myauctiongalleryresponce.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';
import '../../models/request/webapimodel/userloginrequestmodel.dart';
import '../../models/responce/user/loginrespose.dart';

class UserRepo {
  DioClientNew? httpClient;

  UserRepo() {
    httpClient = DioClientNew();
  }

  Future<HttpResponse> getLast5Bids(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().lastbids,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetLastBidsResponce.fromJson(responce.data);
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
  Future<HttpResponse> getLastPurchases(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().lastbids,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetLastPurchaseResponce.fromJson(responce.data);
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
  Future<HttpResponse> getLiveAuctionReview(GetLiveAuctionReviewRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().liveauctionreview,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = LiveAuctionReviewResponce.fromJson(responce.data);
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
  Future<HttpResponse> getAuctionGallery(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().auctiongallery,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = MyAuctionGalleryResponce.fromJson(responce.data);
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
  Future<HttpResponse> getDashboardOverview(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().dashboardoverview,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = MyAuctionGalleryResponce.fromJson(responce.data);
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
  Future<HttpResponse> getDashboardAuctionCalender(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().dashboardoverview,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = DashboardCalenderResponce.fromJson(responce.data);
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
  Future<HttpResponse> getHighlighs(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().highlights,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = HighlightsResponce.fromJson(responce.data);
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
  Future<HttpResponse> getMyPurchases(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().mypurchses,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = HighlightsResponce.fromJson(responce.data);
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
  Future<HttpResponse> getDahboardChart(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().dashboardchart,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = HighlightsResponce.fromJson(responce.data);
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
  Future<HttpResponse> saveSetting(SaveSettingRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().savesetting,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = HighlightsResponce.fromJson(responce.data);
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
  Future<HttpResponse> getSetting(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().getsetting,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = HighlightsResponce.fromJson(responce.data);
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
  Future<HttpResponse> deleteAccount(UserRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().deleteaccount,
        body: userlogin)
        .then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = HighlightsResponce.fromJson(responce.data);
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
