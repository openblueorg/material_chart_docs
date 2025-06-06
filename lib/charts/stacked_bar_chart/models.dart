// stackedbar_models.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';

/// Model for stacked bar chart examples/demos
class StackedBarChartExample {
  final String title;
  final String description;
  final List<StackedBarData> data;
  final String category;
  final Map<String, dynamic>? metadata;

  const StackedBarChartExample({
    required this.title,
    required this.description,
    required this.data,
    this.category = 'general',
    this.metadata,
  });
}

/// Model for property documentation
class StackedBarPropertyInfo {
  final String name;
  final String type;
  final String description;
  final bool required;
  final String? example;
  final String? defaultValue;

  const StackedBarPropertyInfo({
    required this.name,
    required this.type,
    required this.description,
    this.required = false,
    this.example,
    this.defaultValue,
  });
}

/// Model for property sections/categories
class StackedBarPropertySection {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<StackedBarPropertyInfo> properties;

  const StackedBarPropertySection({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.properties,
  });
}

/// Model for code examples
class StackedBarCodeExample {
  final String title;
  final String description;
  final String code;
  final String category;

  const StackedBarCodeExample({
    required this.title,
    required this.description,
    required this.code,
    this.category = 'basic',
  });
}

/// Stacked bar chart configuration state
class StackedBarChartConfig {
  // Bar styling
  final double barSpacing;
  final double cornerRadius;
  final double chartPadding;

  // Display options
  final bool showGrid;
  final bool showValues;
  final bool enableInteraction;
  final int horizontalGridLines;

  // Y-Axis configuration
  final bool showYAxis;
  final bool showAxisLine;
  final bool showYAxisGridLines;
  final int yAxisDivisions;
  final double yAxisWidth;
  final String Function(double)? yAxisFormatter;

  // Colors
  final List<Color> segmentColors;
  final Color gridColor;
  final Color backgroundColor;

  // Text styling
  final Color labelTextColor;
  final Color valueTextColor;
  final Color yAxisTextColor;
  final double labelFontSize;
  final double valueFontSize;
  final double yAxisFontSize;

  // Animation properties
  final Duration animationDuration;
  final Curve animationCurve;
  final bool enableAnimation;

  const StackedBarChartConfig({
    // Bar styling defaults
    this.barSpacing = 0.35,
    this.cornerRadius = 16.0,
    this.chartPadding = 24.0,

    // Display options defaults
    this.showGrid = true,
    this.showValues = true,
    this.enableInteraction = true,
    this.horizontalGridLines = 5,

    // Y-Axis defaults
    this.showYAxis = false,
    this.showAxisLine = true,
    this.showYAxisGridLines = true,
    this.yAxisDivisions = 5,
    this.yAxisWidth = 50.0,
    this.yAxisFormatter,

    // Color defaults
    this.segmentColors = const [
      AppColors.primary,
      AppColors.accent,
      AppColors.primaryLight,
      AppColors.accentLight,
    ],
    this.gridColor = AppColors.border,
    this.backgroundColor = Colors.transparent,

    // Text styling defaults
    this.labelTextColor = AppColors.textSecondary,
    this.valueTextColor = Colors.white,
    this.yAxisTextColor = AppColors.textSecondary,
    this.labelFontSize = 12.0,
    this.valueFontSize = 11.0,
    this.yAxisFontSize = 10.0,

    // Animation defaults
    this.animationDuration = const Duration(milliseconds: 1500),
    this.animationCurve = Curves.easeInOut,
    this.enableAnimation = true,
  });

  StackedBarChartConfig copyWith({
    double? barSpacing,
    double? cornerRadius,
    double? chartPadding,
    bool? showGrid,
    bool? showValues,
    bool? enableInteraction,
    int? horizontalGridLines,
    bool? showYAxis,
    bool? showAxisLine,
    bool? showYAxisGridLines,
    int? yAxisDivisions,
    double? yAxisWidth,
    String Function(double)? yAxisFormatter,
    List<Color>? segmentColors,
    Color? gridColor,
    Color? backgroundColor,
    Color? labelTextColor,
    Color? valueTextColor,
    Color? yAxisTextColor,
    double? labelFontSize,
    double? valueFontSize,
    double? yAxisFontSize,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableAnimation,
  }) {
    return StackedBarChartConfig(
      barSpacing: barSpacing ?? this.barSpacing,
      cornerRadius: cornerRadius ?? this.cornerRadius,
      chartPadding: chartPadding ?? this.chartPadding,
      showGrid: showGrid ?? this.showGrid,
      showValues: showValues ?? this.showValues,
      enableInteraction: enableInteraction ?? this.enableInteraction,
      horizontalGridLines: horizontalGridLines ?? this.horizontalGridLines,
      showYAxis: showYAxis ?? this.showYAxis,
      showAxisLine: showAxisLine ?? this.showAxisLine,
      showYAxisGridLines: showYAxisGridLines ?? this.showYAxisGridLines,
      yAxisDivisions: yAxisDivisions ?? this.yAxisDivisions,
      yAxisWidth: yAxisWidth ?? this.yAxisWidth,
      yAxisFormatter: yAxisFormatter ?? this.yAxisFormatter,
      segmentColors: segmentColors ?? this.segmentColors,
      gridColor: gridColor ?? this.gridColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      labelTextColor: labelTextColor ?? this.labelTextColor,
      valueTextColor: valueTextColor ?? this.valueTextColor,
      yAxisTextColor: yAxisTextColor ?? this.yAxisTextColor,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      valueFontSize: valueFontSize ?? this.valueFontSize,
      yAxisFontSize: yAxisFontSize ?? this.yAxisFontSize,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
    );
  }
}

/// Animation curve option model
class StackedBarCurveOption {
  final String name;
  final Curve curve;

  const StackedBarCurveOption({required this.name, required this.curve});
}

/// Animation duration option model
class StackedBarDurationOption {
  final String name;
  final Duration duration;

  const StackedBarDurationOption({required this.name, required this.duration});
}

/// Color set option for segments
class StackedBarColorSetOption {
  final String name;
  final List<Color> colors;

  const StackedBarColorSetOption({required this.name, required this.colors});
}
