// models/candlestick_models.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';

/// Model for candlestick chart examples/demos
class CandlestickExample {
  final String title;
  final String description;
  final List<CandlestickData> data;
  final Color bullishColor;
  final Color bearishColor;
  final String category;
  final Map<String, dynamic>? metadata;

  const CandlestickExample({
    required this.title,
    required this.description,
    required this.data,
    required this.bullishColor,
    required this.bearishColor,
    this.category = 'general',
    this.metadata,
  });
}

/// Model for property documentation
class CandlestickPropertyInfo {
  final String name;
  final String type;
  final String description;
  final bool required;
  final String? example;
  final String? defaultValue;

  const CandlestickPropertyInfo({
    required this.name,
    required this.type,
    required this.description,
    this.required = false,
    this.example,
    this.defaultValue,
  });
}

/// Model for property sections/categories
class CandlestickPropertySection {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<CandlestickPropertyInfo> properties;

  const CandlestickPropertySection({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.properties,
  });
}

/// Model for code examples
class CandlestickCodeExample {
  final String title;
  final String description;
  final String code;
  final String category;

  const CandlestickCodeExample({
    required this.title,
    required this.description,
    required this.code,
    this.category = 'basic',
  });
}

/// Candlestick chart configuration state - COMPREHENSIVE CONFIGURATION
class CandlestickConfig {
  // Basic styling
  final Color bullishColor;
  final Color bearishColor;
  final double candleWidth;
  final double wickWidth;
  final double spacing;
  final Color verticalLineColor;
  final double verticalLineWidth;

  // Background and grid
  final Color backgroundColor;
  final bool showGrid;

  // Animation properties
  final Duration animationDuration;
  final Curve animationCurve;
  final bool enableAnimation;

  // Tooltip styling
  final Color tooltipBackgroundColor;
  final Color tooltipBorderColor;
  final double tooltipBorderRadius;
  final TextStyle tooltipTextStyle;
  final EdgeInsets tooltipPadding;

  // Axis configuration
  final int priceDivisions;
  final int dateDivisions;
  final double yAxisWidth;
  final double xAxisHeight;
  final TextStyle? labelStyle;

  const CandlestickConfig({
    // Default styling
    this.bullishColor = AppColors.primary,
    this.bearishColor = AppColors.accent,
    this.candleWidth = 12.0,
    this.wickWidth = 3.0,
    this.spacing = 0.2,
    this.verticalLineColor = AppColors.primary,
    this.verticalLineWidth = 1.0,

    // Background
    this.backgroundColor = Colors.transparent,
    this.showGrid = true,

    // Animation defaults
    this.animationDuration = const Duration(milliseconds: 1500),
    this.animationCurve = Curves.easeOutCubic,
    this.enableAnimation = true,

    // Tooltip defaults
    this.tooltipBackgroundColor = AppColors.darkTeal,
    this.tooltipBorderColor = AppColors.border,
    this.tooltipBorderRadius = 12.0,
    this.tooltipTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    this.tooltipPadding = const EdgeInsets.all(8),

    // Axis defaults
    this.priceDivisions = 5,
    this.dateDivisions = 5,
    this.yAxisWidth = 60.0,
    this.xAxisHeight = 30.0,
    this.labelStyle,
  });

  CandlestickConfig copyWith({
    Color? bullishColor,
    Color? bearishColor,
    double? candleWidth,
    double? wickWidth,
    double? spacing,
    Color? verticalLineColor,
    double? verticalLineWidth,
    Color? backgroundColor,
    bool? showGrid,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableAnimation,
    Color? tooltipBackgroundColor,
    Color? tooltipBorderColor,
    double? tooltipBorderRadius,
    TextStyle? tooltipTextStyle,
    EdgeInsets? tooltipPadding,
    int? priceDivisions,
    int? dateDivisions,
    double? yAxisWidth,
    double? xAxisHeight,
    TextStyle? labelStyle,
  }) {
    return CandlestickConfig(
      bullishColor: bullishColor ?? this.bullishColor,
      bearishColor: bearishColor ?? this.bearishColor,
      candleWidth: candleWidth ?? this.candleWidth,
      wickWidth: wickWidth ?? this.wickWidth,
      spacing: spacing ?? this.spacing,
      verticalLineColor: verticalLineColor ?? this.verticalLineColor,
      verticalLineWidth: verticalLineWidth ?? this.verticalLineWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      showGrid: showGrid ?? this.showGrid,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      tooltipBackgroundColor:
          tooltipBackgroundColor ?? this.tooltipBackgroundColor,
      tooltipBorderColor: tooltipBorderColor ?? this.tooltipBorderColor,
      tooltipBorderRadius: tooltipBorderRadius ?? this.tooltipBorderRadius,
      tooltipTextStyle: tooltipTextStyle ?? this.tooltipTextStyle,
      tooltipPadding: tooltipPadding ?? this.tooltipPadding,
      priceDivisions: priceDivisions ?? this.priceDivisions,
      dateDivisions: dateDivisions ?? this.dateDivisions,
      yAxisWidth: yAxisWidth ?? this.yAxisWidth,
      xAxisHeight: xAxisHeight ?? this.xAxisHeight,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }
}

/// Animation curve option model
class CandlestickCurveOption {
  final String name;
  final Curve curve;

  const CandlestickCurveOption({required this.name, required this.curve});
}

/// Animation duration option model
class CandlestickDurationOption {
  final String name;
  final Duration duration;

  const CandlestickDurationOption({required this.name, required this.duration});
}
