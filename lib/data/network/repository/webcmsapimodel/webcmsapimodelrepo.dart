import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/responce/cmsweb/careersresponse.dart';
import 'package:giftex/data/network/models/responce/cmsweb/whoweare.dart';
import 'package:giftex/data/network/models/responce/home/GetSellDetailsResponse.dart';
import 'package:giftex/data/network/models/responce/home/getDepartmentsResponse.dart';
import 'package:giftex/data/network/models/responce/home/homeresponse.dart';
import 'package:giftex/data/network/models/responce/home/newsblogsvideoresponse.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';
import '../../models/request/webapimodel/userloginrequestmodel.dart';
import '../../models/responce/home/getBuyDetailsResponse.dart';

class WebCmsApiModelRepo {
  DioClientNew? httpClient;
  LocalSharedPrefrence? localSharedPrefrence;

  WebCmsApiModelRepo() {
    httpClient = DioClientNew();
    localSharedPrefrence = LocalSharedPrefrence();
  }

  Future<HttpResponse> getBuyDetails() async {
    HttpResponse httpResponse = HttpResponse();
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().GetBuyDetails, body: {
      "authkey_web": "${localSharedPrefrence!.authkey ?? ''}",
      "authkey_mobile": "",
      "userid": "${localSharedPrefrence!.userId ?? ''}",
      "CRMClientID": "${localSharedPrefrence!.crmId ?? ''}",
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetBuyDetailsResponse.fromJson(responce.data);
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

  Future<HttpResponse> getSellDetails() async {
    HttpResponse httpResponse = HttpResponse();
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().GetSellDetails, body: {
      "authkey_web": "${localSharedPrefrence!.authkey ?? ''}",
      "authkey_mobile": "",
      "userid": "${localSharedPrefrence!.userId ?? ''}",
      "CRMClientID": "${localSharedPrefrence!.crmId ?? ''}",
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetSellDetailsResponse.fromJson(responce.data);
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

  Future<HttpResponse> getPrivateSellDetails() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getprivateselldetails, body: userlogin)
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

  Future<HttpResponse> getServiceDetails() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getservisedetails, body: userlogin)
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

  Future<HttpResponse> getFaqDetails() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getfaqdetails, body: userlogin)
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

  Future<HttpResponse> getTermsCondition() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().gettermsandconditions, body: userlogin)
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

