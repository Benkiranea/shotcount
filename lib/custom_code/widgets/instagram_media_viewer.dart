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

  bool isCarousel = false;

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

      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    }
  }

  // ============================================================
  // PREPARE MEDIA
  // ============================================================

  void _prepareMedia() {
    final List<Map<String, dynamic>> items = [];

    final String mainType = widget.mediaType.trim().toUpperCase();

    final String mainUrl = _cleanUrl(
      widget.mediaUrl.trim(),
    );

    bool carouselHasChildren = false;

    // ==========================================================
    // CAROUSEL ALBUM
    // ==========================================================

    if (mainType == 'CAROUSEL_ALBUM') {
      try {
        dynamic decoded = widget.childrenUrl;

        // ------------------------------------------------------
        // childrenUrl can come as JSON String
        // ------------------------------------------------------

        if (decoded is String) {
          final String value = decoded.trim();

          if (value.isNotEmpty && value.toLowerCase() != 'null') {
            decoded = jsonDecode(value);
          }
        }

        // ------------------------------------------------------
        // childrenUrl should be a List
        // ------------------------------------------------------

        if (decoded is List && decoded.isNotEmpty) {
          for (final item in decoded) {
            if (item is! Map) {
              continue;
            }

            dynamic urlValue = item['media_url'];

            if (urlValue == null) {
              continue;
            }

            String url = urlValue.toString().trim();

            if (url.isEmpty) {
              continue;
            }

            url = _cleanUrl(url);

            if (url.isEmpty) {
              continue;
            }

            final String id = item['id']?.toString() ?? '';

            final String type = _normalizeMediaType(
              item['media_type']?.toString() ?? 'IMAGE',
            );

            items.add({
              'id': id,
              'media_url': url,
              'media_type': type,
            });
          }
        }
      } catch (e) {
        debugPrint(
          'InstagramMediaViewer childrenUrl parse error: $e',
        );
      }

      // --------------------------------------------------------
      // Only treat it as carousel if we actually have children
      // --------------------------------------------------------

      if (items.isNotEmpty) {
        carouselHasChildren = true;
      }
    }

    // ==========================================================
    // FINAL STATE
    // ==========================================================

    if (mounted) {
      setState(() {
        mediaItems = items;
        currentIndex = 0;
        isCarousel = carouselHasChildren;
      });
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
      'Is Carousel: $isCarousel',
    );

    debugPrint(
      'FINAL MEDIA ITEMS: $mediaItems',
    );

    debugPrint(
      'TOTAL MEDIA ITEMS: ${mediaItems.length}',
    );

    debugPrint(
      '============================================',
    );
  }

  // ============================================================
  // CLEAN URL
  // ============================================================

  String _cleanUrl(String url) {
    String cleaned = url.trim();

    if (cleaned.isEmpty) {
      return '';
    }

    // Handle:
    // [https://example.com/image.jpg](https://example.com/image.jpg)

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

    if (value == 'IMAGE') {
      return 'IMAGE';
    }

    // Unknown child type defaults to IMAGE
    return 'IMAGE';
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final String type = widget.mediaType.trim().toUpperCase();

    final String url = _cleanUrl(widget.mediaUrl);

    // ==========================================================
    // CAROUSEL ALBUM
    // ==========================================================

    if (type == 'CAROUSEL_ALBUM') {
      // --------------------------------------------------------
      // Valid children -> PageView
      // --------------------------------------------------------

      if (isCarousel && mediaItems.isNotEmpty) {
        return _buildCarousel();
      }

      // --------------------------------------------------------
      // No children -> fallback to mediaUrl as IMAGE
      // --------------------------------------------------------

      if (url.isNotEmpty) {
        return InstagramImage(
          key: ValueKey(url),
          url: url,
        );
      }

      // No media at all
      return _buildNoMedia();
    }

    // ==========================================================
    // IMAGE
    // ==========================================================

    if (type == 'IMAGE') {
      if (url.isEmpty) {
        return _buildNoMedia();
      }

      return InstagramImage(
        key: ValueKey(url),
        url: url,
      );
    }

    // ==========================================================
    // VIDEO
    // ==========================================================

    if (type == 'VIDEO') {
      if (url.isEmpty) {
        return _buildNoMedia();
      }

      return InstagramVideo(
        key: ValueKey(url),
        url: url,
      );
    }

    // ==========================================================
    // UNKNOWN MEDIA TYPE
    // ==========================================================

    debugPrint(
      'Unknown Instagram media type: ${widget.mediaType}',
    );

    // Safe fallback:
    // If mediaUrl exists, try it as an image.
    if (url.isNotEmpty) {
      return InstagramImage(
        key: ValueKey(url),
        url: url,
      );
    }

    return _buildNoMedia();
  }

  // ============================================================
  // CAROUSEL
  // ============================================================

  Widget _buildCarousel() {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: mediaItems.length,
            onPageChanged: (index) {
              if (!mounted) {
                return;
              }

              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final Map<String, dynamic> item = mediaItems[index];

              final String url = _cleanUrl(
                item['media_url']?.toString() ?? '',
              );

              final String itemType = _normalizeMediaType(
                item['media_type']?.toString() ?? 'IMAGE',
              );

              final String id = item['id']?.toString() ?? '';

              // ------------------------------------------------
              // Invalid child URL
              // ------------------------------------------------

              if (url.isEmpty) {
                return _buildNoMedia();
              }

              // ------------------------------------------------
              // CHILD VIDEO
              // ------------------------------------------------

              if (itemType == 'VIDEO') {
                return InstagramVideo(
                  key: ValueKey(
                    id.isNotEmpty ? id : url,
                  ),
                  url: url,
                );
              }

              // ------------------------------------------------
              // CHILD IMAGE
              // ------------------------------------------------

              return InstagramImage(
                key: ValueKey(
                  id.isNotEmpty ? id : url,
                ),
                url: url,
              );
            },
          ),

          // ====================================================
          // COUNTER
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
          // DOTS
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
                      duration: const Duration(milliseconds: 200),
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
  // NO MEDIA
  // ============================================================

  Widget _buildNoMedia() {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? MediaQuery.of(context).size.width,
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.white70,
          size: 40,
        ),
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

