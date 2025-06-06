// multiline_models.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';

/// Model for multi-line chart examples/demos
class MultiLineChartExample {
  final String title;
  final String description;
  final List<ChartSeries> series;
  final String category;
  final Map<String, dynamic>? metadata;

  const MultiLineChartExample({
    required this.title,
    required this.description,
    required this.series,
    this.category = 'general',
    this.metadata,
  });
}

/// Model for property documentation
class MultiLinePropertyInfo {
  final String name;
  final String type;
  final String description;
  final bool required;
  final String? example;
  final String? defaultValue;

  const MultiLinePropertyInfo({
    required this.name,
    required this.type,
    required this.description,
    this.required = false,
    this.example,
    this.defaultValue,
  });
}

/// Model for property sections/categories
class MultiLinePropertySection {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<MultiLinePropertyInfo> properties;

  const MultiLinePropertySection({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.properties,
  });
}

/// Model for code examples
class MultiLineCodeExample {
  final String title;
  final String description;
  final String code;
  final String category;

  const MultiLineCodeExample({
    required this.title,
    required this.description,
    required this.code,
    this.category = 'basic',
  });
}

/// Multi-line chart configuration state
class MultiLineChartConfig {
  final List<Color> colors;
  final double defaultLineWidth;
  final double defaultPointSize;
  final bool showPoints;
  final bool showGrid;
  final bool showLegend;
  final bool smoothLines;
  final Color gridColor;
  final Color backgroundColor;
  final LegendPosition legendPosition;
  final bool forceYAxisFromZero;
  final double gridLineWidth;
  final int horizontalGridLines;
  
  // Animation properties
  final Duration animationDuration;
  final Curve animationCurve;
  final bool enableAnimation;
  
  // Crosshair properties
  final bool enableCrosshair;
  final bool showCrosshairLabels;
  final Color crosshairColor;
  final double crosshairWidth;
  
  // Tooltip properties
  final Color tooltipBackgroundColor;
  final Color tooltipTextColor;
  final double tooltipPadding;
  final double tooltipBorderRadius;
  
  // Interaction properties
  final bool enableZoom;
  final bool enablePan;

  const MultiLineChartConfig({
    this.colors = const [
      AppColors.primary,
      AppColors.accent,
      AppColors.primaryLight,
      AppColors.accentLight,
    ],
    this.defaultLineWidth = 3.0,
    this.defaultPointSize = 6.0,
    this.showPoints = true,
    this.showGrid = true,
    this.showLegend = true,
    this.smoothLines = false,
    this.gridColor = AppColors.border,
    this.backgroundColor = Colors.transparent,
    this.legendPosition = LegendPosition.bottom,
    this.forceYAxisFromZero = false,
    this.gridLineWidth = 1.0,
    this.horizontalGridLines = 5,
    
    // Animation defaults
    this.animationDuration = const Duration(milliseconds: 2000),
    this.animationCurve = Curves.easeOutCubic,
    this.enableAnimation = true,
    
    // Crosshair defaults
    this.enableCrosshair = true,
    this.showCrosshairLabels = true,
    this.crosshairColor = Colors.grey,
    this.crosshairWidth = 1.0,
    
    // Tooltip defaults
    this.tooltipBackgroundColor = Colors.black,
    this.tooltipTextColor = Colors.white,
    this.tooltipPadding = 8.0,
    this.tooltipBorderRadius = 4.0,
    
    // Interaction defaults
    this.enableZoom = false,
    this.enablePan = false,
  });

  MultiLineChartConfig copyWith({
    List<Color>? colors,
    double? defaultLineWidth,
    double? defaultPointSize,
    bool? showPoints,
    bool? showGrid,
    bool? showLegend,
    bool? smoothLines,
    Color? gridColor,
    Color? backgroundColor,
    LegendPosition? legendPosition,
    bool? forceYAxisFromZero,
    double? gridLineWidth,
    int? horizontalGridLines,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableAnimation,
    bool? enableCrosshair,
    bool? showCrosshairLabels,
    Color? crosshairColor,
    double? crosshairWidth,
    Color? tooltipBackgroundColor,
    Color? tooltipTextColor,
    double? tooltipPadding,
    double? tooltipBorderRadius,
    bool? enableZoom,
    bool? enablePan,
  }) {
    return MultiLineChartConfig(
      colors: colors ?? this.colors,
      defaultLineWidth: defaultLineWidth ?? this.defaultLineWidth,
      defaultPointSize: defaultPointSize ?? this.defaultPointSize,
      showPoints: showPoints ?? this.showPoints,
      showGrid: showGrid ?? this.showGrid,
      showLegend: showLegend ?? this.showLegend,
      smoothLines: smoothLines ?? this.smoothLines,
      gridColor: gridColor ?? this.gridColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      legendPosition: legendPosition ?? this.legendPosition,
      forceYAxisFromZero: forceYAxisFromZero ?? this.forceYAxisFromZero,
      gridLineWidth: gridLineWidth ?? this.gridLineWidth,
      horizontalGridLines: horizontalGridLines ?? this.horizontalGridLines,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      enableCrosshair: enableCrosshair ?? this.enableCrosshair,
      showCrosshairLabels: showCrosshairLabels ?? this.showCrosshairLabels,
      crosshairColor: crosshairColor ?? this.crosshairColor,
      crosshairWidth: crosshairWidth ?? this.crosshairWidth,
      tooltipBackgroundColor: tooltipBackgroundColor ?? this.tooltipBackgroundColor,
      tooltipTextColor: tooltipTextColor ?? this.tooltipTextColor,
      tooltipPadding: tooltipPadding ?? this.tooltipPadding,
      tooltipBorderRadius: tooltipBorderRadius ?? this.tooltipBorderRadius,
      enableZoom: enableZoom ?? this.enableZoom,
      enablePan: enablePan ?? this.enablePan,
    );
  }
}

/// Animation curve option model
class MultiLineCurveOption {
  final String name;
  final Curve curve;

  const MultiLineCurveOption({required this.name, required this.curve});
}

/// Animation duration option model
class MultiLineDurationOption {
  final String name;
  final Duration duration;

  const MultiLineDurationOption({required this.name, required this.duration});
}

/// Color set option for series
class ColorSetOption {
  final String name;
  final List<Color> colors;

  const ColorSetOption({required this.name, required this.colors});
}

/// Legend position option
class LegendPositionOption {
  final String name;
  final LegendPosition position;
  final IconData icon;

  const LegendPositionOption({
    required this.name,
    required this.position,
    required this.icon,
  });
}