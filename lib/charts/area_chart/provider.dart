// lib/charts/area_chart/provider.dart
import 'dart:math';

import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';

/// Provides all area chart examples, property definitions, and code samples
class AreaChartDataProvider {
  // Chart Examples for Demo
  static List<AreaChartExample> getChartExamples() {
    return [
      AreaChartExample(
        title: 'Revenue vs Expenses',
        description: 'Monthly revenue and expense comparison over time',
        category: 'business',
        series: [
          AreaChartSeries(
            name: 'Revenue',
            dataPoints: [
              const AreaChartData(value: 45000, label: 'Jan'),
              const AreaChartData(value: 52000, label: 'Feb'),
              const AreaChartData(value: 48000, label: 'Mar'),
              const AreaChartData(value: 61000, label: 'Apr'),
              const AreaChartData(value: 55000, label: 'May'),
              const AreaChartData(value: 67000, label: 'Jun'),
              const AreaChartData(value: 72000, label: 'Jul'),
              const AreaChartData(value: 68000, label: 'Aug'),
            ],
            color: AppColors.primary,
            gradientColor: AppColors.primary.withOpacity(0.3),
            lineWidth: 3,
            pointSize: 6,
          ),
          AreaChartSeries(
            name: 'Expenses',
            dataPoints: [
              const AreaChartData(value: 32000, label: 'Jan'),
              const AreaChartData(value: 38000, label: 'Feb'),
              const AreaChartData(value: 35000, label: 'Mar'),
              const AreaChartData(value: 42000, label: 'Apr'),
              const AreaChartData(value: 39000, label: 'May'),
              const AreaChartData(value: 45000, label: 'Jun'),
              const AreaChartData(value: 48000, label: 'Jul'),
              const AreaChartData(value: 44000, label: 'Aug'),
            ],
            color: AppColors.accent,
            gradientColor: AppColors.accent.withOpacity(0.3),
            lineWidth: 3,
            pointSize: 6,
          ),
        ],
        metadata: {'unit': 'USD', 'type': 'comparison'},
      ),

      AreaChartExample(
        title: 'User Growth Metrics',
        description: 'Active users and new registrations tracking',
        category: 'analytics',
        series: [
          AreaChartSeries(
            name: 'Active Users',
            dataPoints: [
              const AreaChartData(value: 1200, label: 'W1'),
              const AreaChartData(value: 1350, label: 'W2'),
              const AreaChartData(value: 1580, label: 'W3'),
              const AreaChartData(value: 1720, label: 'W4'),
              const AreaChartData(value: 1890, label: 'W5'),
              const AreaChartData(value: 2100, label: 'W6'),
              const AreaChartData(value: 2280, label: 'W7'),
              const AreaChartData(value: 2450, label: 'W8'),
            ],
            color: AppColors.primaryLight,
            gradientColor: AppColors.primaryLight.withOpacity(0.4),
            lineWidth: 4,
            pointSize: 7,
          ),
          AreaChartSeries(
            name: 'New Registrations',
            dataPoints: [
              const AreaChartData(value: 180, label: 'W1'),
              const AreaChartData(value: 220, label: 'W2'),
              const AreaChartData(value: 195, label: 'W3'),
              const AreaChartData(value: 250, label: 'W4'),
              const AreaChartData(value: 210, label: 'W5'),
              const AreaChartData(value: 280, label: 'W6'),
              const AreaChartData(value: 240, label: 'W7'),
              const AreaChartData(value: 300, label: 'W8'),
            ],
            color: AppColors.accentLight,
            gradientColor: AppColors.accentLight.withOpacity(0.4),
            lineWidth: 3,
            pointSize: 6,
          ),
        ],
        metadata: {'unit': 'users', 'period': 'weekly'},
      ),

      AreaChartExample(
        title: 'Temperature Trends',
        description: 'Daily temperature variations with min/max ranges',
        category: 'weather',
        series: [
          AreaChartSeries(
            name: 'Max Temperature',
            dataPoints: [
              const AreaChartData(value: 28, label: 'Mon'),
              const AreaChartData(value: 32, label: 'Tue'),
              const AreaChartData(value: 35, label: 'Wed'),
              const AreaChartData(value: 33, label: 'Thu'),
              const AreaChartData(value: 30, label: 'Fri'),
              const AreaChartData(value: 27, label: 'Sat'),
              const AreaChartData(value: 25, label: 'Sun'),
            ],
            color: Colors.orange,
            gradientColor: Colors.orange.withOpacity(0.3),
            lineWidth: 3,
            pointSize: 6,
          ),
          AreaChartSeries(
            name: 'Min Temperature',
            dataPoints: [
              const AreaChartData(value: 18, label: 'Mon'),
              const AreaChartData(value: 22, label: 'Tue'),
              const AreaChartData(value: 25, label: 'Wed'),
              const AreaChartData(value: 23, label: 'Thu'),
              const AreaChartData(value: 20, label: 'Fri'),
              const AreaChartData(value: 17, label: 'Sat'),
              const AreaChartData(value: 15, label: 'Sun'),
            ],
            color: Colors.blue,
            gradientColor: Colors.blue.withOpacity(0.3),
            lineWidth: 3,
            pointSize: 6,
          ),
        ],
        metadata: {'unit': '°C', 'location': 'City Center'},
      ),

      AreaChartExample(
        title: 'Portfolio Performance',
        description: 'Investment portfolio value over time with benchmark',
        category: 'finance',
        series: [
          AreaChartSeries(
            name: 'Portfolio Value',
            dataPoints: [
              const AreaChartData(value: 50000, label: 'Q1 2023'),
              const AreaChartData(value: 53000, label: 'Q2 2023'),
              const AreaChartData(value: 49000, label: 'Q3 2023'),
              const AreaChartData(value: 56000, label: 'Q4 2023'),
              const AreaChartData(value: 61000, label: 'Q1 2024'),
              const AreaChartData(value: 58000, label: 'Q2 2024'),
              const AreaChartData(value: 65000, label: 'Q3 2024'),
              const AreaChartData(value: 72000, label: 'Q4 2024'),
            ],
            color: AppColors.accentLight,
            gradientColor: AppColors.accentLight.withOpacity(0.4),
            lineWidth: 4,
            pointSize: 8,
          ),
          AreaChartSeries(
            name: 'Market Benchmark',
            dataPoints: [
              const AreaChartData(value: 48000, label: 'Q1 2023'),
              const AreaChartData(value: 50000, label: 'Q2 2023'),
              const AreaChartData(value: 47000, label: 'Q3 2023'),
              const AreaChartData(value: 52000, label: 'Q4 2023'),
              const AreaChartData(value: 55000, label: 'Q1 2024'),
              const AreaChartData(value: 53000, label: 'Q2 2024'),
              const AreaChartData(value: 58000, label: 'Q3 2024'),
              const AreaChartData(value: 62000, label: 'Q4 2024'),
            ],
            color: Colors.grey,
            gradientColor: Colors.grey.withOpacity(0.2),
            lineWidth: 2,
            pointSize: 5,
          ),
        ],
        metadata: {'unit': 'USD', 'period': 'quarterly'},
      ),

      AreaChartExample(
        title: 'E-commerce Sales',
        description: 'Online vs in-store sales performance comparison',
        category: 'ecommerce',
        series: [
          AreaChartSeries(
            name: 'Online Sales',
            dataPoints: [
              const AreaChartData(value: 85000, label: 'Jan'),
              const AreaChartData(value: 92000, label: 'Feb'),
              const AreaChartData(value: 88000, label: 'Mar'),
              const AreaChartData(value: 105000, label: 'Apr'),
              const AreaChartData(value: 98000, label: 'May'),
              const AreaChartData(value: 112000, label: 'Jun'),
            ],
            color: Colors.purple,
            gradientColor: Colors.purple.withOpacity(0.3),
            lineWidth: 3,
            pointSize: 6,
          ),
          AreaChartSeries(
            name: 'In-Store Sales',
            dataPoints: [
              const AreaChartData(value: 65000, label: 'Jan'),
              const AreaChartData(value: 58000, label: 'Feb'),
              const AreaChartData(value: 62000, label: 'Mar'),
              const AreaChartData(value: 55000, label: 'Apr'),
              const AreaChartData(value: 60000, label: 'May'),
              const AreaChartData(value: 52000, label: 'Jun'),
            ],
            color: Colors.teal,
            gradientColor: Colors.teal.withOpacity(0.3),
            lineWidth: 3,
            pointSize: 6,
          ),
        ],
        metadata: {'unit': 'USD', 'trend': 'digital_shift'},
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

  // Property Documentation Sections
  static List<PropertySection> getPropertySections() {
    return [
      PropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.primary,
        properties: [
          PropertyInfo(
            name: 'series',
            type: 'List<AreaChartSeries>',
            description: 'List of data series to display in the chart',
            required: true,
            example: '[AreaChartSeries(...)]',
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
            name: 'showGrid',
            type: 'bool',
            description: 'Display background grid lines',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'showLegend',
            type: 'bool',
            description: 'Display legend for multiple series',
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
          PropertyInfo(
            name: 'onAnimationComplete',
            type: 'VoidCallback?',
            description: 'Callback when animation finishes',
            required: false,
            example: '() => print("Animation complete!")',
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
            name: 'colors',
            type: 'List<Color>',
            description: 'Color palette for multiple series',
            required: false,
            defaultValue: 'Material colors',
            example: '[Colors.blue, Colors.red]',
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
            name: 'gridColor',
            type: 'Color',
            description: 'Color of the grid lines',
            required: false,
            defaultValue: 'Colors.grey',
            example: 'Colors.grey',
          ),
          PropertyInfo(
            name: 'showPoints',
            type: 'bool',
            description: 'Display data points on lines',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'defaultPointSize',
            type: 'double',
            description: 'Default size for data points',
            required: false,
            defaultValue: '4.0',
            example: '6.0',
          ),
          PropertyInfo(
            name: 'defaultLineWidth',
            type: 'double',
            description: 'Default thickness of area borders',
            required: false,
            defaultValue: '2.0',
            example: '3.0',
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
        title: 'Series Model',
        description: 'Individual series configuration',
        icon: Icons.data_object,
        color: AppColors.primaryLight,
        properties: [
          PropertyInfo(
            name: 'name',
            type: 'String',
            description: 'Series name displayed in legend',
            required: true,
            example: '"Revenue"',
          ),
          PropertyInfo(
            name: 'dataPoints',
            type: 'List<AreaChartData>',
            description: 'Data points for this series',
            required: true,
            example: '[AreaChartData(value: 100, label: "Jan")]',
          ),
          PropertyInfo(
            name: 'color',
            type: 'Color',
            description: 'Line and border color for the series',
            required: true,
            example: 'Colors.blue',
          ),
          PropertyInfo(
            name: 'gradientColor',
            type: 'Color',
            description: 'Fill color for the area gradient',
            required: true,
            example: 'Colors.blue.withOpacity(0.3)',
          ),
          PropertyInfo(
            name: 'lineWidth',
            type: 'double',
            description: 'Thickness of the series border line',
            required: false,
            defaultValue: '2.0',
            example: '3.0',
          ),
          PropertyInfo(
            name: 'pointSize',
            type: 'double',
            description: 'Size of data points for this series',
            required: false,
            defaultValue: '4.0',
            example: '6.0',
          ),
        ],
      ),

      PropertySection(
        title: 'Data Model',
        description: 'Data point structure',
        icon: Icons.scatter_plot,
        color: Colors.indigo,
        properties: [
          PropertyInfo(
            name: 'value',
            type: 'double',
            description: 'Numeric value for the Y-axis position',
            required: true,
            example: '150.0',
          ),
          PropertyInfo(
            name: 'label',
            type: 'String',
            description: 'Text label displayed on the X-axis',
            required: true,
            example: '"Q1"',
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
            example: 'Duration(milliseconds: 2000)',
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
            example: '() => print("Animation done!")',
          ),
        ],
      ),
    ];
  }

  // Code Examples
  static List<CodeExample> getCodeExamples() {
    return [
      CodeExample(
        title: 'Basic Usage',
        description: 'Simple area chart with single series',
        category: 'basic',
        code: '''final series = [
  AreaChartSeries(
    name: 'Revenue',
    dataPoints: [
      AreaChartData(value: 45, label: 'Jan'),
      AreaChartData(value: 52, label: 'Feb'),
      AreaChartData(value: 48, label: 'Mar'),
      AreaChartData(value: 61, label: 'Apr'),
    ],
    color: Colors.blue,
    gradientColor: Colors.blue.withOpacity(0.3),
    lineWidth: 3,
    pointSize: 6,
  ),
];

MaterialAreaChart(
  series: series,
  width: 400,
  height: 300,
)''',
      ),

      CodeExample(
        title: 'Multiple Series',
        description: 'Area chart with multiple data series and legend',
        category: 'advanced',
        code: '''final series = [
  AreaChartSeries(
    name: 'Revenue',
    dataPoints: revenueData,
    color: Colors.blue,
    gradientColor: Colors.blue.withOpacity(0.3),
    lineWidth: 3,
    pointSize: 6,
  ),
  AreaChartSeries(
    name: 'Expenses',
    dataPoints: expenseData,
    color: Colors.red,
    gradientColor: Colors.red.withOpacity(0.3),
    lineWidth: 3,
    pointSize: 6,
  ),
];

MaterialAreaChart(
  series: series,
  width: 600,
  height: 400,
  style: AreaChartStyle(
    colors: [Colors.blue, Colors.red, Colors.green],
    backgroundColor: Colors.white,
    gridColor: Colors.grey.withOpacity(0.3),
    showPoints: true,
    defaultPointSize: 6,
    defaultLineWidth: 3,
    labelStyle: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  showGrid: true,
  showLegend: true,
  padding: EdgeInsets.all(20),
)''',
      ),

      CodeExample(
        title: 'Custom Styling',
        description: 'Highly customized area chart with callbacks',
        category: 'customization',
        code: '''MaterialAreaChart(
  series: portfolioSeries,
  width: 500,
  height: 350,
  style: AreaChartStyle(
    colors: [
      Color(0xFF2563EB),
      Color(0xFF10B981),
      Color(0xFFF59E0B),
    ],
    backgroundColor: Color(0xFFF8F9FA),
    gridColor: Colors.grey.withOpacity(0.2),
    showPoints: true,
    defaultPointSize: 8,
    defaultLineWidth: 4,
    labelStyle: TextStyle(
      color: Color(0xFF374151),
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
    animationDuration: Duration(milliseconds: 2500),
    animationCurve: Curves.elasticOut,
  ),
  showGrid: true,
  showLegend: true,
  padding: EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 16,
  ),
  onAnimationComplete: () {
    print('Portfolio chart animation completed!');
    _showPerformanceSummary();
  },
)''',
      ),

      CodeExample(
        title: 'Interactive Features',
        description: 'Area chart with hover effects and touch interactions',
        category: 'interactive',
        code: '''MaterialAreaChart(
  series: userMetricsSeries,
  width: 650,
  height: 400,
  style: AreaChartStyle(
    colors: AppColors.chartPalette,
    backgroundColor: Colors.transparent,
    showPoints: true,
    defaultPointSize: 7,
    defaultLineWidth: 3,
    animationDuration: Duration(milliseconds: 1800),
    animationCurve: Curves.easeOutBack,
  ),
  showGrid: true,
  showLegend: true,
  interactive: true,
  onDataPointTap: (seriesIndex, pointIndex, data) {
    showTooltip(
      'Series: \${series[seriesIndex].name}\\n'
      'Value: \${data.value}\\n'
      'Label: \${data.label}',
    );
  },
  onAnimationComplete: () {
    _enableInteractions();
  },
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
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.amber,
      Colors.cyan,
      Colors.lime,
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.deepOrange,
    ];
  }

  // Generate dynamic live code based on current configuration
  static String generateLiveCode(
    AreaChartExample example,
    AreaChartConfig config,
    bool showRightPanel,
  ) {
    final seriesString = example.series
        .map((series) {
          final dataString = series.dataPoints
              .map(
                (data) =>
                    '      AreaChartData(value: ${data.value}, label: \'${data.label}\')',
              )
              .join(',\n');

          return '''  AreaChartSeries(
    name: '${series.name}',
    dataPoints: [
$dataString,
    ],
    color: ${_getColorName(AppColors.accent)},
    gradientColor: ${_getColorName(AppColors.accentDark)},
    lineWidth: ${config.lineWidth.toStringAsFixed(1)},
    pointSize: ${config.pointSize.toStringAsFixed(1)},
  )''';
        })
        .join(',\n');

    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);

    final animationCurveName = _getCurveName(config.animationCurve);

    return '''// ${example.title} Example - Live Customization
final series = [
$seriesString,
];

MaterialAreaChart(
  series: series,
  width: ${showRightPanel ? 450 : 650},
  height: 350,
  style: AreaChartStyle(
    colors: AppColors.chartPalette,
    backgroundColor: $backgroundColorName,
    gridColor: ${_getColorName(config.gridColor)},
    showPoints: ${config.showPoints},
    defaultPointSize: ${config.pointSize.toStringAsFixed(1)},
    defaultLineWidth: ${config.lineWidth.toStringAsFixed(1)},
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    animationDuration: Duration(milliseconds: ${(2000 / config.animationSpeed).round()}),
    animationCurve: $animationCurveName,
  ),
  showGrid: ${config.showGrid},
  showLegend: ${config.showLegend},
  padding: EdgeInsets.all(20),
  onAnimationComplete: () {
    print('${example.title} animation completed!');
  },
)''';
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
    // Handle exact color matches first
    if (color == AppColors.primary) return 'AppColors.primary';
    if (color == AppColors.accent) return 'AppColors.accent';
    if (color == AppColors.primaryLight) return 'AppColors.primaryLight';
    if (color == AppColors.accentLight) return 'AppColors.accentLight';
    if (color == Colors.orange) return 'Colors.orange';
    if (color == Colors.purple) return 'Colors.purple';
    if (color == Colors.teal) return 'Colors.teal';
    if (color == Colors.indigo) return 'Colors.indigo';
    if (color == Colors.pink) return 'Colors.pink';
    if (color == Colors.amber) return 'Colors.amber';
    if (color == Colors.cyan) return 'Colors.cyan';
    if (color == Colors.lime) return 'Colors.lime';
    if (color == Colors.blue) return 'Colors.blue';
    if (color == Colors.red) return 'Colors.red';
    if (color == Colors.green) return 'Colors.green';
    if (color == AppColors.border) return 'AppColors.border';
    if (color == Colors.white) return 'Colors.white';
    if (color == AppColors.surface) return 'AppColors.surface';
    if (color == AppColors.cardBackground) return 'AppColors.cardBackground';
    if (color == Colors.grey) return 'Colors.grey';
    if (color == Colors.deepOrange) return 'Colors.deepOrange';

    // Handle common opacity variations
    if (color == AppColors.primary.withOpacity(0.1))
      return 'AppColors.primary.withOpacity(0.1)';
    if (color == AppColors.primary.withOpacity(0.2))
      return 'AppColors.primary.withOpacity(0.2)';
    if (color == AppColors.primary.withOpacity(0.3))
      return 'AppColors.primary.withOpacity(0.3)';
    if (color == AppColors.primary.withOpacity(0.4))
      return 'AppColors.primary.withOpacity(0.4)';
    if (color == AppColors.primary.withOpacity(0.5))
      return 'AppColors.primary.withOpacity(0.5)';
    if (color == AppColors.primary.withOpacity(0.6))
      return 'AppColors.primary.withOpacity(0.6)';

    if (color == AppColors.accent.withOpacity(0.1))
      return 'AppColors.accent.withOpacity(0.1)';
    if (color == AppColors.accent.withOpacity(0.2))
      return 'AppColors.accent.withOpacity(0.2)';
    if (color == AppColors.accent.withOpacity(0.3))
      return 'AppColors.accent.withOpacity(0.3)';
    if (color == AppColors.accent.withOpacity(0.4))
      return 'AppColors.accent.withOpacity(0.4)';
    if (color == AppColors.accent.withOpacity(0.5))
      return 'AppColors.accent.withOpacity(0.5)';
    if (color == AppColors.accent.withOpacity(0.6))
      return 'AppColors.accent.withOpacity(0.6)';

    if (color == Colors.blue.withOpacity(0.3))
      return 'Colors.blue.withOpacity(0.3)';
    if (color == Colors.red.withOpacity(0.3))
      return 'Colors.red.withOpacity(0.3)';
    if (color == Colors.green.withOpacity(0.3))
      return 'Colors.green.withOpacity(0.3)';
    if (color == Colors.orange.withOpacity(0.3))
      return 'Colors.orange.withOpacity(0.3)';
    if (color == Colors.purple.withOpacity(0.3))
      return 'Colors.purple.withOpacity(0.3)';
    if (color == Colors.teal.withOpacity(0.3))
      return 'Colors.teal.withOpacity(0.3)';

    // For any other color with opacity, try to generate a reasonable approximation
    final opacity = color.opacity;
    if (opacity < 1.0) {
      // Check if it's close to any of our known colors
      final withoutOpacity = Color.fromARGB(
        255,
        color.red,
        color.green,
        color.blue,
      );

      if (_colorsAreClose(withoutOpacity, AppColors.primary)) {
        return 'AppColors.primary.withOpacity(${opacity.toStringAsFixed(1)})';
      }
      if (_colorsAreClose(withoutOpacity, AppColors.accent)) {
        return 'AppColors.accent.withOpacity(${opacity.toStringAsFixed(1)})';
      }
      if (_colorsAreClose(withoutOpacity, Colors.blue)) {
        return 'Colors.blue.withOpacity(${opacity.toStringAsFixed(1)})';
      }
      if (_colorsAreClose(withoutOpacity, Colors.red)) {
        return 'Colors.red.withOpacity(${opacity.toStringAsFixed(1)})';
      }
      if (_colorsAreClose(withoutOpacity, Colors.green)) {
        return 'Colors.green.withOpacity(${opacity.toStringAsFixed(1)})';
      }
    }

    // Default fallback
    return 'Colors.blue';
  }

  // Helper method to check if two colors are close enough
  static bool _colorsAreClose(Color a, Color b, {int threshold = 10}) {
    return (a.red - b.red).abs() < threshold &&
        (a.green - b.green).abs() < threshold &&
        (a.blue - b.blue).abs() < threshold;
  }

  // Utility method to get sample data for testing
  static List<AreaChartSeries> getSampleSeries() {
    return [
      AreaChartSeries(
        name: 'Sample Data',
        dataPoints: [
          const AreaChartData(value: 20, label: 'A'),
          const AreaChartData(value: 35, label: 'B'),
          const AreaChartData(value: 28, label: 'C'),
          const AreaChartData(value: 42, label: 'D'),
          const AreaChartData(value: 38, label: 'E'),
        ],
        color: AppColors.primary,
        gradientColor: AppColors.primary.withOpacity(0.3),
        lineWidth: 3,
        pointSize: 6,
      ),
    ];
  }

  // Generate random data for testing
  static List<AreaChartData> generateRandomData(
    int count, {
    double minValue = 10,
    double maxValue = 100,
    List<String>? labels,
  }) {
    final random = Random();
    return List.generate(count, (index) {
      final value = minValue + random.nextDouble() * (maxValue - minValue);
      final label = labels?[index] ?? 'Point ${index + 1}';
      return AreaChartData(value: value, label: label);
    });
  }

  // Preset configurations for quick setup
  static Map<String, AreaChartConfig> getPresetConfigurations() {
    return {
      'minimal': const AreaChartConfig(
        lineWidth: 2.0,
        pointSize: 4.0,
        fillOpacity: 0.2,
        showPoints: false,
        showGrid: false,
        showLegend: false,
        primaryColor: AppColors.textPrimary,
        backgroundColor: Colors.transparent,
      ),
      'modern': const AreaChartConfig(
        lineWidth: 3.0,
        pointSize: 6.0,
        fillOpacity: 0.4,
        showPoints: true,
        showGrid: true,
        showLegend: true,
        primaryColor: AppColors.primary,
        backgroundColor: Colors.white,
      ),
      'vibrant': const AreaChartConfig(
        lineWidth: 4.0,
        pointSize: 8.0,
        fillOpacity: 0.6,
        showPoints: true,
        showGrid: true,
        showLegend: true,
        primaryColor: AppColors.accent,
        backgroundColor: AppColors.surface,
      ),
      'classic': const AreaChartConfig(
        lineWidth: 2.0,
        pointSize: 5.0,
        fillOpacity: 0.3,
        showPoints: true,
        showGrid: true,
        showLegend: true,
        primaryColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
    };
  }
}
