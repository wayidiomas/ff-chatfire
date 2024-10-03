// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChartDataStruct extends BaseStruct {
  ChartDataStruct({
    String? dayName,
    int? totalWebhooks,
  })  : _dayName = dayName,
        _totalWebhooks = totalWebhooks;

  // "day_name" field.
  String? _dayName;
  String get dayName => _dayName ?? '';
  set dayName(String? val) => _dayName = val;

  bool hasDayName() => _dayName != null;

  // "total_webhooks" field.
  int? _totalWebhooks;
  int get totalWebhooks => _totalWebhooks ?? 0;
  set totalWebhooks(int? val) => _totalWebhooks = val;

  void incrementTotalWebhooks(int amount) =>
      totalWebhooks = totalWebhooks + amount;

  bool hasTotalWebhooks() => _totalWebhooks != null;

  static ChartDataStruct fromMap(Map<String, dynamic> data) => ChartDataStruct(
        dayName: data['day_name'] as String?,
        totalWebhooks: castToType<int>(data['total_webhooks']),
      );

  static ChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'day_name': _dayName,
        'total_webhooks': _totalWebhooks,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day_name': serializeParam(
          _dayName,
          ParamType.String,
        ),
        'total_webhooks': serializeParam(
          _totalWebhooks,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChartDataStruct(
        dayName: deserializeParam(
          data['day_name'],
          ParamType.String,
          false,
        ),
        totalWebhooks: deserializeParam(
          data['total_webhooks'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChartDataStruct &&
        dayName == other.dayName &&
        totalWebhooks == other.totalWebhooks;
  }

  @override
  int get hashCode => const ListEquality().hash([dayName, totalWebhooks]);
}

ChartDataStruct createChartDataStruct({
  String? dayName,
  int? totalWebhooks,
}) =>
    ChartDataStruct(
      dayName: dayName,
      totalWebhooks: totalWebhooks,
    );
