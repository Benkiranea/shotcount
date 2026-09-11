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
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<List<FFUploadedFile>> pickAndAddFiles(
  List<FFUploadedFile> existingFiles,
) async {
  // Copy existing files so we don't modify the original list
  final List<FFUploadedFile> allFiles = [
    ...existingFiles,
  ];

  // ==========================================
  // SHOW SOURCE SELECTION
  // ==========================================

  final String? source = await showModalBottomSheet<String>(
    context: appNavigatorKey.currentContext!,
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Upload Files',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context, 'camera');
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photos / Gallery'),
              onTap: () {
                Navigator.pop(context, 'gallery');
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: const Text('Documents'),
              onTap: () {
                Navigator.pop(context, 'documents');
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );

  // User cancelled
  if (source == null) {
    return allFiles;
  }

  // ==========================================
  // CAMERA
  // ==========================================

  if (source == 'camera') {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
    );

    if (image != null) {
      final bytes = await image.readAsBytes();

      allFiles.add(
        FFUploadedFile(
          name: image.name,
          bytes: bytes,
        ),
      );
    }

    return allFiles;
  }

  // ==========================================
  // GALLERY
  // ==========================================

  if (source == 'gallery') {
    final ImagePicker picker = ImagePicker();

    final List<XFile> images = await picker.pickMultiImage(
      imageQuality: 90,
    );

    for (final image in images) {
      final bytes = await image.readAsBytes();

      allFiles.add(
        FFUploadedFile(
          name: image.name,
          bytes: bytes,
        ),
      );
    }

    return allFiles;
  }

  // ==========================================
  // DOCUMENTS
  // ==========================================

  if (source == 'documents') {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true,
    );

    if (result != null) {
      for (final pickedFile in result.files) {
        if (pickedFile.bytes != null) {
          allFiles.add(
            FFUploadedFile(
              name: pickedFile.name,
              bytes: pickedFile.bytes,
            ),
          );
        }
      }
    }

    return allFiles;
  }

  return allFiles;
}
