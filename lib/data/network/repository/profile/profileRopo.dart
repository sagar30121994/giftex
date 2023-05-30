import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giftex/data/network/models/request/payment/paymentrequestmodel.dart';
import 'package:giftex/data/network/models/responce/payment/paymentresponce.dart';
import 'package:giftex/data/network/models/responce/profile/GetUserAllDetailsResponse.dart';

import '../../base/base.dart' as BaseUrl;
import '../../base/endpoints.dart' as endPoints;
import '../../client/dioclient.dart';
import '../../models/httpreponsehandler.dart';
import '../../models/request/webapimodel/userloginrequestmodel.dart';

class ProfileRepo {
  DioClientNew? httpClient;

  ProfileRepo() {
    httpClient = DioClientNew();
  }

  Future<HttpResponse> getUserAllDetails() async {
    HttpResponse httpResponse = HttpResponse();


    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.Profile().getUserAllDetails,
        body: {
          "authkey_web":"O1N8K0SLEWXIBKGE6OJGXFFV929GLH",
          "authkey_mobile":"",
          "userid":"3652",
          "CRMClientID":"85713fff-c8da-4a65-ac20-8fa928bcebf5"
        }
    )
        .then((responce) async {
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


}
