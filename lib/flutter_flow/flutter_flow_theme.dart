// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color gradient1;
  late Color gradient2;
  late Color containerClr;
  late Color visualClr;
  late Color backBtnClr;
  late Color backIconClr;
  late Color headingClr;
  late Color dotClr;
  late Color privacyClr;
  late Color borderClr;
  late Color dividerClr;
  late Color choiceClr;
  late Color progressBackClr;
  late Color hintClr;
  late Color conBorderClr;
  late Color iconClr;
  late Color chatClr;

  FFDesignTokens get designToken => FFDesignTokens(this);

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFF2A000);
  late Color secondary = const Color(0xFF1A2435);
  late Color tertiary = const Color(0xFFC9964A);
  late Color alternate = const Color(0xFFABABAB);
  late Color primaryText = const Color(0xFF111111);
  late Color secondaryText = const Color(0xFF555555);
  late Color primaryBackground = const Color(0xFF081018);
  late Color secondaryBackground = const Color(0xFFF4F2EA);
  late Color accent1 = const Color(0xFF000000);
  late Color accent2 = const Color(0xFFFFF4E2);
  late Color accent3 = const Color(0xFFA9A497);
  late Color accent4 = const Color(0xFFD29B48);
  late Color success = const Color(0xFF2E7D32);
  late Color warning = const Color(0xFFFAF7FB);
  late Color error = const Color(0xFFE60000);
  late Color info = const Color(0xFFFFFFFF);

  late Color gradient1 = const Color(0xFFF4A300);
  late Color gradient2 = const Color(0xFFE88E00);
  late Color containerClr = const Color(0xFFF6F6F2);
  late Color visualClr = const Color(0xFF374B6C);
  late Color backBtnClr = const Color(0x4D3B1E2C);
  late Color backIconClr = const Color(0xFF9E9CB0);
  late Color headingClr = const Color(0xFFD4A25A);
  late Color dotClr = const Color(0xFF34C759);
  late Color privacyClr = const Color(0xFF040913);
  late Color borderClr = const Color(0xFF252E3D);
  late Color dividerClr = const Color(0x80D7A94F);
  late Color choiceClr = const Color(0xFF0D1625);
  late Color progressBackClr = const Color(0xFF9A9A9A);
  late Color hintClr = const Color(0xFFA3A3A3);
  late Color conBorderClr = const Color(0x808D9298);
  late Color iconClr = const Color(0xFF4F4F4F);
  late Color chatClr = const Color(0xFFF8F8FC);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Playfair';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.playfair(
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
        height: 1.12,
      );
  String get displayMediumFamily => 'Playfair';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.playfair(
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
        height: 1.16,
      );
  String get displaySmallFamily => 'Playfair';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.playfair(
        fontWeight: FontWeight.normal,
        fontSize: 36.0,
        height: 1.22,
      );
  String get headlineLargeFamily => 'Playfair';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.playfair(
        fontWeight: FontWeight.bold,
        fontSize: 34.0,
        height: 1.1,
      );
  String get headlineMediumFamily => 'Playfair';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.playfair(
        fontWeight: FontWeight.bold,
        fontSize: 28.0,
        height: 1.1,
      );
  String get headlineSmallFamily => 'Playfair';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.playfair(
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
        height: 1.33,
      );
  String get titleLargeFamily => 'Playfair';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.playfair(
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        height: 1.2,
      );
  String get titleMediumFamily => 'Playfair';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.playfair(
        fontWeight: FontWeight.w600,
        fontSize: 17.0,
        height: 1.2,
      );
  String get titleSmallFamily => 'Playfair';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.playfair(
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        height: 1.43,
      );
  String get labelLargeFamily => 'Playfair';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.playfair(
        fontWeight: FontWeight.w600,
        fontSize: 15.0,
        height: 1.2,
      );
  String get labelMediumFamily => 'Playfair';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.playfair(
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
        height: 1.2,
      );
  String get labelSmallFamily => 'Playfair';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.playfair(
        fontWeight: FontWeight.bold,
        fontSize: 11.0,
        height: 1.1,
      );
  String get bodyLargeFamily => 'Playfair';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.playfair(
        fontWeight: FontWeight.normal,
        fontSize: 17.0,
        height: 1.5,
      );
  String get bodyMediumFamily => 'Playfair';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.playfair(
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
        height: 1.5,
      );
  String get bodySmallFamily => 'Playfair';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.playfair(
        fontWeight: FontWeight.normal,
        fontSize: 13.0,
        height: 1.4,
      );
}

class FFDesignTokens {
  const FFDesignTokens(this.theme);
  final FlutterFlowTheme theme;
  FFSpacing get spacing => const FFSpacing();
  FFRadius get radius => const FFRadius();
  FFShadows get shadow => FFShadows(theme);
}

class FFSpacing {
  const FFSpacing();
  double get none => 0.0;
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 32.0;
  double get xl => 64.0;
  double get xxl => 48.0;
  double get xxxl => 64.0;
}

class FFRadius {
  const FFRadius();
  double get none => 0.0;
  double get xs => 2.0;
  double get sm => 0.0;
  double get md => 0.0;
  double get lg => 0.0;
  double get xl => 24.0;
  double get xxl => 32.0;
  double get full => 0.0;
}

class FFShadows {
  const FFShadows(this.theme);
  final FlutterFlowTheme theme;
  BoxShadow get none => const BoxShadow(
      blurRadius: 0.0,
      color: const Color(0x00000000),
      offset: const Offset(0.0, 0.0),
      spreadRadius: 0.0);
  BoxShadow get xs => const BoxShadow(
      blurRadius: 1.0,
      color: const Color(0x1A000000),
      offset: const Offset(0.0, 1.0),
      spreadRadius: 0.0);
  BoxShadow get sm => const BoxShadow(
      blurRadius: 0.0,
      color: const Color(0x1A000000),
      offset: const Offset(0.0, 1.0),
      spreadRadius: 0.0);
  BoxShadow get md => const BoxShadow(
      blurRadius: 0.0,
      color: const Color(0x26000000),
      offset: const Offset(0.0, 2.0),
      spreadRadius: 0.0);
  BoxShadow get lg => const BoxShadow(
      blurRadius: 0.0,
      color: const Color(0x33000000),
      offset: const Offset(0.0, 4.0),
      spreadRadius: 0.0);
  BoxShadow get xl => const BoxShadow(
      blurRadius: 0.0,
      color: const Color(0x40000000),
      offset: const Offset(0.0, 8.0),
      spreadRadius: 0.0);
  BoxShadow get xxl => const BoxShadow(
      blurRadius: 24.0,
      color: const Color(0x1A000000),
      offset: const Offset(0.0, 12.0),
      spreadRadius: 0.0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null && fontFamily.isNotEmpty) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
