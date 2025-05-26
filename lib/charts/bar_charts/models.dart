// lib/charts/bar_chart/models.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';

/// Model for bar chart examples/demos
class BarChartExample {
  final String title;
  final String description;
  final List<BarChartData> data;
  final Color color;
  final String category;
  final Map<String, dynamic>? metadata;

  const BarChartExample({
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

/// Bar chart configuration state
class BarChartConfig {
  final double barSpacing;
  final double cornerRadius;
  final bool showGrid;
  final bool showValues;
  final bool interactive;
  final bool gradientEffect;
  final Color barColor;
  final Color gridColor;
  final Color backgroundColor;
  final List<Color>? gradientColors;

  const BarChartConfig({
    this.barSpacing = 0.3,
    this.cornerRadius = 8.0,
    this.showGrid = true,
    this.showValues = true,
    this.interactive = true,
    this.gradientEffect = false,
    this.barColor = AppColors.primary,
    this.gridColor = AppColors.border,
    this.backgroundColor = Colors.transparent,
    this.gradientColors,
  });

  BarChartConfig copyWith({
    double? barSpacing,
    double? cornerRadius,
    bool? showGrid,
    bool? showValues,
    bool? interactive,
    bool? gradientEffect,
    Color? barColor,
    Color? gridColor,
    Color? backgroundColor,
    List<Color>? gradientColors,
  }) {
    return BarChartConfig(
      barSpacing: barSpacing ?? this.barSpacing,
      cornerRadius: cornerRadius ?? this.cornerRadius,
      showGrid: showGrid ?? this.showGrid,
      showValues: showValues ?? this.showValues,
      interactive: interactive ?? this.interactive,
      gradientEffect: gradientEffect ?? this.gradientEffect,
      barColor: barColor ?? this.barColor,
      gridColor: gridColor ?? this.gridColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      gradientColors: gradientColors ?? this.gradientColors,
    );
  }
}
