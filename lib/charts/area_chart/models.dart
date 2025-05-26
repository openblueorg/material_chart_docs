// lib/charts/area_chart/models.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';

/// Model for area chart examples/demos
class AreaChartExample {
  final String title;
  final String description;
  final List<AreaChartSeries> series;
  final String category;
  final Map<String, dynamic>? metadata;

  const AreaChartExample({
    required this.title,
    required this.description,
    required this.series,
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

/// Area chart configuration state
class AreaChartConfig {
  final double lineWidth;
  final double pointSize;
  final double fillOpacity;
  final bool showPoints;
  final bool showGrid;
  final bool showLegend;
  final bool useCustomColors;
  final Color primaryColor;
  final Color gridColor;
  final Color backgroundColor;
  final double animationSpeed;
  final Curve animationCurve;
  final bool enableAnimation;

  const AreaChartConfig({
    this.lineWidth = 3.0,
    this.pointSize = 6.0,
    this.fillOpacity = 0.3,
    this.showPoints = true,
    this.showGrid = true,
    this.showLegend = true,
    this.useCustomColors = false,
    this.primaryColor = AppColors.primary,
    this.gridColor = AppColors.border,
    this.backgroundColor = Colors.transparent,
    this.animationSpeed = 1.0,
    this.animationCurve = Curves.easeOutCubic,
    this.enableAnimation = true,
  });

  AreaChartConfig copyWith({
    double? lineWidth,
    double? pointSize,
    double? fillOpacity,
    bool? showPoints,
    bool? showGrid,
    bool? showLegend,
    bool? useCustomColors,
    Color? primaryColor,
    Color? gridColor,
    Color? backgroundColor,
    double? animationSpeed,
    Curve? animationCurve,
    bool? enableAnimation,
  }) {
    return AreaChartConfig(
      lineWidth: lineWidth ?? this.lineWidth,
      pointSize: pointSize ?? this.pointSize,
      fillOpacity: fillOpacity ?? this.fillOpacity,
      showPoints: showPoints ?? this.showPoints,
      showGrid: showGrid ?? this.showGrid,
      showLegend: showLegend ?? this.showLegend,
      useCustomColors: useCustomColors ?? this.useCustomColors,
      primaryColor: primaryColor ?? this.primaryColor,
      gridColor: gridColor ?? this.gridColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      animationSpeed: animationSpeed ?? this.animationSpeed,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
    );
  }
}

/// Animation curve option model
class CurveOption {
  final String name;
  final Curve curve;

  const CurveOption({required this.name, required this.curve});
}