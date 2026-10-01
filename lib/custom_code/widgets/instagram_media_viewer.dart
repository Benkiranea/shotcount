// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the `</>` button on the right!
import 'dart:convert';

import 'package:video_player/video_player.dart';

class InstagramMediaViewer extends StatefulWidget {
  const InstagramMediaViewer({
    super.key,
    this.width,
    this.height,
    required this.mediaType,
    required this.mediaUrl,
    this.childrenUrl,
  });

  final double? width;
  final double? height;

  final String mediaType;
  final String mediaUrl;

  // FlutterFlow JSON parameter
  final dynamic childrenUrl;

  @override
  State<InstagramMediaViewer> createState() => _InstagramMediaViewerState();
}

class _InstagramMediaViewerState extends State<InstagramMediaViewer> {
  final PageController _pageController = PageController();

  List<Map<String, dynamic>> mediaItems = [];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _prepareMedia();
  }

  @override
  void didUpdateWidget(
    covariant InstagramMediaViewer oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.mediaType != widget.mediaType ||
        oldWidget.mediaUrl != widget.mediaUrl ||
        oldWidget.childrenUrl != widget.childrenUrl) {
      _prepareMedia();
    }
  }

  // ============================================================
  // PREPARE MEDIA
  // ============================================================

  void _prepareMedia() {
    final List<Map<String, dynamic>> items = [];

    // ==========================================================
    // CAROUSEL ALBUM
    // ==========================================================

    if (widget.mediaType.toUpperCase() == 'CAROUSEL_ALBUM') {
      try {
        dynamic decoded = widget.childrenUrl;

        // ------------------------------------------------------
        // FlutterFlow normally sends JSON directly.
        //
        // If FlutterFlow sends it as a String, decode it.
        // ------------------------------------------------------

        if (decoded is String) {
          final String value = decoded.trim();

          if (value.isNotEmpty && value != 'null') {
            decoded = jsonDecode(value);
          }
        }

        // ------------------------------------------------------
        // childrenUrl should contain a List
        // ------------------------------------------------------

        if (decoded is List) {
          for (final item in decoded) {
            if (item is! Map) {
              continue;
            }

            final dynamic urlValue = item['media_url'];

            if (urlValue == null) {
              continue;
            }

            String url = urlValue.toString().trim();

            if (url.isEmpty) {
              continue;
            }

            // --------------------------------------------------
            // Handle accidental Markdown URL format:
            //
            // [https://example.com/image.jpg](https://example.com/image.jpg)
            //
            // If your DB contains normal URLs, this does nothing.
            // --------------------------------------------------

            url = _cleanUrl(url);

            if (url.isEmpty) {
              continue;
            }

            final String id = item['id']?.toString() ?? '';

            final String type =
                item['media_type']?.toString().toUpperCase() ?? 'IMAGE';

            items.add({
              'id': id,
              'media_url': url,
              'media_type': type,
            });
          }
        }
      } catch (e) {
        debugPrint(
          'InstagramMediaViewer childrenUrl error: $e',
        );
      }
    }

    // ==========================================================
    // NORMAL IMAGE / FALLBACK
    // ==========================================================

    if (items.isEmpty && widget.mediaUrl.trim().isNotEmpty) {
      String url = widget.mediaUrl.trim();

      url = _cleanUrl(url);

      if (url.isNotEmpty) {
        items.add({
          'id': '',
          'media_url': url,
          'media_type': _normalizeMediaType(
            widget.mediaType,
          ),
        });
      }
    }

    // ==========================================================
    // DEBUG
    // ==========================================================

    debugPrint(
      '========== INSTAGRAM MEDIA VIEWER ==========',
    );

    debugPrint(
      'Media Type: ${widget.mediaType}',
    );

    debugPrint(
      'Media URL: ${widget.mediaUrl}',
    );

    debugPrint(
      'Children URL Type: ${widget.childrenUrl.runtimeType}',
    );

    debugPrint(
      'Children URL: ${widget.childrenUrl}',
    );

    debugPrint(
      'FINAL MEDIA ITEMS: $items',
    );

    debugPrint(
      'TOTAL MEDIA ITEMS: ${items.length}',
    );

    debugPrint(
      '============================================',
    );

    // ==========================================================
    // UPDATE STATE
    // ==========================================================

    if (mounted) {
      setState(() {
        mediaItems = items;
        currentIndex = 0;
      });
    }
  }

  // ============================================================
  // CLEAN URL
  // ============================================================

  String _cleanUrl(String url) {
    String cleaned = url.trim();

    // Handle Markdown-style URL:
    // [https://example.com](https://example.com)

    final RegExp markdownUrlRegex = RegExp(
      r'^\[(.*?)\]\((.*?)\)$',
    );

    final Match? match = markdownUrlRegex.firstMatch(cleaned);

    if (match != null) {
      final String markdownUrl = match.group(2)?.trim() ?? '';

      if (markdownUrl.isNotEmpty) {
        cleaned = markdownUrl;
      }
    }

    return cleaned;
  }

  // ============================================================
  // NORMALIZE MEDIA TYPE
  // ============================================================

  String _normalizeMediaType(String type) {
    final String value = type.trim().toUpperCase();

    if (value == 'VIDEO') {
      return 'VIDEO';
    }

    return 'IMAGE';
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    // ----------------------------------------------------------
    // No media
    // ----------------------------------------------------------

    if (mediaItems.isEmpty) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: const Center(
          child: Icon(
            Icons.image_not_supported_outlined,
          ),
        ),
      );
    }

    // ----------------------------------------------------------
    // Media viewer
    // ----------------------------------------------------------

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // ====================================================
          // PAGE VIEW
          // ====================================================

          PageView.builder(
            controller: _pageController,
            itemCount: mediaItems.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final Map<String, dynamic> item = mediaItems[index];

              final String url = item['media_url']?.toString() ?? '';

              final String type =
                  item['media_type']?.toString().toUpperCase() ?? 'IMAGE';

              // ------------------------------------------------
              // VIDEO
              // ------------------------------------------------

              if (type == 'VIDEO') {
                return InstagramVideo(
                  key: ValueKey(
                    item['id']?.toString() ?? url,
                  ),
                  url: url,
                );
              }

              // ------------------------------------------------
              // IMAGE
              // ------------------------------------------------

              return InstagramImage(
                key: ValueKey(
                  item['id']?.toString() ?? url,
                ),
                url: url,
              );
            },
          ),

          // ====================================================
          // TOP RIGHT COUNTER
          // ====================================================

          if (mediaItems.length > 1)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${currentIndex + 1}/${mediaItems.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          // ====================================================
          // INSTAGRAM DOTS
          // ====================================================

          if (mediaItems.length > 1)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  mediaItems.length,
                  (index) {
                    final bool selected = index == currentIndex;

                    return AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selected ? Colors.white : Colors.white54,
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
}

// ================================================================
// IMAGE
// ================================================================

class InstagramImage extends StatelessWidget {
  const InstagramImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Image.network(
        url,
        fit: BoxFit.cover,

        // ------------------------------------------------------
        // LOADING
        // ------------------------------------------------------

        loadingBuilder: (
          context,
          child,
          loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },

        // ------------------------------------------------------
        // ERROR
        // ------------------------------------------------------

        errorBuilder: (
          context,
          error,
          stackTrace,
        ) {
          debugPrint(
            'Instagram image error: $error',
          );

          debugPrint(
            'Instagram image URL: $url',
          );

          return const Center(
            child: Icon(
              Icons.broken_image_outlined,
              color: Colors.white,
              size: 40,
            ),
          );
        },
      ),
    );
  }
}

