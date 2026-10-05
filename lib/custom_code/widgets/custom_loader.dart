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

import 'dart:math' as math;

/// Set your widget name, define your parameter, and then add the boilerplate
/// code using the `</>` button on the right!
class CustomLoader extends StatefulWidget {
  const CustomLoader({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = math.min(
      widget.width ?? 48,
      widget.height ?? 48,
    );

    return SizedBox(
      width: widget.width ?? 48,
      height: widget.height ?? 48,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(size, size),
            painter: _LoaderPainter(
              progress: _controller.value,
            ),
          );
        },
      ),
    );
  }
}

class _LoaderPainter extends CustomPainter {
  final double progress;

  _LoaderPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 6.0;

    final Offset center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final double radius = (math.min(size.width, size.height) - strokeWidth) / 2;

    // Background ring
    final Paint backgroundPaint = Paint()
      ..color = const Color(0xFFE8ECEF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(
      center,
      radius,
      backgroundPaint,
    );

    // Teal animated arc
    final Paint progressPaint = Paint()
      ..color = const Color(0xFF159A9C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const double arcLength = math.pi * 0.55;

    final double startAngle = (-math.pi / 2) + (progress * math.pi * 2);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      startAngle,
      arcLength,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _LoaderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
