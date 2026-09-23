import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _projectId = prefs.getString('ff_projectId') ?? _projectId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _selectedGoal = 'ACCURACY';
  String get selectedGoal => _selectedGoal;
  set selectedGoal(String value) {
    _selectedGoal = value;
  }

  bool _sensorConnected = false;
  bool get sensorConnected => _sensorConnected;
  set sensorConnected(bool value) {
    _sensorConnected = value;
  }

  String _drillFilter = 'ALL';
  String get drillFilter => _drillFilter;
  set drillFilter(String value) {
    _drillFilter = value;
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
  }

  List<ChatMessagesStruct> _chatMessages = [];
  List<ChatMessagesStruct> get chatMessages => _chatMessages;
  set chatMessages(List<ChatMessagesStruct> value) {
    _chatMessages = value;
  }

  void addToChatMessages(ChatMessagesStruct value) {
    chatMessages.add(value);
  }

  void removeFromChatMessages(ChatMessagesStruct value) {
    chatMessages.remove(value);
  }

  void removeAtIndexFromChatMessages(int index) {
    chatMessages.removeAt(index);
  }

  void updateChatMessagesAtIndex(
    int index,
    ChatMessagesStruct Function(ChatMessagesStruct) updateFn,
  ) {
    chatMessages[index] = updateFn(_chatMessages[index]);
  }

  void insertAtIndexInChatMessages(int index, ChatMessagesStruct value) {
    chatMessages.insert(index, value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
  }

  String _projectId = '';
  String get projectId => _projectId;
  set projectId(String value) {
    _projectId = value;
    prefs.setString('ff_projectId', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