// ================================================================
// VIDEO
// ================================================================

class InstagramVideo extends StatefulWidget {
  const InstagramVideo({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<InstagramVideo> createState() => _InstagramVideoState();
}

class _InstagramVideoState extends State<InstagramVideo> {
  late VideoPlayerController controller;

  bool initialized = false;
  bool showControls = true;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
    );

    _initialize();
  }

  // ============================================================
  // INITIALIZE VIDEO
  // ============================================================

  Future<void> _initialize() async {
    try {
      await controller.initialize();

      if (!mounted) {
        return;
      }

      await controller.setLooping(true);

      setState(() {
        initialized = true;
      });

      await controller.play();
    } catch (e) {
      debugPrint(
        'Instagram video error: $e',
      );

      debugPrint(
        'Instagram video URL: ${widget.url}',
      );
    }
  }

  // ============================================================
  // BUILD VIDEO
  // ============================================================

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          showControls = !showControls;
        });
      },
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ==================================================
            // VIDEO
            // ==================================================

            Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),

            // ==================================================
            // PLAY / PAUSE
            // ==================================================

            if (showControls)
              IconButton(
                onPressed: () {
                  setState(() {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  });
                },
                iconSize: 55,
                color: Colors.white,
                icon: Icon(
                  controller.value.isPlaying
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
              ),

            // ==================================================
            // VIDEO PROGRESS
            // ==================================================

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DISPOSE VIDEO
  // ============================================================

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}
