// data/chart_data_provider.dart
import 'package:flutter/material.dart';
// import 'package:chat_test_01/material_charts/material_charts.dart';
import '../../material_charts/material_charts.dart';

import '../constants.dart';
import 'models.dart';

/// Provides all chart examples, property definitions, and code samples
class ChartDataProvider {
  // Chart Examples for Demo
  static List<ChartExample> getChartExamples() {
    return [
      ChartExample(
        title: 'Monthly Sales Data',
        description: 'Track sales performance across months',
        color: AppColors.primary,
        category: 'business',
        data: [
          const ChartData(value: 15000, label: 'Jan'),
          const ChartData(value: 32000, label: 'Feb'),
          const ChartData(value: 28000, label: 'Mar'),
          const ChartData(value: 45000, label: 'Apr'),
          const ChartData(value: 38000, label: 'May'),
          const ChartData(value: 52000, label: 'Jun'),
          const ChartData(value: 48000, label: 'Jul'),
          const ChartData(value: 65000, label: 'Aug'),
        ],
        metadata: {'unit': 'USD', 'trend': 'positive'},
      ),

      ChartExample(
        title: 'Temperature Variation',
        description: 'Daily temperature readings',
        color: AppColors.accent,
        category: 'weather',
        data: [
          const ChartData(value: 22, label: 'Mon'),
          const ChartData(value: 25, label: 'Tue'),
          const ChartData(value: 28, label: 'Wed'),
          const ChartData(value: 26, label: 'Thu'),
          const ChartData(value: 24, label: 'Fri'),
          const ChartData(value: 23, label: 'Sat'),
          const ChartData(value: 21, label: 'Sun'),
        ],
        metadata: {'unit': '°C', 'location': 'City Center'},
      ),

      ChartExample(
        title: 'User Engagement',
        description: 'Weekly active users',
        color: AppColors.primaryLight,
        category: 'analytics',
        data: [
          const ChartData(value: 1200, label: 'W1'),
          const ChartData(value: 1350, label: 'W2'),
          const ChartData(value: 1180, label: 'W3'),
          const ChartData(value: 1420, label: 'W4'),
          const ChartData(value: 1680, label: 'W5'),
          const ChartData(value: 1550, label: 'W6'),
        ],
        metadata: {'unit': 'users', 'period': 'weekly'},
      ),
    ];
  }

  // Animation curve options for customization
  static List<CurveOption> getAnimationCurves() {
    return [
      CurveOption(name: 'Ease Out Cubic', curve: Curves.easeOutCubic),
      CurveOption(name: 'Ease In Out', curve: Curves.easeInOut),
      CurveOption(name: 'Ease In', curve: Curves.easeIn),
      CurveOption(name: 'Ease Out', curve: Curves.easeOut),
      CurveOption(name: 'Bounce In', curve: Curves.bounceIn),
      CurveOption(name: 'Bounce Out', curve: Curves.bounceOut),
      CurveOption(name: 'Elastic In', curve: Curves.elasticIn),
      CurveOption(name: 'Elastic Out', curve: Curves.elasticOut),
      CurveOption(name: 'Fast Linear', curve: Curves.fastLinearToSlowEaseIn),
      CurveOption(name: 'Decelerate', curve: Curves.decelerate),
      CurveOption(name: 'Linear', curve: Curves.linear),
    ];
  }

  // NEW: Line style options for hover lines
  static List<LineStyleOption> getLineStyles() {
    return [
      LineStyleOption(name: 'Solid', style: LineStyle.solid),
      LineStyleOption(name: 'Dashed', style: LineStyle.dashed),
      LineStyleOption(name: 'Dotted', style: LineStyle.dotted),
    ];
  }

  // Animation duration presets
  static List<DurationOption> getAnimationDurations() {
    return [
      DurationOption(name: 'Fast', duration: const Duration(milliseconds: 800)),
      DurationOption(
        name: 'Normal',
        duration: const Duration(milliseconds: 1500),
      ),
      DurationOption(
        name: 'Slow',
        duration: const Duration(milliseconds: 2500),
      ),
      DurationOption(
        name: 'Very Slow',
        duration: const Duration(milliseconds: 4000),
      ),
    ];
  }

