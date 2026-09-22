import '../database.dart';

class GoogleReviewsTable extends SupabaseTable<GoogleReviewsRow> {
  @override
  String get tableName => 'google_reviews';

  @override
  GoogleReviewsRow createRow(Map<String, dynamic> data) =>
      GoogleReviewsRow(data);
}

class GoogleReviewsRow extends SupabaseDataRow {
  GoogleReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GoogleReviewsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get googleReviewId => getField<String>('google_review_id')!;
  set googleReviewId(String value) =>
      setField<String>('google_review_id', value);

  String get locationId => getField<String>('location_id')!;
  set locationId(String value) => setField<String>('location_id', value);

  String? get reviewerName => getField<String>('reviewer_name');
  set reviewerName(String? value) => setField<String>('reviewer_name', value);

  String? get reviewerPhotoUrl => getField<String>('reviewer_photo_url');
  set reviewerPhotoUrl(String? value) =>
      setField<String>('reviewer_photo_url', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  DateTime? get reviewCreatedAt => getField<DateTime>('review_created_at');
  set reviewCreatedAt(DateTime? value) =>
      setField<DateTime>('review_created_at', value);

  DateTime? get reviewUpdatedAt => getField<DateTime>('review_updated_at');
  set reviewUpdatedAt(DateTime? value) =>
      setField<DateTime>('review_updated_at', value);

  String? get ownerReply => getField<String>('owner_reply');
  set ownerReply(String? value) => setField<String>('owner_reply', value);

  DateTime? get ownerReplyUpdatedAt =>
      getField<DateTime>('owner_reply_updated_at');
  set ownerReplyUpdatedAt(DateTime? value) =>
      setField<DateTime>('owner_reply_updated_at', value);

  dynamic get rawData => getField<dynamic>('raw_data');
  set rawData(dynamic value) => setField<dynamic>('raw_data', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
