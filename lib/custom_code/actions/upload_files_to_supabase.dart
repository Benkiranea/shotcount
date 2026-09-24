// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
import 'package:uuid/uuid.dart';

Future<dynamic> uploadFilesToSupabase(
  List<FFUploadedFile> files,
) async {
  final supabase = SupaFlow.client;

  const String bucketName = 'Images';
  const String folderName = 'process_images';

  const uuid = Uuid();

  final List<String> uploadedUrls = [];

  if (files.isEmpty) {
    return uploadedUrls;
  }

  for (final file in files) {
    try {
      final bytes = file.bytes;

      // Skip empty files
      if (bytes == null || bytes.isEmpty) {
        debugPrint('Skipping empty file: ${file.name}');
        continue;
      }

      // Original filename
      final String originalName = file.name ?? 'file';

      // Get original extension
      String extension = '';

      final int dotIndex = originalName.lastIndexOf('.');

      if (dotIndex != -1 && dotIndex < originalName.length - 1) {
        extension = originalName.substring(dotIndex).toLowerCase();
      }

      // Generate unique filename
      final String uniqueFileName = '${uuid.v4()}$extension';

      // Storage path
      final String filePath = '$folderName/$uniqueFileName';

      debugPrint('Uploading: $originalName');
      debugPrint('Storage path: $filePath');

      // Upload
      await supabase.storage.from(bucketName).uploadBinary(
            filePath,
            bytes,
            fileOptions: const FileOptions(
              upsert: false,
            ),
          );

      // Get public URL
      final String publicUrl =
          supabase.storage.from(bucketName).getPublicUrl(filePath);

      uploadedUrls.add(publicUrl);

      debugPrint('Upload successful: $publicUrl');
    } catch (e) {
      debugPrint(
        'Upload failed for ${file.name}: $e',
      );

      // Continue uploading remaining files
      continue;
    }
  }

  return uploadedUrls;
}
