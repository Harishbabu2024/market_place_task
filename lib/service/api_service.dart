import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:market_place_task/core/app_config.dart';
import 'package:market_place_task/model/list_page_model.dart';
import 'package:market_place_task/model/single_post_model.dart';

class ApiService {
  final Dio _dio = Dio();
  ApiService() {
    _dio.options.baseUrl = AppConfig.baseUrl;
    _dio.options.headers = {"Content-Type": "application/json"};
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }
  Future<T> makeGetRequest<T>(
    String endpoint,
    String? dynamicPath,
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>) fromJson,
    BuildContext? context,
  ) async {
    try {
      final fullEndpoint =
          dynamicPath != null && dynamicPath.isNotEmpty
              ? '$endpoint/$dynamicPath'
              : endpoint;

      debugPrint('API headers: ${_dio.options.headers}');
      debugPrint('API Request: ${_dio.options.baseUrl}$fullEndpoint');
      debugPrint('API Params: ${queryParams ?? {}}');
      Map<String, String> headers = {};
      final response = await _dio.get(
        fullEndpoint,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      debugPrint('response  statuscode: ${response.statusCode}');
      if (response.statusCode == 200) {
        debugPrint('API Response: ${response.data}');
        return fromJson(response.data);
      } else if (response.statusCode == 400) {
        throw Exception('Unexpected status code: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: ${response.data['error']}');
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } catch (e, stacktrace) {
      debugPrint('API Exception: $e');
      debugPrint('Stacktrace: $stacktrace');
      throw Exception('An error occurred: $e');
    }
  }

  Future<ListPageModel> fetchAllList(
    BuildContext context, {
    required int page,
  }) async {
    final response = await makeGetRequest<ListPageModel>(
      AppConfig.baseUrl,
      null,
      {'page': page},
      (json) => ListPageModel.fromJson(json),
      context,
    );
    debugPrint("API RESPOSENCE FOR ME API ${response}");
    return response;
  }

  Future<SinglePostModel> fetchSingleList(
    BuildContext context,
    String? id,
  ) async {
    final response = await makeGetRequest<SinglePostModel>(
      "${AppConfig.baseUrl}?id_hash=$id",
      null,
      null,
      (json) => SinglePostModel.fromJson(json),
      context,
    );
    debugPrint("API RESPOSENCE FOR ME API ${response}");
    return response;
  }
}
