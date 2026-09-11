import '../database.dart';

class GoogleBusinessConfigTable extends SupabaseTable<GoogleBusinessConfigRow> {
  @override
  String get tableName => 'google_business_config';

  @override
  GoogleBusinessConfigRow createRow(Map<String, dynamic> data) =>
      GoogleBusinessConfigRow(data);
}

class GoogleBusinessConfigRow extends SupabaseDataRow {
  GoogleBusinessConfigRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GoogleBusinessConfigTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get accountId => getField<String>('account_id');
  set accountId(String? value) => setField<String>('account_id', value);

  String? get locationId => getField<String>('location_id');
  set locationId(String? value) => setField<String>('location_id', value);

  String? get accountName => getField<String>('account_name');
  set accountName(String? value) => setField<String>('account_name', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  DateTime? get connectedAt => getField<DateTime>('connected_at');
  set connectedAt(DateTime? value) => setField<DateTime>('connected_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
