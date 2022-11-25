import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../errors/exception.dart';

class NetworkClient {
  Dio _dio = Dio();
  String baseUrl = 'https://corona-virus-stats.herokuapp.com/';

  NetworkClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: 0,
      connectTimeout: 30000,
      baseUrl: baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  // for HTTP.GET Request.
  Future<Response> get(String url, Map<String, Object> params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();

    String? userToken = sharedP.getString('userToken');
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: params,
          options: Options(responseType: ResponseType.json, headers: {
            // "Accept": "application/json",
            // "Content-Type": "application/json",
            // "Authorization": "Bearer $userToken"
          }));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> post(String url, Map<String, Object> params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();

    String? userToken = sharedP.getString('userToken');
    Response response;
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $userToken"
          }));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.PATCH Request.
  Future<Response> patch(String url, Map<String, Object> params) async {
    Response response;
    try {
      response = await _dio.patch(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for dwonload Request.
  Future<Response> download(String url, String pathName,
      void Function(int, int)? onReceiveProgress) async {
    Response response;
    try {
      response = await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }
}
