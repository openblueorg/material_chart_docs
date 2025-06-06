// models/pie_chart_models.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';

/// Model for pie chart examples/demos
class PieChartExample {
  final String title;
  final String description;
  final List<PieChartData> data;
  final Color primaryColor;
  final String category;
  final Map<String, dynamic>? metadata;

  const PieChartExample({
    required this.title,
    required this.description,
    required this.data,
    required this.primaryColor,
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

/// Pie chart configuration state - COMPREHENSIVE WITH ALL PROPERTIES
class PieChartConfig {
  // Animation properties
  final bool enableAnimation;
  final Duration animationDuration;
  final Curve animationCurve;

  // Chart structure
  final double startAngle;
  final double holeRadius;
  final double minSizePercent;
  final double chartRadius;

  // Labels and values
  final bool showLabels;
  final bool showValues;
  final bool showLabelOnlyOnHover;
  final LabelPosition labelPosition;
  final double labelOffset;
  final double labelFontSize;
  final double valueFontSize;

  // Legend
  final bool showLegend;
  final PieChartLegendPosition legendPosition;

  // Connector lines
  final bool showConnectorLines;
  final Color connectorLineColor;
  final double connectorLineStrokeWidth;

  // Interactivity
  final bool interactive;

  // Positioning
  final ChartAlignment chartAlignment;
  final double padding;

  // Colors
  final List<Color> colorPalette;
  final Color backgroundColor;

  const PieChartConfig({
    // Animation defaults
    this.enableAnimation = true,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.animationCurve = Curves.easeOutCubic,

    // Chart structure defaults
    this.startAngle = -90.0,
    this.holeRadius = 0.0,
    this.minSizePercent = 0.0,
    this.chartRadius = double.maxFinite,

    // Labels and values defaults
    this.showLabels = true,
    this.showValues = true,
    this.showLabelOnlyOnHover = false,
    this.labelPosition = LabelPosition.outside,
    this.labelOffset = 20.0,
    this.labelFontSize = 12.0,
    this.valueFontSize = 10.0,

    // Legend defaults
    this.showLegend = true,
    this.legendPosition = PieChartLegendPosition.right,

    // Connector lines defaults
    this.showConnectorLines = true,
    this.connectorLineColor = Colors.black54,
    this.connectorLineStrokeWidth = 1.0,

    // Interactivity defaults
    this.interactive = true,

    // Positioning defaults
    this.chartAlignment = ChartAlignment.center,
    this.padding = 24.0,

    // Colors defaults
    this.colorPalette = const [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ],
    this.backgroundColor = Colors.white,
  });

  PieChartConfig copyWith({
    bool? enableAnimation,
    Duration? animationDuration,
    Curve? animationCurve,
    double? startAngle,
    double? holeRadius,
    double? minSizePercent,
    double? chartRadius,
    bool? showLabels,
    bool? showValues,
    bool? showLabelOnlyOnHover,
    LabelPosition? labelPosition,
    double? labelOffset,
    double? labelFontSize,
    double? valueFontSize,
    bool? showLegend,
    PieChartLegendPosition? legendPosition,
    bool? showConnectorLines,
    Color? connectorLineColor,
    double? connectorLineStrokeWidth,
    bool? interactive,
    ChartAlignment? chartAlignment,
    double? padding,
    List<Color>? colorPalette,
    Color? backgroundColor,
  }) {
    return PieChartConfig(
      enableAnimation: enableAnimation ?? this.enableAnimation,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      startAngle: startAngle ?? this.startAngle,
      holeRadius: holeRadius ?? this.holeRadius,
      minSizePercent: minSizePercent ?? this.minSizePercent,
      chartRadius: chartRadius ?? this.chartRadius,
      showLabels: showLabels ?? this.showLabels,
      showValues: showValues ?? this.showValues,
      showLabelOnlyOnHover: showLabelOnlyOnHover ?? this.showLabelOnlyOnHover,
      labelPosition: labelPosition ?? this.labelPosition,
      labelOffset: labelOffset ?? this.labelOffset,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      valueFontSize: valueFontSize ?? this.valueFontSize,
      showLegend: showLegend ?? this.showLegend,
      legendPosition: legendPosition ?? this.legendPosition,
      showConnectorLines: showConnectorLines ?? this.showConnectorLines,
      connectorLineColor: connectorLineColor ?? this.connectorLineColor,
      connectorLineStrokeWidth:
          connectorLineStrokeWidth ?? this.connectorLineStrokeWidth,
      interactive: interactive ?? this.interactive,
      chartAlignment: chartAlignment ?? this.chartAlignment,
      padding: padding ?? this.padding,
      colorPalette: colorPalette ?? this.colorPalette,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}

/// Animation curve option model
class CurveOption {
  final String name;
  final Curve curve;

  const CurveOption({required this.name, required this.curve});
}

/// Color palette option model
class ColorPalette {
  final String name;
  final List<Color> colors;

  const ColorPalette({required this.name, required this.colors});
}
