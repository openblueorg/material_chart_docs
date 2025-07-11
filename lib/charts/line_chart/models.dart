// models/chart_models.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';

/// Model for chart examples/demos
class ChartExample {
  final String title;
  final String description;
  final List<ChartData> data;
  final Color color;
  final String category;
  final Map<String, dynamic>? metadata;

  const ChartExample({
    required this.title,
    required this.description,
    required this.data,
    required this.color,
    this.category = 'general',
    this.metadata,
  });
}

/// Model for property documentation
class PropertyInfo {
  final String name;
  final String type;
  final String description;
  final bool required;
  final String? example;
  final String? defaultValue;

  const PropertyInfo({
    required this.name,
    required this.type,
    required this.description,
    this.required = false,
    this.example,
    this.defaultValue,
  });
}

/// Model for property sections/categories
class PropertySection {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<PropertyInfo> properties;

  const PropertySection({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.properties,
  });
}

/// Model for code examples
class CodeExample {
  final String title;
  final String description;
  final String code;
  final String category;

  const CodeExample({
    required this.title,
    required this.description,
    required this.code,
    this.category = 'basic',
  });
}

/// Chart configuration state - ENHANCED WITH NEW PROPERTIES
class ChartConfig {
  final double strokeWidth;
  final double pointRadius;
  final bool showPoints;
  final bool showGrid;
  final Color lineColor;
  final Color pointColor;
  final Color gridColor;
  final Color backgroundColor;

  // Animation properties
  final Duration animationDuration;
  final Curve animationCurve;
  final bool enableAnimation;

  // NEW: Curved line properties
  final bool useCurvedLines;
  final double curveIntensity;
  final bool roundedPoints;

  // NEW: Tooltip properties
  final bool showTooltips;
  final Color tooltipBackgroundColor;
  final Color tooltipBorderColor;
  final double tooltipBorderRadius;
  final Color tooltipTextColor;

  // NEW: Hover line properties
  final Color verticalLineColor;
  final double verticalLineWidth;
  final LineStyle verticalLineStyle;
  final double verticalLineOpacity;

  const ChartConfig({
    this.strokeWidth = 3.0,
    this.pointRadius = 6.0,
    this.showPoints = true,
    this.showGrid = true,
    this.lineColor = AppColors.primary,
    this.pointColor = AppColors.primary,
    this.gridColor = AppColors.border,
    this.backgroundColor = Colors.transparent,

    // Animation defaults
    this.animationDuration = const Duration(milliseconds: 2000),
    this.animationCurve = Curves.easeOutCubic,
    this.enableAnimation = true,

    // NEW: Curved line defaults
    this.useCurvedLines = false,
    this.curveIntensity = 0.3,
    this.roundedPoints = true,

    // NEW: Tooltip defaults
    this.showTooltips = true,
    this.tooltipBackgroundColor = Colors.white,
    this.tooltipBorderColor = Colors.grey,
    this.tooltipBorderRadius = 8.0,
    this.tooltipTextColor = Colors.black87,

    // NEW: Hover line defaults
    this.verticalLineColor = AppColors.primary,
    this.verticalLineWidth = 1.0,
    this.verticalLineStyle = LineStyle.solid,
    this.verticalLineOpacity = 0.7,
  });

  ChartConfig copyWith({
    double? strokeWidth,
    double? pointRadius,
    bool? showPoints,
    bool? showGrid,
    Color? lineColor,
    Color? pointColor,
    Color? gridColor,
    Color? backgroundColor,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableAnimation,
    bool? useCurvedLines,
    double? curveIntensity,
    bool? roundedPoints,
    bool? showTooltips,
    Color? tooltipBackgroundColor,
    Color? tooltipBorderColor,
    double? tooltipBorderRadius,
    Color? tooltipTextColor,
    Color? verticalLineColor,
    double? verticalLineWidth,
    LineStyle? verticalLineStyle,
    double? verticalLineOpacity,
  }) {
    return ChartConfig(
      strokeWidth: strokeWidth ?? this.strokeWidth,
      pointRadius: pointRadius ?? this.pointRadius,
      showPoints: showPoints ?? this.showPoints,
      showGrid: showGrid ?? this.showGrid,
      lineColor: lineColor ?? this.lineColor,
      pointColor: pointColor ?? this.pointColor,
      gridColor: gridColor ?? this.gridColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      useCurvedLines: useCurvedLines ?? this.useCurvedLines,
      curveIntensity: curveIntensity ?? this.curveIntensity,
      roundedPoints: roundedPoints ?? this.roundedPoints,
      showTooltips: showTooltips ?? this.showTooltips,
      tooltipBackgroundColor:
          tooltipBackgroundColor ?? this.tooltipBackgroundColor,
      tooltipBorderColor: tooltipBorderColor ?? this.tooltipBorderColor,
      tooltipBorderRadius: tooltipBorderRadius ?? this.tooltipBorderRadius,
      tooltipTextColor: tooltipTextColor ?? this.tooltipTextColor,
      verticalLineColor: verticalLineColor ?? this.verticalLineColor,
      verticalLineWidth: verticalLineWidth ?? this.verticalLineWidth,
      verticalLineStyle: verticalLineStyle ?? this.verticalLineStyle,
      verticalLineOpacity: verticalLineOpacity ?? this.verticalLineOpacity,
    );
  }
}

/// Animation curve option model
class CurveOption {
  final String name;
  final Curve curve;

  const CurveOption({required this.name, required this.curve});
}

/// Animation duration option model
class DurationOption {
  final String name;
  final Duration duration;

  const DurationOption({required this.name, required this.duration});
}

/// NEW: Line style option model
class LineStyleOption {
  final String name;
  final LineStyle style;

  const LineStyleOption({required this.name, required this.style});
}
