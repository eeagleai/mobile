import 'package:eeagle_ai/src/data/models/analytics_event_model.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_events_response_model.freezed.dart';
part 'analytics_events_response_model.g.dart';

@freezed
abstract class AnalyticsEventsResponseModel with _$AnalyticsEventsResponseModel {
  const AnalyticsEventsResponseModel._();

  const factory AnalyticsEventsResponseModel({
    String? apikey,
    @Default([]) List<AnalyticsEventModel> events,
  }) = _AnalyticsEventsResponseModel;

  factory AnalyticsEventsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsEventsResponseModelFromJson(json);

  List<AnalyticsEvent> toEntities() {
    return events.map((event) => event.toEntity()).toList();
  }
}
