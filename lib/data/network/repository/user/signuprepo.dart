// import 'package:dio/dio.dart';
//
// import '../../base/base.dart' as BaseUrl;
// import '../../base/endpoints.dart' as endPoints;
// import '../../client/dioclient.dart';
// import '../../models/httpreponsehandler.dart';
// import '../../models/request/user/signuprequest.dart';
// import '../../models/responce/user/signupresponce.dart';
//
// class SignUpRepo {
//   DioClientNew? httpClient;
//
//   SignUpRepo() {
//     httpClient = DioClientNew();
//   }
//
//   Future<HttpResponse> signUp(SignUpRequestModel model) async {
//     HttpResponse httpResponse = HttpResponse();
//
//     httpClient!.client!.options =
//         BaseOptions(contentType: Headers.formUrlEncodedContentType);
//     await httpClient!
//         .post(BaseUrl.baseUrl + endPoints.Admin().adminSignup,
//         body: model.toJson())
//         .then((responce) async {
//       print(responce);
//
//       if (responce.statusCode == 200) {
//         httpResponse.status = responce.statusCode;
//         httpResponse.message = 'Successful';
//         httpResponse.data = SignUpResponse.fromJson(responce.data);
//       } else {
//         httpResponse.status = responce.statusCode;
//         httpResponse.message = responce.data['messege'];
//         httpResponse.data = null;
//       }
//       return httpResponse;
//     }).catchError((err) {
//       print(err);
//       httpResponse.status = 400;
//       httpResponse.message = err.toString();
//       httpResponse.data = err.toString();
//       return httpResponse;
//     });
//
//     return httpResponse;
//   }
// }
