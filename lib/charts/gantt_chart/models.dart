// models/gantt_models.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';

/// Model for Gantt chart examples/demos
class GanttExample {
  final String title;
  final String description;
  final List<GanttData> data;
  final Color primaryColor;
  final String category;
  final Map<String, dynamic>? metadata;

  const GanttExample({
    required this.title,
    required this.description,
    required this.data,
    required this.primaryColor,
    this.category = 'general',
    this.metadata,
  });
}

/// Model for property documentation
class GanttPropertyInfo {
  final String name;
  final String type;
  final String description;
  final bool required;
  final String? example;
  final String? defaultValue;

  const GanttPropertyInfo({
    required this.name,
    required this.type,
    required this.description,
    this.required = false,
    this.example,
    this.defaultValue,
  });
}

/// Model for property sections/categories
class GanttPropertySection {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<GanttPropertyInfo> properties;

  const GanttPropertySection({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.properties,
  });
}

/// Model for code examples
class GanttCodeExample {
  final String title;
  final String description;
  final String code;
  final String category;

  const GanttCodeExample({
    required this.title,
    required this.description,
    required this.code,
    this.category = 'basic',
  });
}

/// Gantt chart configuration state - COMPREHENSIVE CONFIGURATION
class GanttConfig {
  // Sizing
  final double width;
  final double height;

  // Line styling
  final Color lineColor;
  final Color pointColor;
  final Color connectionLineColor;
  final Color backgroundColor;
  final double lineWidth;
  final double pointRadius;
  final double connectionLineWidth;

  // Layout
  final double verticalSpacing;
  final double horizontalPadding;
  final double labelOffset;
  final double timelineYOffset;

  // Display options
  final bool showConnections;
  final bool interactive;

  // Animation properties
  final Duration animationDuration;
  final Curve animationCurve;
  final bool enableAnimation;

  // Text styling
  final TextStyle? labelStyle;
  final TextStyle? dateStyle;
  final TextStyle? descriptionStyle;

  // Date formatting
  final DateFormat? dateFormat;

  const GanttConfig({
    // Sizing defaults
    this.width = 800.0,
    this.height = 420.0,

    // Line styling defaults
    this.lineColor = AppColors.primary,
    this.pointColor = AppColors.accent,
    this.connectionLineColor = AppColors.border,
    this.backgroundColor = Colors.transparent,
    this.lineWidth = 6.0,
    this.pointRadius = 8.0,
    this.connectionLineWidth = 2.0,

    // Layout defaults
    this.verticalSpacing = 90.0,
    this.horizontalPadding = 32.0,
    this.labelOffset = 25.0,
    this.timelineYOffset = 60.0,

    // Display defaults
    this.showConnections = true,
    this.interactive = true,

    // Animation defaults
    this.animationDuration = const Duration(milliseconds: 1500),
    this.animationCurve = Curves.easeInOut,
    this.enableAnimation = true,

    // Text styling defaults
    this.labelStyle,
    this.dateStyle,
    this.descriptionStyle,

    // Date formatting default
    this.dateFormat,
  });

  GanttConfig copyWith({
    double? width,
    double? height,
    Color? lineColor,
    Color? pointColor,
    Color? connectionLineColor,
    Color? backgroundColor,
    double? lineWidth,
    double? pointRadius,
    double? connectionLineWidth,
    double? verticalSpacing,
    double? horizontalPadding,
    double? labelOffset,
    double? timelineYOffset,
    bool? showConnections,
    bool? interactive,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableAnimation,
    TextStyle? labelStyle,
    TextStyle? dateStyle,
    TextStyle? descriptionStyle,
    DateFormat? dateFormat,
  }) {
    return GanttConfig(
      width: width ?? this.width,
      height: height ?? this.height,
      lineColor: lineColor ?? this.lineColor,
      pointColor: pointColor ?? this.pointColor,
      connectionLineColor: connectionLineColor ?? this.connectionLineColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      lineWidth: lineWidth ?? this.lineWidth,
      pointRadius: pointRadius ?? this.pointRadius,
      connectionLineWidth: connectionLineWidth ?? this.connectionLineWidth,
      verticalSpacing: verticalSpacing ?? this.verticalSpacing,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      labelOffset: labelOffset ?? this.labelOffset,
      timelineYOffset: timelineYOffset ?? this.timelineYOffset,
      showConnections: showConnections ?? this.showConnections,
      interactive: interactive ?? this.interactive,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      labelStyle: labelStyle ?? this.labelStyle,
      dateStyle: dateStyle ?? this.dateStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      dateFormat: dateFormat ?? this.dateFormat,
    );
  }
}

/// Animation curve option model
class GanttCurveOption {
  final String name;
  final Curve curve;

  const GanttCurveOption({required this.name, required this.curve});
}

/// Date format option model
class DateFormatOption {
  final String name;
  final DateFormat format;
  final String example;

  const DateFormatOption({
    required this.name,
    required this.format,
    required this.example,
  });
}
