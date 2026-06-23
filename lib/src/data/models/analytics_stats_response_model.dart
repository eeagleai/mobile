import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_stats_response_model.freezed.dart';
part 'analytics_stats_response_model.g.dart';

@freezed
abstract class AnalyticsStatsResponseModel with _$AnalyticsStatsResponseModel {
  const AnalyticsStatsResponseModel._();

  const factory AnalyticsStatsResponseModel({
    String? apikey,
    AnalyticsStatsModel? stats,
  }) = _AnalyticsStatsResponseModel;

  factory AnalyticsStatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsStatsResponseModelFromJson(json);

  AnalyticsStats toEntity() {
    final stats = this.stats;
    return AnalyticsStats(
      totalEvents: stats?.totalEvents ?? 0,
      uniqueVisitors: stats?.uniqueVisitors ?? 0,
      uniqueSessions: stats?.uniqueSessions ?? 0,
      lastEventAt: stats?.lastEventAt,
    );
  }
}

@freezed
abstract class AnalyticsStatsModel with _$AnalyticsStatsModel {
  const factory AnalyticsStatsModel({
    @JsonKey(name: 'total_events') @Default(0) int totalEvents,
    @JsonKey(name: 'unique_visitors') @Default(0) int uniqueVisitors,
    @JsonKey(name: 'unique_sessions') @Default(0) int uniqueSessions,
    @JsonKey(name: 'last_event_at') DateTime? lastEventAt,
  }) = _AnalyticsStatsModel;

  factory AnalyticsStatsModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsStatsModelFromJson(json);
}
