import 'package:dio/dio.dart';

import 'network_client.dart';

class ApiService {
  final NetworkClient networkClient;

  ApiService({required this.networkClient});

  Future<Response> getCountryData() {
    return networkClient.get('api/v1/cases/countries-search', {});
  }

}
