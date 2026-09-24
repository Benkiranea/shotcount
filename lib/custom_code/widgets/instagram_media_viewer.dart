// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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
  final String? childrenUrl;

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

  void _prepareMedia() {
    List<Map<String, dynamic>> items = [];

    // CAROUSEL
    if (widget.mediaType.toUpperCase() == 'CAROUSEL_ALBUM' &&
        widget.childrenUrl != null &&
        widget.childrenUrl!.trim().isNotEmpty &&
        widget.childrenUrl != 'null') {
      try {
        final decoded = jsonDecode(widget.childrenUrl!);

        if (decoded is List) {
          for (final item in decoded) {
            if (item is Map) {
              final url = item['media_url'];

              if (url != null && url.toString().trim().isNotEmpty) {
                items.add({
                  'id': item['id']?.toString() ?? '',
                  'media_url': url.toString(),
                  'media_type':
                      item['media_type']?.toString().toUpperCase() ?? 'IMAGE',
                });
              }
            }
          }
        }
      } catch (e) {
        debugPrint(
          'childrenUrl JSON error: $e',
        );
      }
    }

    // NORMAL IMAGE / FALLBACK
    if (items.isEmpty && widget.mediaUrl.trim().isNotEmpty) {
      items.add({
        'id': '',
        'media_url': widget.mediaUrl,
        'media_type': 'IMAGE',
      });
    }

    if (mounted) {
      setState(() {
        mediaItems = items;
        currentIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: mediaItems.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = mediaItems[index];

              final String url = item['media_url'];

              final String type = item['media_type'];

              if (type == 'VIDEO') {
                return InstagramVideo(
                  url: url,
                );
              }

              return InstagramImage(
                url: url,
              );
            },
          ),

          // 1 / 3 indicator
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

          // Instagram dots
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
                    final selected = index == currentIndex;

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// --------------------------------------------------
// IMAGE
// --------------------------------------------------

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
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
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

// --------------------------------------------------
// VIDEO
// --------------------------------------------------

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

  Future<void> _initialize() async {
    try {
      await controller.initialize();

      if (!mounted) return;

      controller.setLooping(true);

      setState(() {
        initialized = true;
      });

      controller.play();
    } catch (e) {
      debugPrint(
        'Video error: $e',
      );
    }
  }

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
            Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