// =================================================================
// IMAGE WIDGET
// =================================================================

class InstagramImage extends StatelessWidget {
  const InstagramImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    // ------------------------------------------------------------
    // Invalid URL
    // ------------------------------------------------------------

    if (url.trim().isEmpty) {
      return _imageErrorWidget(
        message: 'Invalid image URL',
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Image.network(
        url,
        fit: BoxFit.cover,

        // ========================================================
        // LOADING
        // ========================================================

        loadingBuilder: (
          context,
          child,
          loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }

          double? progress;

          if (loadingProgress.expectedTotalBytes != null) {
            progress = loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!;
          }

          return Center(
            child: SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 2.5,
                color: Colors.white,
              ),
            ),
          );
        },

        // ========================================================
        // ERROR
        // ========================================================

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

          return _imageErrorWidget(
            message: 'Unable to load image',
          );
        },
      ),
    );
  }

  Widget _imageErrorWidget({
    required String message,
  }) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.broken_image_outlined,
              color: Colors.white70,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// =================================================================
// VIDEO WIDGET
// =================================================================

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
  VideoPlayerController? controller;

  bool initialized = false;
  bool loading = true;
  bool hasError = false;
  bool showControls = true;

  String errorMessage = 'Unable to load video';

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  // ============================================================
  // INITIALIZE VIDEO
  // ============================================================

  Future<void> _initialize() async {
    final String url = widget.url.trim();

    // ------------------------------------------------------------
    // Invalid URL
    // ------------------------------------------------------------

    if (url.isEmpty) {
      _setError(
        'Invalid video URL',
      );
      return;
    }

    try {
      final Uri uri = Uri.tryParse(url) ?? Uri();

      if (!uri.hasScheme || (!uri.scheme.startsWith('http'))) {
        _setError(
          'Invalid video URL',
        );
        return;
      }

      final VideoPlayerController newController =
          VideoPlayerController.networkUrl(uri);

      controller = newController;

      await newController.initialize();

      if (!mounted) {
        newController.dispose();
        return;
      }

      await newController.setLooping(true);

      if (!mounted) {
        return;
      }

      setState(() {
        initialized = true;
        loading = false;
        hasError = false;
      });

      await newController.play();
    } catch (e) {
      debugPrint(
        'Instagram video error: $e',
      );

      debugPrint(
        'Instagram video URL: ${widget.url}',
      );

      _setError(
        'Unable to load video',
      );
    }
  }

  // ============================================================
  // SET ERROR
  // ============================================================

  void _setError(String message) {
    if (!mounted) {
      return;
    }

    setState(() {
      loading = false;
      initialized = false;
      hasError = true;
      errorMessage = message;
    });
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    // ----------------------------------------------------------
    // ERROR
    // ----------------------------------------------------------

    if (hasError) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.videocam_off_outlined,
                color: Colors.white70,
                size: 40,
              ),
              const SizedBox(height: 8),
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    // ----------------------------------------------------------
    // LOADING
    // ----------------------------------------------------------

    if (loading || !initialized || controller == null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    final VideoPlayerController videoController = controller!;

    // ----------------------------------------------------------
    // VIDEO
    // ----------------------------------------------------------

    return GestureDetector(
      onTap: () {
        if (!mounted) {
          return;
        }

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
                aspectRatio: videoController.value.aspectRatio,
                child: VideoPlayer(
                  videoController,
                ),
              ),
            ),

            // ==================================================
            // PLAY / PAUSE
            // ==================================================

            if (showControls)
              IconButton(
                onPressed: () {
                  if (!mounted) {
                    return;
                  }

                  setState(() {
                    if (videoController.value.isPlaying) {
                      videoController.pause();
                    } else {
                      videoController.play();
                    }
                  });
                },
                iconSize: 55,
                color: Colors.white,
                icon: Icon(
                  videoController.value.isPlaying
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
              ),

            // ==================================================
            // PROGRESS
            // ==================================================

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: VideoProgressIndicator(
                videoController,
                allowScrubbing: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                colors: const VideoProgressColors(
                  playedColor: Colors.white,
                  bufferedColor: Colors.white54,
                  backgroundColor: Colors.white24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }
}