  // Property Documentation Sections - ENHANCED
  static List<PropertySection> getPropertySections() {
    return [
      PropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.primary,
        properties: [
          PropertyInfo(
            name: 'data',
            type: 'List<ChartData>',
            description: 'Chart data points with values and labels',
            required: true,
            example: '[ChartData(value: 100, label: "Jan")]',
          ),
          PropertyInfo(
            name: 'width',
            type: 'double',
            description: 'Chart width in pixels',
            required: true,
            example: '400',
          ),
          PropertyInfo(
            name: 'height',
            type: 'double',
            description: 'Chart height in pixels',
            required: true,
            example: '300',
          ),
          PropertyInfo(
            name: 'showPoints',
            type: 'bool',
            description: 'Display data points on the line',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'showGrid',
            type: 'bool',
            description: 'Display background grid lines',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'showTooltips',
            type: 'bool',
            description: 'Show tooltips on hover',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'padding',
            type: 'EdgeInsets',
            description: 'Space around the chart content',
            required: false,
            defaultValue: 'EdgeInsets.all(20)',
            example: 'EdgeInsets.all(20)',
          ),
        ],
      ),

      PropertySection(
        title: 'Style Properties',
        description: 'Visual styling options',
        icon: Icons.palette,
        color: AppColors.accent,
        properties: [
          PropertyInfo(
            name: 'lineColor',
            type: 'Color',
            description: 'Color of the chart line',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.blue',
          ),
          PropertyInfo(
            name: 'pointColor',
            type: 'Color',
            description: 'Color of the data points',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.red',
          ),
          PropertyInfo(
            name: 'gridColor',
            type: 'Color',
            description: 'Color of the grid lines',
            required: false,
            defaultValue: 'Colors.grey',
            example: 'Colors.grey',
          ),
          PropertyInfo(
            name: 'backgroundColor',
            type: 'Color',
            description: 'Background color of the chart',
            required: false,
            defaultValue: 'Colors.white',
            example: 'Colors.white',
          ),
          PropertyInfo(
            name: 'strokeWidth',
            type: 'double',
            description: 'Thickness of the chart line',
            required: false,
            defaultValue: '2.0',
            example: '3.0',
          ),
          PropertyInfo(
            name: 'pointRadius',
            type: 'double',
            description: 'Size of the data points',
            required: false,
            defaultValue: '4.0',
            example: '6.0',
          ),
          PropertyInfo(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Styling for axis labels',
            required: false,
            example: 'TextStyle(fontSize: 12)',
          ),
        ],
      ),

      PropertySection(
        title: 'Curved Lines & Points',
        description: 'Line smoothing and point styling',
        icon: Icons.timeline,
        color: AppColors.primaryLight,
        properties: [
          PropertyInfo(
            name: 'useCurvedLines',
            type: 'bool',
            description: 'Enable smooth curved lines between points',
            required: false,
            defaultValue: 'false',
            example: 'true',
          ),
          PropertyInfo(
            name: 'curveIntensity',
            type: 'double',
            description: 'Intensity of curve smoothing (0.0 to 1.0)',
            required: false,
            defaultValue: '0.3',
            example: '0.5',
          ),
          PropertyInfo(
            name: 'roundedPoints',
            type: 'bool',
            description: 'Use rounded line caps and joins',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
        ],
      ),

      PropertySection(
        title: 'Tooltips & Hover',
        description: 'Interactive tooltip configuration',
        icon: Icons.info_outline,
        color: AppColors.accentLight,
        properties: [
          PropertyInfo(
            name: 'showTooltips',
            type: 'bool',
            description: 'Enable tooltips on data point hover',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'tooltipStyle',
            type: 'TooltipStyle',
            description: 'Styling configuration for tooltips',
            required: false,
            example: 'TooltipStyle(backgroundColor: Colors.white)',
          ),
          PropertyInfo(
            name: 'verticalLineColor',
            type: 'Color',
            description: 'Color of the vertical hover line',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.grey',
          ),
          PropertyInfo(
            name: 'verticalLineWidth',
            type: 'double',
            description: 'Width of the vertical hover line',
            required: false,
            defaultValue: '1.0',
            example: '2.0',
          ),
          PropertyInfo(
            name: 'verticalLineStyle',
            type: 'LineStyle',
            description: 'Style of vertical line (solid, dashed, dotted)',
            required: false,
            defaultValue: 'LineStyle.solid',
            example: 'LineStyle.dashed',
          ),
          PropertyInfo(
            name: 'verticalLineOpacity',
            type: 'double',
            description: 'Opacity of the vertical hover line (0.0 to 1.0)',
            required: false,
            defaultValue: '0.7',
            example: '0.5',
          ),
        ],
      ),

      PropertySection(
        title: 'Data Model',
        description: 'Data structure definition',
        icon: Icons.data_object,
        color: AppColors.primaryLight,
        properties: [
          PropertyInfo(
            name: 'value',
            type: 'double',
            description: 'Numeric value for the Y-axis position',
            required: true,
            example: '42.5',
          ),
          PropertyInfo(
            name: 'label',
            type: 'String',
            description: 'Text label displayed on the X-axis',
            required: true,
            example: '"January"',
          ),
        ],
      ),

      PropertySection(
        title: 'Animation Config',
        description: 'Animation settings',
        icon: Icons.animation,
        color: AppColors.accentLight,
        properties: [
          PropertyInfo(
            name: 'animationDuration',
            type: 'Duration',
            description: 'Length of the chart animation',
            required: false,
            defaultValue: 'Duration(milliseconds: 1500)',
            example: 'Duration(milliseconds: 1500)',
          ),
          PropertyInfo(
            name: 'animationCurve',
            type: 'Curve',
            description: 'Animation easing curve style',
            required: false,
            defaultValue: 'Curves.easeInOut',
            example: 'Curves.easeOutCubic',
          ),
          PropertyInfo(
            name: 'onAnimationComplete',
            type: 'VoidCallback?',
            description: 'Callback when animation finishes',
            required: false,
            example: '() => print("Done!")',
          ),
        ],
      ),
    ];
  }

