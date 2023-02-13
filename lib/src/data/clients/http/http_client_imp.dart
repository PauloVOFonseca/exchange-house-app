import 'package:dio/dio.dart';
import 'package:exchange_house_app/src/data/clients/http/http_client.dart';

class HttpClientImp implements HttpClient {
  final Dio _dio = Dio();

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await _dio.get(url, queryParameters: query, options: options);
  }
}
