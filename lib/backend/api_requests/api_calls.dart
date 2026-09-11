import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InstagramFeedCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'InstagramFeed',
      apiUrl:
          'https://cpwuclmclkbuwpnhdkha.supabase.co/functions/v1/sync-instagram',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateWallpaperVisualizationCall {
  static Future<ApiCallResponse> call({
    String? roomUrl = '',
    String? wallpaperUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "room_url": "${escapeStringForJson(roomUrl)}",
  "wallpaper_url": "${escapeStringForJson(wallpaperUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateWallpaperVisualization',
      apiUrl:
          'https://cpwuclmclkbuwpnhdkha.supabase.co/functions/v1/generate-wallpaper-visualization',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGoogleReviewsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGoogleReviews',
      apiUrl:
          'https://cpwuclmclkbuwpnhdkha.supabase.co/functions/v1/get-google-reviews',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProjectDetailsCall {
  static Future<ApiCallResponse> call({
    String? pProjectId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_project_id": "${escapeStringForJson(pProjectId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getProjectDetails',
      apiUrl:
          'https://cpwuclmclkbuwpnhdkha.supabase.co/rest/v1/rpc/get_project_details',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllProjectsCall {
  static Future<ApiCallResponse> call({
    String? pUserId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllProjects',
      apiUrl:
          'https://cpwuclmclkbuwpnhdkha.supabase.co/rest/v1/rpc/get_all_projects',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChatUserTokenCall {
  static Future<ApiCallResponse> call({
    String? email = 'appuser@shotcount.com',
    String? firstName = 'Shotcount',
    String? lastName = 'App User',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "appuser@shotcount.com",
  "firstName": "Shotcount App",
  "lastName": "User"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatUserToken',
      apiUrl: 'https://api.hubapi.com/visitor-identification/v3/tokens/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer pat-eu1-4214332e-d018-4057-b6ab-d1ef100bf81c',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? identityToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class ChatUserTokenHubspotCall {
  static Future<ApiCallResponse> call({
    String? email = 'appuser@shotcount.com',
    String? firstName = 'Shotcount App',
    String? lastName = 'User',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "firstName": "${escapeStringForJson(firstName)}",
  "lastName": "${escapeStringForJson(lastName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'chatUserTokenHubspot',
      apiUrl:
          'https://cpwuclmclkbuwpnhdkha.supabase.co/functions/v1/hubspot-visitor-token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNwd3VjbG1jbGtidXdwbmhka2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODcxMjA3MjIsImV4cCI6MjEwMjY5NjcyMn0.xKqHrT0FLwTt0iWWlNbYZRV5-OG2Rj9tHIoOiis9Gts',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
