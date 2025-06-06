// models/semicircle_models.dart
import 'package:flutter/material.dart';
import '../constants.dart';

/// Model for semicircle chart examples/demos
class SemicircleExample {
  final String title;
  final String description;
  final double percentage;
  final Color activeColor;
  final Color inactiveColor;
  final String category;
  final Map<String, dynamic>? metadata;

  const SemicircleExample({
    required this.title,
    required this.description,
    required this.percentage,
    required this.activeColor,
    required this.inactiveColor,
    this.category = 'general',
    this.metadata,
  });
}

/// Model for property documentation
class SemicirclePropertyInfo {
  final String name;
  final String type;
  final String description;
  final bool required;
  final String? example;
  final String? defaultValue;

  const SemicirclePropertyInfo({
    required this.name,
    required this.type,
    required this.description,
    this.required = false,
    this.example,
    this.defaultValue,
  });
}

/// Model for property sections/categories
class SemicirclePropertySection {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<SemicirclePropertyInfo> properties;

  const SemicirclePropertySection({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.properties,
  });
}

/// Model for code examples
class SemicircleCodeExample {
  final String title;
  final String description;
  final String code;
  final String category;

  const SemicircleCodeExample({
    required this.title,
    required this.description,
    required this.code,
    this.category = 'basic',
  });
}

/// Semicircle chart configuration state - COMPREHENSIVE CONFIGURATION
class SemicircleConfig {
  // Basic properties
  final double percentage;
  final double size;
  final double hollowRadius;

  // Styling
  final Color activeColor;
  final Color inactiveColor;
  final Color? textColor;
  final Color backgroundColor; // Add background color

  // Animation properties
  final Duration animationDuration;
  final Curve animationCurve;
  final bool enableAnimation;

  // Display options
  final bool showPercentageText;
  final bool showLegend;

  // Text styling
  final TextStyle? percentageStyle;
  final TextStyle? legendStyle;

  // Custom formatters
  final String Function(double percentage)? percentageFormatter;
  final String Function(String type, double value)? legendFormatter;

  const SemicircleConfig({
    // Default values
    this.percentage = 75.0,
    this.size = 280.0,
    this.hollowRadius = 0.6, // Changed from 0.65 to be within safe range
    // Default styling
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.border,
    this.textColor,
    this.backgroundColor = Colors.transparent, // Add default
    // Animation defaults
    this.animationDuration = const Duration(milliseconds: 1500),
    this.animationCurve = Curves.easeInOut,
    this.enableAnimation = true,

    // Display defaults
    this.showPercentageText = true,
    this.showLegend = true,

    // Text styling defaults
    this.percentageStyle,
    this.legendStyle,

    // Formatter defaults
    this.percentageFormatter,
    this.legendFormatter,
  });

  SemicircleConfig copyWith({
    double? percentage,
    double? size,
    double? hollowRadius,
    Color? activeColor,
    Color? inactiveColor,
    Color? textColor,
    Color? backgroundColor, // Add to copyWith
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableAnimation,
    bool? showPercentageText,
    bool? showLegend,
    TextStyle? percentageStyle,
    TextStyle? legendStyle,
    String Function(double)? percentageFormatter,
    String Function(String, double)? legendFormatter,
  }) {
    return SemicircleConfig(
      percentage: percentage ?? this.percentage,
      size: size ?? this.size,
      hollowRadius: (hollowRadius ?? this.hollowRadius).clamp(
        0.3,
        0.85,
      ), // Clamp to safe range
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      textColor: textColor ?? this.textColor,
      backgroundColor:
          backgroundColor ?? this.backgroundColor, // Add to copyWith
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      showPercentageText: showPercentageText ?? this.showPercentageText,
      showLegend: showLegend ?? this.showLegend,
      percentageStyle: percentageStyle ?? this.percentageStyle,
      legendStyle: legendStyle ?? this.legendStyle,
      percentageFormatter: percentageFormatter ?? this.percentageFormatter,
      legendFormatter: legendFormatter ?? this.legendFormatter,
    );
  }
}

/// Animation curve option model
class SemicircleCurveOption {
  final String name;
  final Curve curve;

  const SemicircleCurveOption({required this.name, required this.curve});
}

/// Animation duration option model
class SemicircleDurationOption {
  final String name;
  final Duration duration;

  const SemicircleDurationOption({required this.name, required this.duration});
}

/// Formatter option model
class FormatterOption {
  final String name;
  final String Function(double) formatter;

  const FormatterOption({required this.name, required this.formatter});
}
