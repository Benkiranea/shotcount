import '../database.dart';

class AppSecretsTable extends SupabaseTable<AppSecretsRow> {
  @override
  String get tableName => 'app_secrets';

  @override
  AppSecretsRow createRow(Map<String, dynamic> data) => AppSecretsRow(data);
}

class AppSecretsRow extends SupabaseDataRow {
  AppSecretsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppSecretsTable();

  String get key => getField<String>('key')!;
  set key(String value) => setField<String>('key', value);

  String get value => getField<String>('value')!;
  set value(String value) => setField<String>('value', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
