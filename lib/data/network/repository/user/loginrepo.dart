import 'package:dio/dio.dart';

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

    httpClient!.client!.options =
        BaseOptions(contentType: Headers.formUrlEncodedContentType);
    await httpClient!
        .post(BaseUrl.baseUrl + endPoints.User().userLogin,
        body: model.toJson())
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

}
