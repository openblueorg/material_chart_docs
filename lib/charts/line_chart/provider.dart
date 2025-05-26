// data/chart_data_provider.dart
import 'package:flutter/material.dart';
import 'package:chat_test_01/material_charts/material_charts.dart';
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

  // Code Examples
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
        title: 'Advanced Styling',
        description: 'Customized appearance and animation',
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
    labelStyle: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  showPoints: true,
  showGrid: true,
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

  // Generate dynamic live code based on current configuration
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
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  showPoints: ${config.showPoints},
  showGrid: ${config.showGrid},
  padding: EdgeInsets.all(20),
  onAnimationComplete: () {
    print('${example.title} animation completed!');
  },
)''';
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
    if (color == AppColors.border) return 'AppColors.border';
    return 'Colors.blue';
  }
}