  // Code Examples - ENHANCED
  static List<CodeExample> getCodeExamples() {
    return [
      CodeExample(
        title: 'Basic Usage',
        description: 'Simple chart with minimal configuration',
        category: 'basic',
        code: '''MaterialChartLine(
  data: [
    ChartData(value: 15, label: 'Jan'),
    ChartData(value: 32, label: 'Feb'),
    ChartData(value: 28, label: 'Mar'),
    ChartData(value: 45, label: 'Apr'),
  ],
  width: 400,
  height: 300,
)''',
      ),

      CodeExample(
        title: 'Curved Lines & Tooltips',
        description: 'Enhanced chart with smooth curves and tooltips',
        category: 'enhanced',
        code: '''MaterialChartLine(
  data: chartData,
  width: 600,
  height: 400,
  style: LineChartStyle(
    lineColor: Colors.blue,
    pointColor: Colors.red,
    useCurvedLines: true,
    curveIntensity: 0.4,
    roundedPoints: true,
    strokeWidth: 3.0,
    pointRadius: 6.0,
    showTooltips: true,
    tooltipStyle: TooltipStyle(
      backgroundColor: Colors.white,
      borderColor: Colors.grey,
      borderRadius: 8.0,
    ),
    verticalLineColor: Colors.grey,
    verticalLineStyle: LineStyle.dashed,
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  showPoints: true,
  showGrid: true,
  showTooltips: true,
  padding: EdgeInsets.all(20),
)''',
      ),

      CodeExample(
        title: 'Advanced Styling',
        description: 'Fully customized appearance and interaction',
        category: 'advanced',
        code: '''MaterialChartLine(
  data: chartData,
  width: 600,
  height: 400,
  style: LineChartStyle(
    lineColor: Colors.blue,
    pointColor: Colors.red,
    backgroundColor: Colors.white,
    gridColor: Colors.grey.withValues(alpha: 0.3),
    strokeWidth: 3.0,
    pointRadius: 6.0,
    useCurvedLines: true,
    curveIntensity: 0.5,
    roundedPoints: true,
    labelStyle: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
    verticalLineColor: Colors.blue.withOpacity(0.7),
    verticalLineWidth: 2.0,
    verticalLineStyle: LineStyle.dashed,
    showTooltips: true,
    tooltipStyle: TooltipStyle(
      backgroundColor: Colors.blueGrey[50]!,
      borderColor: Colors.blue,
      textStyle: TextStyle(color: Colors.black87),
    ),
  ),
  showPoints: true,
  showGrid: true,
  showTooltips: true,
  padding: EdgeInsets.all(20),
)''',
      ),

      CodeExample(
        title: 'With Callbacks',
        description: 'Handling animation completion',
        category: 'callbacks',
        code: '''MaterialChartLine(
  data: salesData,
  width: 500,
  height: 350,
  onAnimationComplete: () {
    print('Chart animation completed!');
    // Trigger additional actions
    _showDataSummary();
  },
  style: LineChartStyle(
    animationDuration: Duration(milliseconds: 1500),
    useCurvedLines: true,
    showTooltips: true,
  ),
)''',
      ),
    ];
  }

  // Available color palette for customization
  static List<Color> getColorPalette() {
    return [
      AppColors.primary,
      AppColors.accent,
      AppColors.primaryLight,
      AppColors.accentLight,
      Colors.green,
      Colors.red,
      Colors.indigo,
      Colors.pink,
    ];
  }

  // ENHANCED: Generate dynamic live code with new features
  static String generateLiveCode(
    ChartExample example,
    ChartConfig config,
    bool showRightPanel,
  ) {
    final dataString = example.data
        .map(
          (data) =>
              '    ChartData(value: ${data.value}, label: \'${data.label}\')',
        )
        .join(',\n');

    final lineColorName = _getColorName(config.lineColor);
    final pointColorName = _getColorName(config.pointColor);
    final gridColorName = _getColorName(config.gridColor);
    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);