  Future<HttpResponse> getReachUS() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getreachus, body: userlogin)
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

  Future<HttpResponse> getWhoWeAre() async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().getwhoweare, body: {
      "authkey_web": "${localSharedPrefrence!.authkey ?? ''}",
      "authkey_mobile": "",
      "userid": "${localSharedPrefrence!.userId ?? ''}",
      "CRMClientID": "${localSharedPrefrence!.crmId ?? ''}",
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = WhoWeAreResponse.fromJson(responce.data);
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

  Future<HttpResponse> getPress() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getpress, body: userlogin)
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

  Future<HttpResponse> getPressDetails() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getpressdetails, body: userlogin)
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

  Future<HttpResponse> getCommonInfo() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getcommoninfo, body: userlogin)
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

  Future<HttpResponse> getCareers() async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin = json.encode(LoginReqestModel);/
    // httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().getcareers, body: {
      "authkey_web": "${localSharedPrefrence!.authkey ?? ''}",
      "authkey_mobile": "",
      "userid": "${localSharedPrefrence!.userId ?? ''}",
      "CRMClientID": "${localSharedPrefrence!.crmId ?? ''}",
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = CareersResponse.fromJson(responce.data);
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

  Future<HttpResponse> getBlogs() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getblogs, body: userlogin)
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

  Future<HttpResponse> getBlogsDetails() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getblogdetails, body: userlogin)
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

  Future<HttpResponse> getOurCollection() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getourcollections, body: userlogin)
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

  Future<HttpResponse> getArtMovement() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getartmovement, body: userlogin)
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

  Future<HttpResponse> getAuctiomGuide() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getauctionguide, body: userlogin)
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

  Future<HttpResponse> getNewsVideos() async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin=json.encode(LoginReqestModel);
    // httpClient!.client!.options =
    //     BaseOptions(contentType: Headers.formUrlEncodedContentType);
    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();

    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().getnewsvideos, body: {
      "userId": userid,
      "authkey_mobile": "",
      "authkey_web": authKey,
      "CRMClientID": crmClientId
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = HomeNewsVideosBlogsResponse.fromJson(responce.data);
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

  Future<HttpResponse> getArtistListing() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getartistlisting, body: userlogin)
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

  Future<HttpResponse> getArtistListingPage() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getartistlistingpage, body: userlogin)
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

  Future<HttpResponse> getArtistProfile() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getartistprofile, body: userlogin)
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

  Future<HttpResponse> getNewsDetails() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getnewsdetails, body: userlogin)
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

  Future<HttpResponse> getFotterPage() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getfooterpage, body: userlogin)
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

  Future<HttpResponse> getHomeBanner() async {
    HttpResponse httpResponse = HttpResponse();
    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();

    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().homebanner, body: {
      "userId": userid,
      "authkey_mobile": "",
      "authkey_web": authKey,
      "CRMClientID": crmClientId
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = HomeBanerResponse.fromJson(responce.data);
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

  Future<HttpResponse> getHomeUpcomingAuction() async {
    HttpResponse httpResponse = HttpResponse();
    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().homeupcomingauction, body: {
      "userId": userid,
      "authkey_mobile": "",
      "authkey_web": authKey,
      "CRMClientID": crmClientId
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        // httpResponse.data = HomeUpcommingAuctionResponse.fromJson(responce.data);
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

  Future<HttpResponse> HomeMostRecentAuction() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().homerecentauction, body: userlogin)
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

  Future<HttpResponse> HomeServices() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().homeourservice, body: userlogin)
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

  Future<HttpResponse> HomeArtistOfMonth() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().homeartistofmonth, body: userlogin)
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

  Future<HttpResponse> HomeCategoryOfMonth() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().homecategoryofthemonth, body: userlogin)
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

  Future<HttpResponse> homeOurCollecter() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().homeourcollecters, body: userlogin)
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

  Future<HttpResponse> homeNewsVideoBlog() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().homenewsvideoblog, body: userlogin)
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

  Future<HttpResponse> homeHighlightLots() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().homehighlightlot, body: userlogin)
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

  Future<HttpResponse> gethomeRecordPriceLots() async {
    HttpResponse httpResponse = HttpResponse();
    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();
    // String userlogin=json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().homerecordpricelot, body: {
      "userId": userid,
      "authkey_mobile": "",
      "authkey_web": authKey,
      "CRMClientID": crmClientId
    }).then((responce) async {
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

  Future<HttpResponse> recordPriceLots() async {
    HttpResponse httpResponse = HttpResponse();
    String userid = localSharedPrefrence!.getUserId();
    String authKey = localSharedPrefrence!.getAuthKeyWeb();
    String crmClientId = localSharedPrefrence!.getCrmClinetId();

    // String userlogin = json.encode(LoginReqestModel);
    // httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().recordpricelots, body: {
      "userId": userid,
      "authkey_mobile": "",
      "authkey_web": authKey,
      "CRMClientID": crmClientId
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = UpComingLotsResponse.fromJson(responce.data);
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

  Future<HttpResponse> getDepartments() async {
    HttpResponse httpResponse = HttpResponse();
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.CMSBaseurl + endPoints.WebCMSApiModel().GetDepartments, body: {
      "authkey_web": "${localSharedPrefrence!.authkey ?? ''}",
      "authkey_mobile": "",
      "userid": "${localSharedPrefrence!.userId ?? ''}",
      "CRMClientID": "${localSharedPrefrence!.crmId ?? ''}",
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = GetDepartmentsResponse.fromJson(responce.data);
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

  Future<HttpResponse> getDepartmentsDetails() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getdepartmentdetails, body: userlogin)
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

  Future<HttpResponse> getPurchaseFaq() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getpurchasefaq, body: userlogin)
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

  Future<HttpResponse> getUserNotifications() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getusernotification, body: userlogin)
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

  Future<HttpResponse> getAuctionPage() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().getauctionpage, body: userlogin)
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

  Future<HttpResponse> loadTest() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .get(BaseUrl.notificationbaseUrl + endPoints.WebCMSApiModel().loadtest, body: userlogin)
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
}
