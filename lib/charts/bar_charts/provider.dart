// lib/charts/bar_chart/provider.dart
import 'package:flutter/material.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';

/// Provides all bar chart examples, property definitions, and code samples
class BarChartDataProvider {
  // Chart Examples for Demo
  static List<BarChartExample> getChartExamples() {
    return [
      BarChartExample(
        title: 'Quarterly Revenue',
        description: 'Company revenue performance by quarter',
        color: AppColors.primary,
        category: 'business',
        data: [
          const BarChartData(value: 95000, label: 'Q1'),
          const BarChartData(value: 128000, label: 'Q2'),
          const BarChartData(value: 115000, label: 'Q3'),
          const BarChartData(value: 152000, label: 'Q4'),
        ],
        metadata: {'unit': 'USD', 'trend': 'positive'},
      ),

      BarChartExample(
        title: 'Product Categories',
        description: 'Sales distribution across product categories',
        color: AppColors.accent,
        category: 'sales',
        data: [
          const BarChartData(value: 85, label: 'Electronics'),
          const BarChartData(value: 92, label: 'Clothing'),
          const BarChartData(value: 78, label: 'Books'),
          const BarChartData(value: 105, label: 'Home'),
          const BarChartData(value: 67, label: 'Sports'),
        ],
        metadata: {'unit': 'units', 'period': 'monthly'},
      ),

      BarChartExample(
        title: 'Team Performance',
        description: 'Individual team member productivity scores',
        color: AppColors.primaryLight,
        category: 'hr',
        data: [
          const BarChartData(value: 88, label: 'Alice'),
          const BarChartData(value: 94, label: 'Bob'),
          const BarChartData(value: 76, label: 'Carol'),
          const BarChartData(value: 91, label: 'David'),
          const BarChartData(value: 83, label: 'Eve'),
          const BarChartData(value: 96, label: 'Frank'),
        ],
        metadata: {'unit': 'score', 'scale': '0-100'},
      ),

      BarChartExample(
        title: 'Monthly Expenses',
        description: 'Budget breakdown by expense category',
        color: AppColors.accentLight,
        category: 'finance',
        data: [
          const BarChartData(value: 1200, label: 'Rent'),
          const BarChartData(value: 450, label: 'Food'),
          const BarChartData(value: 300, label: 'Transport'),
          const BarChartData(value: 200, label: 'Utilities'),
          const BarChartData(value: 150, label: 'Entertainment'),
        ],
        metadata: {'unit': 'USD', 'period': 'monthly'},
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
            type: 'List<BarChartData>',
            description: 'Chart data points with values and labels',
            required: true,
            example: '[BarChartData(value: 100, label: "Q1")]',
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
            name: 'showValues',
            type: 'bool',
            description: 'Display values above bars',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'interactive',
            type: 'bool',
            description: 'Enable hover interactions',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'padding',
            type: 'EdgeInsets',
            description: 'Space around the chart content',
            required: false,
            defaultValue: 'EdgeInsets.all(24)',
            example: 'EdgeInsets.all(20)',
          ),
          PropertyInfo(
            name: 'horizontalGridLines',
            type: 'int',
            description: 'Number of horizontal grid lines',
            required: false,
            defaultValue: '5',
            example: '5',
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
            name: 'barColor',
            type: 'Color',
            description: 'Default color of the bars',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.blue',
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
            name: 'barSpacing',
            type: 'double',
            description: 'Spacing between bars as percentage (0.0-1.0)',
            required: false,
            defaultValue: '0.2',
            example: '0.3',
          ),
          PropertyInfo(
            name: 'cornerRadius',
            type: 'double',
            description: 'Radius for rounded bar corners',
            required: false,
            defaultValue: '4.0',
            example: '8.0',
          ),
          PropertyInfo(
            name: 'gradientEffect',
            type: 'bool',
            description: 'Apply gradient effect to bars',
            required: false,
            defaultValue: 'false',
            example: 'true',
          ),
          PropertyInfo(
            name: 'gradientColors',
            type: 'List<Color>?',
            description: 'Colors for gradient effect',
            required: false,
            example: '[Colors.blue, Colors.lightBlue]',
          ),
          PropertyInfo(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Styling for axis labels',
            required: false,
            example: 'TextStyle(fontSize: 12)',
          ),
          PropertyInfo(
            name: 'valueStyle',
            type: 'TextStyle?',
            description: 'Styling for value labels',
            required: false,
            example: 'TextStyle(fontSize: 10)',
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
            description: 'Numeric value for the bar height',
            required: true,
            example: '150.0',
          ),
          PropertyInfo(
            name: 'label',
            type: 'String',
            description: 'Text label displayed below the bar',
            required: true,
            example: '"Q1"',
          ),
          PropertyInfo(
            name: 'color',
            type: 'Color?',
            description: 'Optional custom color for individual bars',
            required: false,
            example: 'Colors.red',
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
        description: 'Simple bar chart with minimal configuration',
        category: 'basic',
        code: '''MaterialBarChart(
  data: [
    BarChartData(value: 95, label: 'Q1'),
    BarChartData(value: 128, label: 'Q2'),
    BarChartData(value: 115, label: 'Q3'),
    BarChartData(value: 152, label: 'Q4'),
  ],
  width: 400,
  height: 300,
)''',
      ),

      CodeExample(
        title: 'Advanced Styling',
        description: 'Customized appearance with gradient effects',
        category: 'advanced',
        code: '''MaterialBarChart(
  data: salesData,
  width: 600,
  height: 400,
  style: BarChartStyle(
    barColor: Colors.blue,
    backgroundColor: Colors.white,
    gridColor: Colors.grey.withValues(alpha: 0.3),
    barSpacing: 0.3,
    cornerRadius: 12.0,
    gradientEffect: true,
    gradientColors: [
      Colors.blue,
      Colors.lightBlue,
    ],
    labelStyle: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    valueStyle: TextStyle(
      color: Colors.blue,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  showGrid: true,
  showValues: true,
  interactive: true,
  padding: EdgeInsets.all(20),
)''',
      ),

      CodeExample(
        title: 'Custom Colors per Bar',
        description: 'Individual bar colors and interactions',
        category: 'customization',
        code: '''final data = [
  BarChartData(
    value: 95, 
    label: 'Sales', 
    color: Colors.green,
  ),
  BarChartData(
    value: 128, 
    label: 'Marketing', 
    color: Colors.orange,
  ),
  BarChartData(
    value: 115, 
    label: 'Support', 
    color: Colors.red,
  ),
  BarChartData(
    value: 152, 
    label: 'Development', 
    color: Colors.blue,
  ),
];

MaterialBarChart(
  data: data,
  width: 500,
  height: 350,
  interactive: true,
  onAnimationComplete: () {
    print('Bar chart animation completed!');
    _showSummary();
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
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.amber,
    ];
  }

  // Generate dynamic live code based on current configuration
  static String generateLiveCode(
    BarChartExample example,
    BarChartConfig config,
    bool showRightPanel,
  ) {
    final dataString = example.data
        .map(
          (data) =>
              '    BarChartData(value: ${data.value}, label: \'${data.label}\'),',
        )
        .join('\n');

    final barColorName = _getColorName(config.barColor);
    final gridColorName = _getColorName(config.gridColor);
    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);

    final gradientColorsString =
        config.gradientEffect
            ? '''
    gradientColors: [
      ${_getColorName(config.barColor)},
      ${_getColorName(config.barColor)}.withValues(alpha: 0.6),
    ],'''
            : '';

    return '''// ${example.title} Example - Live Customization
final data = [
$dataString
];

MaterialBarChart(
  data: data,
  width: ${showRightPanel ? 450 : 650},
  height: 300,
  style: BarChartStyle(
    barColor: $barColorName,
    backgroundColor: $backgroundColorName,
    gridColor: $gridColorName,
    barSpacing: ${config.barSpacing.toStringAsFixed(2)},
    cornerRadius: ${config.cornerRadius.toStringAsFixed(1)},
    gradientEffect: ${config.gradientEffect},$gradientColorsString
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    valueStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 11,
      fontWeight: FontWeight.w700,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  showGrid: ${config.showGrid},
  showValues: ${config.showValues},
  interactive: ${config.interactive},
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
    if (color == Colors.amber) return 'Colors.amber';
    if (color == AppColors.border) return 'AppColors.border';
    return 'Colors.blue';
  }
}
