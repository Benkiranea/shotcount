// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesStruct extends BaseStruct {
  ChatMessagesStruct({
    String? message,
    bool? isFromUser,
    DateTime? timestamp,
  })  : _message = message,
        _isFromUser = isFromUser,
        _timestamp = timestamp;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "isFromUser" field.
  bool? _isFromUser;
  bool get isFromUser => _isFromUser ?? false;
  set isFromUser(bool? val) => _isFromUser = val;

  bool hasIsFromUser() => _isFromUser != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static ChatMessagesStruct fromMap(Map<String, dynamic> data) =>
      ChatMessagesStruct(
        message: data['message'] as String?,
        isFromUser: data['isFromUser'] as bool?,
        timestamp: data['timestamp'] as DateTime?,
      );

  static ChatMessagesStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'isFromUser': _isFromUser,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'isFromUser': serializeParam(
          _isFromUser,
          ParamType.bool,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChatMessagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessagesStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        isFromUser: deserializeParam(
          data['isFromUser'],
          ParamType.bool,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesStruct &&
        message == other.message &&
        isFromUser == other.isFromUser &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([message, isFromUser, timestamp]);
}

ChatMessagesStruct createChatMessagesStruct({
  String? message,
  bool? isFromUser,
  DateTime? timestamp,
}) =>
    ChatMessagesStruct(
      message: message,
      isFromUser: isFromUser,
      timestamp: timestamp,
    );
