import 'package:dio/dio.dart';
import 'package:to_do/core/api_consumer.dart';
import 'package:to_do/core/api_endpoints.dart';
import 'package:to_do/core/api_interseptor.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future get(String path, {data, Map<String, dynamic>? queryParameter}) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameter,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
