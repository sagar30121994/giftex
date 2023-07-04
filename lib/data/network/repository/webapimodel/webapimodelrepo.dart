import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giftex/data/network/models/request/webapimodel/additionalchargesrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/addremovelottowishlistrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/artistdatarequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/changepasswordrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/closingshedulerequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/deletemyaddressrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/forgetpasswordrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/getbidhistoryrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/getcityrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/gethashstrrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/getpaymentgridrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/getproxybidequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/getuserdetailsrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/inserregrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/insertcareerformrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/insertestimationrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/insertreachusformrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/insertsubsriptionrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/precheckloginrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/setdefaultmyaddressrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/showintrestinauctionrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/upcomingauctionrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/updatebankingdetailsrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/updatemyaddressrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/updateprofiledetailsrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/updateregbankdetailrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/updateregmyaddressrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/updateregpersonaldetailsrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/userloginotprequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/userlogoutrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/verifyemailrequestmodel.dart';
import 'package:giftex/data/network/models/request/webapimodel/verifymobilerequestmodel.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';
import '../../models/request/webapimodel/userloginrequestmodel.dart';
import '../../models/responce/user/loginrespose.dart';

class WebapimodelRepo {
  DioClientNew? httpClient;

  WebapimodelRepo() {
    httpClient = DioClientNew();
  }

  Future<HttpResponse> verifyEmail(VerifyEmailRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().verifyemail, body: userlogin)
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

  Future<HttpResponse> verifyMobile(VerifyMobileRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().verifymobile, body: userlogin)
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

  Future<HttpResponse> forgetPassword(ForgetPasswordRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().forgetpassword, body: userlogin)
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

  Future<HttpResponse> insertReg(InsertRegRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.WebApiModel().insertreg, body: userlogin).then((responce) async {
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

  Future<HttpResponse> updateRegPersonalDetails(UpdateRegPersonalDetailsRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updateregpersonaldetails, body: userlogin)
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

  Future<HttpResponse> updateRegMyAddress(UpdateRegAddressRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updateregmyaddress, body: userlogin)
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

  Future<HttpResponse> updateRegBankingDetails(UpdateRegBankingDetailsRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updateregbankingdetails, body: userlogin)
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

  Future<HttpResponse> regInfo() async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updateregbankingdetails, body: userlogin)
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

  Future<HttpResponse> getCity(GetCityRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.WebApiModel().getcity, body: userlogin).then((responce) async {
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

  Future<HttpResponse> userLogout(UserLogoutRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().userlogout, body: userlogin)
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

  Future<HttpResponse> userLogin(LoginReqestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.WebApiModel().userlogin, body: userlogin).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = LoginResponse.fromJson(responce.data);
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

  Future<HttpResponse> userLoginOtpConfirm(LoginOtpRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().userloginotp, body: userlogin)
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

  Future<HttpResponse> preCheckLogin(PreCheckLoginRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().prechecklogin, body: userlogin)
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

  Future<HttpResponse> UpdateProfilePersonalDetails(UpdateProfilePersonalDetailRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updateprofiledetails, body: userlogin)
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

  Future<HttpResponse> UpdateMyAddress(UpdateMyAddressRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updatemyaddress, body: userlogin)
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

  Future<HttpResponse> deleteMyAddress(DeleteAddressRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().deletemyaddress, body: userlogin)
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

  Future<HttpResponse> serDefaultMyAddress(SetDefaultAddressRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().setdefaultmyaddress, body: userlogin)
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

  Future<HttpResponse> updateBankingDetails(UpdateBankingDetails model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().updateregbankingdetails, body: userlogin)
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

  Future<HttpResponse> getUserAllDetails(GetUserDetailsRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().getuserdetails, body: userlogin)
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

  Future<HttpResponse> changePassword(ChangePasswordRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().changepassword, body: userlogin)
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

  Future<HttpResponse> forgetToChangePassword(ForgetPasswordRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().forgettochangepassword, body: userlogin)
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

  Future<HttpResponse> upcomingAuction(UpcomingAuctionRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().upcomingauction, body: userlogin)
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

  Future<HttpResponse> addRemoveLotFromWishlist(AddRemoveToWishlistRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().addremovetowishlist, body: userlogin)
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

  Future<HttpResponse> showIntrestInAuction(ShowIntrestRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().showintrestinauction, body: userlogin)
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

  Future<HttpResponse> auctionClosingSchedule(ClosingAuctionRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().auctionclosingschedule, body: userlogin)
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

  Future<HttpResponse> upcomingAuctionInfo(ClosingAuctionRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().upcomingauctioninfo, body: userlogin)
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

  Future<HttpResponse> upcomingLots(ClosingAuctionRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().upcominglots, body: userlogin)
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

  Future<HttpResponse> getProxyBidAmount(GetProxyBidRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().getproxybidamount, body: userlogin)
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

  Future<HttpResponse> insertProxyBidAmount(GetProxyBidRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().insertproxybidamount, body: userlogin)
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

  Future<HttpResponse> additionalCharges(AdditionaalChargesRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().additionalcharges, body: userlogin)
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

  Future<HttpResponse> insertReachUsForm(InsertReachUsFormRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().insertreachusform, body: userlogin)
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

  Future<HttpResponse> insertCarrerForm(InsertCareerFormRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().insertcareerform, body: userlogin)
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

  Future<HttpResponse> getBidHistory(GetBidHistoryRequstModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().getbidhistory, body: userlogin)
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

  Future<HttpResponse> insertGetEstimateForm(InsertEstimationRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().insertgetestimateform, body: userlogin)
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

  Future<HttpResponse> insertSubscribeForm(InsertSubscriptionFormRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().insertsubscribeform, body: userlogin)
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

  Future<HttpResponse> getHashStr(GetHashStrRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().gethashstr, body: userlogin)
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

  Future<HttpResponse> getPaymentGrid(GetPaymentGridRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().getpaymentgrid, body: userlogin)
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

  Future<HttpResponse> getArtistData(GetArtistDataRequestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().artistdata, body: userlogin)
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
