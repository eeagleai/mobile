import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/data/models/analytics_events_response_model.dart';
import 'package:eeagle_ai/src/data/models/analytics_stats_response_model.dart';
import 'package:eeagle_ai/src/data/models/analytics_stream_token_model.dart';

/// Thin REST wrapper around the analytics endpoints.
///
/// Performs the raw [Dio] GET calls and returns parsed DTOs. Bearer auth is
/// added automatically by the shared [Dio]'s `AuthInterceptor`, so no header is
/// set here. Errors propagate as [DioException]s for the repository to map.
class AnalyticsApiService {
  AnalyticsApiService(this._dio);

  final Dio _dio;

  Future<AnalyticsStatsResponseModel> fetchStats(String apikey) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConfig.analyticsStatsPath,
      queryParameters: {'apikey': apikey},
    );
    return AnalyticsStatsResponseModel.fromJson(response.data ?? const {});
  }

  Future<AnalyticsEventsResponseModel> fetchEvents(
    String apikey, {
    int limit = 100,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConfig.analyticsEventsPath,
      queryParameters: {'apikey': apikey, 'limit': limit},
    );
    return AnalyticsEventsResponseModel.fromJson(response.data ?? const {});
  }

  Future<AnalyticsStreamTokenModel> fetchStreamToken(String apikey) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConfig.analyticsStreamTokenPath,
      queryParameters: {'apikey': apikey},
    );
    return AnalyticsStreamTokenModel.fromJson(response.data ?? const {});
  }
}