    final animationCurveName = _getCurveName(config.animationCurve);
    final verticalLineStyleName = _getLineStyleName(config.verticalLineStyle);
    final tooltipBgColorName = _getColorName(config.tooltipBackgroundColor);
    final tooltipBorderColorName = _getColorName(config.tooltipBorderColor);
    final tooltipTextColorName = _getColorName(config.tooltipTextColor);
    final verticalLineColorName = _getColorName(config.verticalLineColor);

    return '''// ${example.title} Example - Live Customization
final data = [
$dataString,
];

MaterialChartLine(
  data: data,
  width: ${showRightPanel ? 400 : 600},
  height: 250,
  style: LineChartStyle(
    lineColor: $lineColorName,
    pointColor: $pointColorName,
    backgroundColor: $backgroundColorName,
    gridColor: $gridColorName,
    strokeWidth: ${config.strokeWidth.toStringAsFixed(1)},
    pointRadius: ${config.pointRadius.toStringAsFixed(1)},
    useCurvedLines: ${config.useCurvedLines},
    curveIntensity: ${config.curveIntensity.toStringAsFixed(1)},
    roundedPoints: ${config.roundedPoints},
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    animationDuration: Duration(milliseconds: ${config.animationDuration.inMilliseconds}),
    animationCurve: $animationCurveName,
    showTooltips: ${config.showTooltips},
    tooltipStyle: TooltipStyle(
      backgroundColor: $tooltipBgColorName,
      borderColor: $tooltipBorderColorName,
      borderRadius: ${config.tooltipBorderRadius.toStringAsFixed(1)},
      textStyle: TextStyle(color: $tooltipTextColorName),
    ),
    verticalLineColor: $verticalLineColorName,
    verticalLineWidth: ${config.verticalLineWidth.toStringAsFixed(1)},
    verticalLineStyle: $verticalLineStyleName,
    verticalLineOpacity: ${config.verticalLineOpacity.toStringAsFixed(1)},
  ),
  showPoints: ${config.showPoints},
  showGrid: ${config.showGrid},
  showTooltips: ${config.showTooltips},
  padding: EdgeInsets.all(20),
  onAnimationComplete: () {
    print('${example.title} animation completed!');
  },
)''';
  }

  // NEW: Get line style name for code generation
  static String _getLineStyleName(LineStyle style) {
    switch (style) {
      case LineStyle.solid:
        return 'LineStyle.solid';
      case LineStyle.dashed:
        return 'LineStyle.dashed';
      case LineStyle.dotted:
        return 'LineStyle.dotted';
    }
  }

  // Get curve name for code generation
  static String _getCurveName(Curve curve) {
    if (curve == Curves.easeOutCubic) return 'Curves.easeOutCubic';
    if (curve == Curves.easeInOut) return 'Curves.easeInOut';
    if (curve == Curves.easeIn) return 'Curves.easeIn';
    if (curve == Curves.easeOut) return 'Curves.easeOut';
    if (curve == Curves.bounceIn) return 'Curves.bounceIn';
    if (curve == Curves.bounceOut) return 'Curves.bounceOut';
    if (curve == Curves.elasticIn) return 'Curves.elasticIn';
    if (curve == Curves.elasticOut) return 'Curves.elasticOut';
    if (curve == Curves.fastLinearToSlowEaseIn)
      return 'Curves.fastLinearToSlowEaseIn';
    if (curve == Curves.decelerate) return 'Curves.decelerate';
    if (curve == Curves.linear) return 'Curves.linear';
    return 'Curves.easeOutCubic';
  }

  static String _getColorName(Color color) {
    if (color == AppColors.primary) return 'AppColors.primary';
    if (color == AppColors.accent) return 'AppColors.accent';
    if (color == AppColors.primaryLight) return 'AppColors.primaryLight';
    if (color == AppColors.accentLight) return 'AppColors.accentLight';
    if (color == Colors.green) return 'Colors.green';
    if (color == Colors.red) return 'Colors.red';
    if (color == Colors.blue) return 'Colors.blue';
    if (color == Colors.orange) return 'Colors.orange';
    if (color == Colors.purple) return 'Colors.purple';
    if (color == Colors.teal) return 'Colors.teal';
    if (color == Colors.indigo) return 'Colors.indigo';
    if (color == Colors.pink) return 'Colors.pink';
    if (color == Colors.white) return 'Colors.white';
    if (color == Colors.black87) return 'Colors.black87';
    if (color == Colors.grey) return 'Colors.grey';
    if (color == AppColors.border) return 'AppColors.border';
    return 'Colors.blue';
  }
}
