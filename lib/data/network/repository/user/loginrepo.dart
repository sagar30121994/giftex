import 'package:dio/dio.dart';
import 'package:giftex/data/network/models/responce/user/signupres.dart';
import 'package:giftex/data/network/models/responce/user/verifyemailresponse.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';
import '../../models/request/webapimodel/userloginrequestmodel.dart';
import '../../models/responce/user/loginrespose.dart';

class LoginRepo {
  DioClientNew? httpClient;

  LoginRepo() {
    httpClient = DioClientNew();
  }

  Future<HttpResponse> login(LoginReqestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin = json.encode(LoginReqestModel);
    httpClient!.client!.options = BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.User().userLogin, body: model.toJson()).then((responce) async {
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

  Future<HttpResponse> verifyEmail(String email, String firstName, String lastName) async {
    HttpResponse httpResponse = HttpResponse();
    await httpClient!.post(BaseUrl.baseUrl + endPoints.User().verifyEmail, body: {
      "authkey_web": "",
      "authkey_mobile": "",
      "userid": "",
      "CRMClientID": "",
      "email": email,
      "first_name": firstName,
      "last_name": lastName
    }).then((responce) async {
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = VerifyEmailResponse.fromJson(responce.data);
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

  Future<HttpResponse> verifyMobile(String mobilr, String firstName, String lastName) async {
    HttpResponse httpResponse = HttpResponse();
    httpClient!.client!.options = BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.User().verifyMobile, body: {
      "authkey_web": "",
      "authkey_mobile": "",
      "userid": "",
      "CRMClientID": "",
      "mobile": mobilr,
      "country_code": "91"
    }).then((responce) async {
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = VerifyEmailResponse.fromJson(responce.data);
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

  Future<HttpResponse> signUp(String mobilr, String name, String email, String pass) async {
    HttpResponse httpResponse = HttpResponse();
    httpClient!.client!.options = BaseOptions(contentType: Headers.jsonContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.User().insertreg, body: {
      "authkey_web": "",
      "authkey_mobile": "",
      "userid": "",
      "first_name": name,
      "last_name": "",
      "email": email,
      "country_code": "91",
      "mobile": mobilr,
      "password": pass,
      "register_from": "Website",
      "device_code": ""
    }).then((responce) async {
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = SignUpResponse.fromJson(responce.data);
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

  Future<HttpResponse> loginMobile(LoginReqestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin=json.encode(LoginReqestModel);
    // httpClient!.client!.options =
    //     BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.User().userLogin, body: model.toJson()).then((responce) async {
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

  Future<HttpResponse> loginEmailPass(LoginReqestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin=json.encode(LoginReqestModel);
    // httpClient!.client!.options =
    //     BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.User().userLogin, body: model.toJson()).then((responce) async {
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

  Future<HttpResponse> loginMobileConfirm(LoginReqestModel model) async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin=json.encode(LoginReqestModel);
    // httpClient!.client!.options =
    //     BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.WebApiModel().userloginotp, body: model.toJson())
        .then((responce) async {
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

  Future<HttpResponse> insertsubscribeForm(String firstName, String email) async {
    HttpResponse httpResponse = HttpResponse();
    // String userlogin=json.encode(LoginReqestModel);
    // httpClient!.client!.options =
    //     BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!.post(BaseUrl.baseUrl + endPoints.WebApiModel().insertsubscribeForm, body: {
      "authkey_web": "",
      "authkey_mobile": "",
      "userid": "",
      "CRMClientID": "",
      "emailid": email,
      "fullname": firstName,
    }).then((responce) async {
      print(responce);

      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Success';
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
