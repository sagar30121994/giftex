import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../base/base.dart' as BaseUrl;

class DioClientNew {
  Dio? client;

  DioClientNew() {
    // print('token ${globalSharePrefs!.getString(USERToken)}');
    //
    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    // headers['x-access-token'] = globalSharePrefs!.getString(USERToken);
    BaseOptions options = BaseOptions(
      baseUrl: BaseUrl.baseUrl,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      headers: headers,
    );

    // RequestOptions optionsMain;
    client = Dio(options);
    // client.interceptors.add(DioCacheManager(CacheConfig(baseUrl: BaseUrl.baseUrl)).interceptor);
    // client.interceptors.add(LogInterceptor());
    if (kDebugMode) {
      client!.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    }
  }

  Future<Response> get(String endpoint, {dynamic body}) async {
    return client!
        .request(endpoint, data: body, options: Options(method: "GET"));
  }

  Future<Response> post(String endpoint, {dynamic body}) async {
    Response response;
    try {
      response = await client!
          .request(endpoint, data: body, options: Options(method: "POST"));
    } on DioError catch (e) {
      response = e.response!;
    }
    return response;
  }

  Future<Response> put(String endpoint, {dynamic body}) async {
    return client!
        .request(endpoint, data: body, options: Options(method: "PUT"));
  }

  Future<Response> delete(String endpoint, {dynamic body}) async {
    return client!
        .request(endpoint, data: body, options: Options(method: "DELETE"));
  }

  Future<Response> download(String endpoint, String fileName) async {
    return client!.download(endpoint, fileName);
  }
}
