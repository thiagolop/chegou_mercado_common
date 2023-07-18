import 'dart:convert';

import 'package:dio/dio.dart';

import 'http_exception.dart';
import 'http_response.dart';
import 'http_service.dart';

class HttpServiceImpl implements HttpService {
  late final Dio _httpClient;
  final String baseUrl;

  HttpServiceImpl(
    this.baseUrl, {
    required Dio httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<HttpResponse> get(String path) async {
    try {
      if (path.isEmpty) {
        throw const HttpException(
          'Path not informed',
          stackTrace: null,
        );
      }
      final response = await _httpClient.get(
        baseUrl + path,
      );

      return HttpResponse(
        data: response.data,
        dataAsBytes: utf8.encode(
          json.encode(response.data),
        ),
      );
    } on DioException catch (error, stackTrace) {
      throw HttpException(
        error.message ?? 'Error no tratado pela api!',
        stackTrace: stackTrace,
      );
    }
  }
}
