import '../database.dart';

class ProjectsTable extends SupabaseTable<ProjectsRow> {
  @override
  String get tableName => 'projects';

  @override
  ProjectsRow createRow(Map<String, dynamic> data) => ProjectsRow(data);
}

class ProjectsRow extends SupabaseDataRow {
  ProjectsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProjectsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get projectName => getField<String>('project_name');
  set projectName(String? value) => setField<String>('project_name', value);

  String? get roomType => getField<String>('room_type');
  set roomType(String? value) => setField<String>('room_type', value);

  String? get roomDescription => getField<String>('room_description');
  set roomDescription(String? value) =>
      setField<String>('room_description', value);

  int? get currentSteps => getField<int>('current_steps');
  set currentSteps(int? value) => setField<int>('current_steps', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  dynamic? get uploadFiles => getField<dynamic>('upload_files');
  set uploadFiles(dynamic? value) => setField<dynamic>('upload_files', value);

  String? get visualizeRoom => getField<String>('visualize_room');
  set visualizeRoom(String? value) => setField<String>('visualize_room', value);

  String? get visualizeWallpaper => getField<String>('visualize_wallpaper');
  set visualizeWallpaper(String? value) =>
      setField<String>('visualize_wallpaper', value);

  String? get visualizeResult => getField<String>('visualize_result');
  set visualizeResult(String? value) =>
      setField<String>('visualize_result', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get appointmentDate => getField<DateTime>('appointment_date');
  set appointmentDate(DateTime? value) =>
      setField<DateTime>('appointment_date', value);

  String? get appointmentTime => getField<String>('appointment_time');
  set appointmentTime(String? value) =>
      setField<String>('appointment_time', value);

  String? get appointmentPdf => getField<String>('appointment_pdf');
  set appointmentPdf(String? value) =>
      setField<String>('appointment_pdf', value);
}
