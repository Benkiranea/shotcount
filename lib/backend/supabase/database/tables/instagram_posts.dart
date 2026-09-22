import '../database.dart';

class InstagramPostsTable extends SupabaseTable<InstagramPostsRow> {
  @override
  String get tableName => 'instagram_posts';

  @override
  InstagramPostsRow createRow(Map<String, dynamic> data) =>
      InstagramPostsRow(data);
}

class InstagramPostsRow extends SupabaseDataRow {
  InstagramPostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InstagramPostsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get caption => getField<String>('caption');
  set caption(String? value) => setField<String>('caption', value);

  String? get mediaType => getField<String>('media_type');
  set mediaType(String? value) => setField<String>('media_type', value);

  String? get mediaUrl => getField<String>('media_url');
  set mediaUrl(String? value) => setField<String>('media_url', value);

  String? get permalink => getField<String>('permalink');
  set permalink(String? value) => setField<String>('permalink', value);

  DateTime? get timestamp => getField<DateTime>('timestamp');
  set timestamp(DateTime? value) => setField<DateTime>('timestamp', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get profilePictureUrl => getField<String>('profile_picture_url');
  set profilePictureUrl(String? value) =>
      setField<String>('profile_picture_url', value);

  dynamic get childrenUrls => getField<dynamic>('children_urls');
  set childrenUrls(dynamic value) => setField<dynamic>('children_urls', value);
}
