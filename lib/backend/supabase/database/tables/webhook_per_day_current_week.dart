import '../database.dart';

class WebhookPerDayCurrentWeekTable
    extends SupabaseTable<WebhookPerDayCurrentWeekRow> {
  @override
  String get tableName => 'webhook_per_day_current_week';

  @override
  WebhookPerDayCurrentWeekRow createRow(Map<String, dynamic> data) =>
      WebhookPerDayCurrentWeekRow(data);
}

class WebhookPerDayCurrentWeekRow extends SupabaseDataRow {
  WebhookPerDayCurrentWeekRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WebhookPerDayCurrentWeekTable();

  String? get dayName => getField<String>('day_name');
  set dayName(String? value) => setField<String>('day_name', value);

  int? get dayOfWeek => getField<int>('day_of_week');
  set dayOfWeek(int? value) => setField<int>('day_of_week', value);

  int? get idEmpresa => getField<int>('id_empresa');
  set idEmpresa(int? value) => setField<int>('id_empresa', value);

  int? get totalWebhooks => getField<int>('total_webhooks');
  set totalWebhooks(int? value) => setField<int>('total_webhooks', value);
}
