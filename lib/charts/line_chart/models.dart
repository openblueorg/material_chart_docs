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

/// Chart configuration state
class ChartConfig {
  final double strokeWidth;
  final double pointRadius;
  final bool showPoints;
  final bool showGrid;
  final Color lineColor;
  final Color pointColor;
  final Color gridColor;
  final Color backgroundColor;

  const ChartConfig({
    this.strokeWidth = 3.0,
    this.pointRadius = 6.0,
    this.showPoints = true,
    this.showGrid = true,
    this.lineColor = AppColors.primary,
    this.pointColor = AppColors.primary,
    this.gridColor = AppColors.border,
    this.backgroundColor = Colors.transparent,
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
    );
  }
}
