// stackedbar_provider.dart
import 'package:flutter/material.dart';
import 'package:chat_test_01/material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';

/// Provides all stacked bar chart examples, property definitions, and code samples
class StackedBarChartDataProvider {
  // Chart Examples for Demo
  static List<StackedBarChartExample> getChartExamples() {
    return [
      StackedBarChartExample(
        title: 'Quarterly Sales Performance',
        description:
            'Track product sales across quarters with multiple segments',
        category: 'business',
        data: [
          StackedBarData(
            label: 'Q1',
            segments: [
              StackedBarSegment(
                value: 42,
                color: AppColors.primary,
                label: 'Product A',
              ),
              StackedBarSegment(
                value: 32,
                color: AppColors.accent,
                label: 'Product B',
              ),
              StackedBarSegment(
                value: 25,
                color: AppColors.primaryLight,
                label: 'Product C',
              ),
            ],
          ),
          StackedBarData(
            label: 'Q2',
            segments: [
              StackedBarSegment(
                value: 48,
                color: AppColors.primary,
                label: 'Product A',
              ),
              StackedBarSegment(
                value: 38,
                color: AppColors.accent,
                label: 'Product B',
              ),
              StackedBarSegment(
                value: 28,
                color: AppColors.primaryLight,
                label: 'Product C',
              ),
            ],
          ),
          StackedBarData(
            label: 'Q3',
            segments: [
              StackedBarSegment(
                value: 45,
                color: AppColors.primary,
                label: 'Product A',
              ),
              StackedBarSegment(
                value: 35,
                color: AppColors.accent,
                label: 'Product B',
              ),
              StackedBarSegment(
                value: 32,
                color: AppColors.primaryLight,
                label: 'Product C',
              ),
            ],
          ),
          StackedBarData(
            label: 'Q4',
            segments: [
              StackedBarSegment(
                value: 52,
                color: AppColors.primary,
                label: 'Product A',
              ),
              StackedBarSegment(
                value: 42,
                color: AppColors.accent,
                label: 'Product B',
              ),
              StackedBarSegment(
                value: 35,
                color: AppColors.primaryLight,
                label: 'Product C',
              ),
            ],
          ),
        ],
        metadata: {'unit': 'K USD', 'trend': 'positive'},
      ),

      StackedBarChartExample(
        title: 'Website Traffic Sources',
        description: 'Analyze traffic sources across different months',
        category: 'analytics',
        data: [
          StackedBarData(
            label: 'Jan',
            segments: [
              StackedBarSegment(
                value: 2500,
                color: Colors.blue,
                label: 'Organic',
              ),
              StackedBarSegment(
                value: 1800,
                color: Colors.green,
                label: 'Paid',
              ),
              StackedBarSegment(
                value: 950,
                color: Colors.orange,
                label: 'Social',
              ),
              StackedBarSegment(
                value: 650,
                color: Colors.purple,
                label: 'Direct',
              ),
            ],
          ),
          StackedBarData(
            label: 'Feb',
            segments: [
              StackedBarSegment(
                value: 2800,
                color: Colors.blue,
                label: 'Organic',
              ),
              StackedBarSegment(
                value: 2100,
                color: Colors.green,
                label: 'Paid',
              ),
              StackedBarSegment(
                value: 1200,
                color: Colors.orange,
                label: 'Social',
              ),
              StackedBarSegment(
                value: 750,
                color: Colors.purple,
                label: 'Direct',
              ),
            ],
          ),
          StackedBarData(
            label: 'Mar',
            segments: [
              StackedBarSegment(
                value: 3200,
                color: Colors.blue,
                label: 'Organic',
              ),
              StackedBarSegment(
                value: 1950,
                color: Colors.green,
                label: 'Paid',
              ),
              StackedBarSegment(
                value: 1100,
                color: Colors.orange,
                label: 'Social',
              ),
              StackedBarSegment(
                value: 800,
                color: Colors.purple,
                label: 'Direct',
              ),
            ],
          ),
          StackedBarData(
            label: 'Apr',
            segments: [
              StackedBarSegment(
                value: 3500,
                color: Colors.blue,
                label: 'Organic',
              ),
              StackedBarSegment(
                value: 2300,
                color: Colors.green,
                label: 'Paid',
              ),
              StackedBarSegment(
                value: 1350,
                color: Colors.orange,
                label: 'Social',
              ),
              StackedBarSegment(
                value: 900,
                color: Colors.purple,
                label: 'Direct',
              ),
            ],
          ),
        ],
        metadata: {'unit': 'visitors', 'period': 'monthly'},
      ),

      StackedBarChartExample(
        title: 'Team Performance Metrics',
        description: 'Compare team productivity across different categories',
        category: 'productivity',
        data: [
          StackedBarData(
            label: 'Design',
            segments: [
              StackedBarSegment(
                value: 85,
                color: Colors.teal,
                label: 'Completed',
              ),
              StackedBarSegment(
                value: 12,
                color: Colors.amber,
                label: 'In Progress',
              ),
              StackedBarSegment(value: 3, color: Colors.red, label: 'Blocked'),
            ],
          ),
          StackedBarData(
            label: 'Frontend',
            segments: [
              StackedBarSegment(
                value: 78,
                color: Colors.teal,
                label: 'Completed',
              ),
              StackedBarSegment(
                value: 18,
                color: Colors.amber,
                label: 'In Progress',
              ),
              StackedBarSegment(value: 4, color: Colors.red, label: 'Blocked'),
            ],
          ),
          StackedBarData(
            label: 'Backend',
            segments: [
              StackedBarSegment(
                value: 92,
                color: Colors.teal,
                label: 'Completed',
              ),
              StackedBarSegment(
                value: 6,
                color: Colors.amber,
                label: 'In Progress',
              ),
              StackedBarSegment(value: 2, color: Colors.red, label: 'Blocked'),
            ],
          ),
          StackedBarData(
            label: 'QA',
            segments: [
              StackedBarSegment(
                value: 88,
                color: Colors.teal,
                label: 'Completed',
              ),
              StackedBarSegment(
                value: 10,
                color: Colors.amber,
                label: 'In Progress',
              ),
              StackedBarSegment(value: 2, color: Colors.red, label: 'Blocked'),
            ],
          ),
        ],
        metadata: {'unit': '%', 'measurement': 'task_completion'},
      ),

      StackedBarChartExample(
        title: 'Budget Allocation',
        description: 'Department budget distribution across categories',
        category: 'finance',
        data: [
          StackedBarData(
            label: 'Engineering',
            segments: [
              StackedBarSegment(
                value: 180,
                color: Colors.indigo,
                label: 'Salaries',
              ),
              StackedBarSegment(
                value: 45,
                color: Colors.lightBlue,
                label: 'Tools',
              ),
              StackedBarSegment(
                value: 25,
                color: Colors.cyan,
                label: 'Training',
              ),
            ],
          ),
          StackedBarData(
            label: 'Marketing',
            segments: [
              StackedBarSegment(
                value: 120,
                color: Colors.indigo,
                label: 'Salaries',
              ),
              StackedBarSegment(
                value: 65,
                color: Colors.lightBlue,
                label: 'Tools',
              ),
              StackedBarSegment(
                value: 40,
                color: Colors.cyan,
                label: 'Training',
              ),
            ],
          ),
          StackedBarData(
            label: 'Sales',
            segments: [
              StackedBarSegment(
                value: 150,
                color: Colors.indigo,
                label: 'Salaries',
              ),
              StackedBarSegment(
                value: 35,
                color: Colors.lightBlue,
                label: 'Tools',
              ),
              StackedBarSegment(
                value: 30,
                color: Colors.cyan,
                label: 'Training',
              ),
            ],
          ),
          StackedBarData(
            label: 'Operations',
            segments: [
              StackedBarSegment(
                value: 95,
                color: Colors.indigo,
                label: 'Salaries',
              ),
              StackedBarSegment(
                value: 28,
                color: Colors.lightBlue,
                label: 'Tools',
              ),
              StackedBarSegment(
                value: 15,
                color: Colors.cyan,
                label: 'Training',
              ),
            ],
          ),
        ],
        metadata: {'unit': 'K USD', 'period': 'annual'},
      ),
    ];
  }

  // Animation curve options for customization
  static List<StackedBarCurveOption> getAnimationCurves() {
    return [
      StackedBarCurveOption(name: 'Ease In Out', curve: Curves.easeInOut),
      StackedBarCurveOption(name: 'Ease Out Cubic', curve: Curves.easeOutCubic),
      StackedBarCurveOption(name: 'Ease In', curve: Curves.easeIn),
      StackedBarCurveOption(name: 'Ease Out', curve: Curves.easeOut),
      StackedBarCurveOption(name: 'Bounce In', curve: Curves.bounceIn),
      StackedBarCurveOption(name: 'Bounce Out', curve: Curves.bounceOut),
      StackedBarCurveOption(name: 'Elastic In', curve: Curves.elasticIn),
      StackedBarCurveOption(name: 'Elastic Out', curve: Curves.elasticOut),
      StackedBarCurveOption(
        name: 'Fast Linear',
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      StackedBarCurveOption(name: 'Decelerate', curve: Curves.decelerate),
      StackedBarCurveOption(name: 'Linear', curve: Curves.linear),
    ];
  }

  // Property Documentation Sections
  static List<StackedBarPropertySection> getPropertySections() {
    return [
      StackedBarPropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.primary,
        properties: [
          StackedBarPropertyInfo(
            name: 'data',
            type: 'List<StackedBarData>',
            description: 'List of stacked bar data with segments',
            required: true,
            example: '[StackedBarData(label: "Q1", segments: [...])]',
          ),
          StackedBarPropertyInfo(
            name: 'width',
            type: 'double',
            description: 'Chart width in pixels',
            required: true,
            example: '700',
          ),
          StackedBarPropertyInfo(
            name: 'height',
            type: 'double',
            description: 'Chart height in pixels',
            required: true,
            example: '400',
          ),
          StackedBarPropertyInfo(
            name: 'showGrid',
            type: 'bool',
            description: 'Display background grid lines',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          StackedBarPropertyInfo(
            name: 'showValues',
            type: 'bool',
            description: 'Display values on bar segments',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          StackedBarPropertyInfo(
            name: 'interactive',
            type: 'bool',
            description: 'Enable hover interactions',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          StackedBarPropertyInfo(
            name: 'padding',
            type: 'EdgeInsets',
            description: 'Space around the chart content',
            required: false,
            defaultValue: 'EdgeInsets.all(24)',
            example: 'EdgeInsets.all(24)',
          ),
          StackedBarPropertyInfo(
            name: 'onAnimationComplete',
            type: 'VoidCallback?',
            description: 'Callback when animation finishes',
            required: false,
            example: '() => print("Animation done!")',
          ),
        ],
      ),

      StackedBarPropertySection(
        title: 'Style Properties',
        description: 'Visual styling options',
        icon: Icons.palette,
        color: AppColors.accent,
        properties: [
          StackedBarPropertyInfo(
            name: 'gridColor',
            type: 'Color',
            description: 'Color of the grid lines',
            required: false,
            defaultValue: 'Colors.grey',
            example: 'Colors.grey',
          ),
          StackedBarPropertyInfo(
            name: 'backgroundColor',
            type: 'Color',
            description: 'Background color of the chart',
            required: false,
            defaultValue: 'Colors.white',
            example: 'Colors.white',
          ),
          StackedBarPropertyInfo(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Styling for bar labels (X-axis)',
            required: false,
            example: 'TextStyle(fontSize: 12)',
          ),
          StackedBarPropertyInfo(
            name: 'valueStyle',
            type: 'TextStyle?',
            description: 'Styling for segment values',
            required: false,
            example: 'TextStyle(color: Colors.white)',
          ),
          StackedBarPropertyInfo(
            name: 'barSpacing',
            type: 'double',
            description: 'Spacing between bars (0.0 to 1.0)',
            required: false,
            defaultValue: '0.2',
            example: '0.35',
          ),
          StackedBarPropertyInfo(
            name: 'cornerRadius',
            type: 'double',
            description: 'Corner radius for rounded bars',
            required: false,
            defaultValue: '4.0',
            example: '16.0',
          ),
        ],
      ),

      StackedBarPropertySection(
        title: 'Data Models',
        description: 'Data structure definitions',
        icon: Icons.data_object,
        color: AppColors.primaryLight,
        properties: [
          StackedBarPropertyInfo(
            name: 'StackedBarData.label',
            type: 'String',
            description: 'Label for the entire bar (X-axis)',
            required: true,
            example: '"Q1"',
          ),
          StackedBarPropertyInfo(
            name: 'StackedBarData.segments',
            type: 'List<StackedBarSegment>',
            description: 'List of segments that make up the bar',
            required: true,
            example: '[StackedBarSegment(...)]',
          ),
          StackedBarPropertyInfo(
            name: 'StackedBarSegment.value',
            type: 'double',
            description: 'Numeric value of the segment',
            required: true,
            example: '42.5',
          ),
          StackedBarPropertyInfo(
            name: 'StackedBarSegment.color',
            type: 'Color',
            description: 'Color of the segment',
            required: true,
            example: 'Colors.blue',
          ),
          StackedBarPropertyInfo(
            name: 'StackedBarSegment.label',
            type: 'String?',
            description: 'Optional label for tooltips/legends',
            required: false,
            example: '"Product A"',
          ),
        ],
      ),

      StackedBarPropertySection(
        title: 'Y-Axis Configuration',
        description: 'Y-axis customization options',
        icon: Icons.vertical_align_center,
        color: AppColors.accentLight,
        properties: [
          StackedBarPropertyInfo(
            name: 'minValue',
            type: 'double?',
            description: 'Minimum value on Y-axis',
            required: false,
            example: '0',
          ),
          StackedBarPropertyInfo(
            name: 'maxValue',
            type: 'double?',
            description: 'Maximum value on Y-axis',
            required: false,
            example: '100',
          ),
          StackedBarPropertyInfo(
            name: 'divisions',
            type: 'int',
            description: 'Number of Y-axis divisions',
            required: false,
            defaultValue: '5',
            example: '10',
          ),
          StackedBarPropertyInfo(
            name: 'showAxisLine',
            type: 'bool',
            description: 'Show vertical axis line',
            required: false,
            defaultValue: 'true',
            example: 'false',
          ),
          StackedBarPropertyInfo(
            name: 'showGridLines',
            type: 'bool',
            description: 'Show horizontal grid lines',
            required: false,
            defaultValue: 'true',
            example: 'false',
          ),
          StackedBarPropertyInfo(
            name: 'axisWidth',
            type: 'double',
            description: 'Width allocated for Y-axis',
            required: false,
            defaultValue: '50.0',
            example: '60.0',
          ),
          StackedBarPropertyInfo(
            name: 'labelFormatter',
            type: 'String Function(double)?',
            description: 'Custom formatter for Y-axis labels',
            required: false,
            example: r'(value) => "${value.toInt()}"',
          ),
        ],
      ),

      StackedBarPropertySection(
        title: 'Animation Configuration',
        description: 'Animation settings',
        icon: Icons.animation,
        color: Colors.purple,
        properties: [
          StackedBarPropertyInfo(
            name: 'animationDuration',
            type: 'Duration',
            description: 'Length of the chart animation',
            required: false,
            defaultValue: 'Duration(milliseconds: 1500)',
            example: 'Duration(milliseconds: 2000)',
          ),
          StackedBarPropertyInfo(
            name: 'animationCurve',
            type: 'Curve',
            description: 'Animation easing curve style',
            required: false,
            defaultValue: 'Curves.easeInOut',
            example: 'Curves.bounceOut',
          ),
        ],
      ),
    ];
  }

  // Code Examples
  static List<StackedBarCodeExample> getCodeExamples() {
    return [
      StackedBarCodeExample(
        title: 'Basic Usage',
        description: 'Simple stacked bar chart with minimal configuration',
        category: 'basic',
        code: '''final data = [
  StackedBarData(
    label: 'Q1',
    segments: [
      StackedBarSegment(value: 42, color: Colors.blue, label: 'Product A'),
      StackedBarSegment(value: 32, color: Colors.green, label: 'Product B'),
      StackedBarSegment(value: 25, color: Colors.orange, label: 'Product C'),
    ],
  ),
  StackedBarData(
    label: 'Q2',
    segments: [
      StackedBarSegment(value: 48, color: Colors.blue, label: 'Product A'),
      StackedBarSegment(value: 38, color: Colors.green, label: 'Product B'),
      StackedBarSegment(value: 28, color: Colors.orange, label: 'Product C'),
    ],
  ),
];

MaterialStackedBarChart(
  data: data,
  width: 600,
  height: 400,
)''',
      ),

      StackedBarCodeExample(
        title: 'Advanced Styling',
        description: 'Customized appearance with Y-axis and animations',
        category: 'advanced',
        code: '''MaterialStackedBarChart(
  data: salesData,
  width: 700,
  height: 400,
  style: StackedBarChartStyle(
    backgroundColor: Colors.white,
    gridColor: Colors.grey.withOpacity(0.3),
    barSpacing: 0.3,
    cornerRadius: 12.0,
    labelStyle: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    valueStyle: TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.w700,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
    yAxisConfig: YAxisConfig(
      divisions: 8,
      showGridLines: true,
      axisWidth: 60,
      labelFormatter: (value) => '\$\${value.toInt()}K',
    ),
  ),
  showGrid: true,
  showValues: true,
  interactive: true,
  padding: EdgeInsets.all(24),
)''',
      ),

      StackedBarCodeExample(
        title: 'With Callbacks',
        description: 'Handling animation completion events',
        category: 'callbacks',
        code: '''MaterialStackedBarChart(
  data: performanceData,
  width: 600,
  height: 350,
  onAnimationComplete: () {
    print('Stacked bar chart animation completed!');
    _showDataSummary();
  },
  style: StackedBarChartStyle(
    animationDuration: Duration(milliseconds: 1800),
    cornerRadius: 8.0,
  ),
)''',
      ),

      StackedBarCodeExample(
        title: 'Custom Y-Axis Formatting',
        description: 'Advanced Y-axis configuration with custom formatting',
        category: 'y-axis',
        code: '''MaterialStackedBarChart(
  data: budgetData,
  width: 700,
  height: 450,
  style: StackedBarChartStyle(
    yAxisConfig: YAxisConfig(
      minValue: 0,
      maxValue: 500,
      divisions: 10,
      showAxisLine: true,
      showGridLines: true,
      axisWidth: 70,
      labelStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
      labelFormatter: (value) {
        if (value >= 1000) {
          return '\${(value / 1000).toStringAsFixed(1)}M';
        } else {
          return '\${value.toInt()}K';
        }
      },
    ),
    barSpacing: 0.25,
    cornerRadius: 6.0,
  ),
  padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
)''',
      ),
    ];
  }

  // Available color palettes for customization
  static List<StackedBarColorSetOption> getColorPalette() {
    return [
      StackedBarColorSetOption(
        name: 'Default',
        colors: [
          AppColors.primary,
          AppColors.accent,
          AppColors.primaryLight,
          AppColors.accentLight,
        ],
      ),
      StackedBarColorSetOption(
        name: 'Business',
        colors: [Colors.blue, Colors.green, Colors.orange, Colors.purple],
      ),
      StackedBarColorSetOption(
        name: 'Vibrant',
        colors: [Colors.red, Colors.pink, Colors.purple, Colors.deepPurple],
      ),
      StackedBarColorSetOption(
        name: 'Nature',
        colors: [Colors.green, Colors.teal, Colors.lightGreen, Colors.lime],
      ),
      StackedBarColorSetOption(
        name: 'Ocean',
        colors: [Colors.blue, Colors.cyan, Colors.lightBlue, Colors.indigo],
      ),
      StackedBarColorSetOption(
        name: 'Warm',
        colors: [Colors.orange, Colors.red, Colors.deepOrange, Colors.amber],
      ),
      StackedBarColorSetOption(
        name: 'Professional',
        colors: [
          Colors.indigo,
          Colors.blueGrey,
          Colors.grey[600]!,
          Colors.grey[400]!,
        ],
      ),
      StackedBarColorSetOption(
        name: 'Pastel',
        colors: [
          Colors.blue[200]!,
          Colors.green[200]!,
          Colors.orange[200]!,
          Colors.purple[200]!,
        ],
      ),
    ];
  }

  // Generate dynamic live code with current configuration
  static String generateLiveCode(
    StackedBarChartExample example,
    StackedBarChartConfig config,
    bool showRightPanel,
  ) {
    final dataString = example.data
        .map((barData) {
          final segmentsString = barData.segments
              .asMap()
              .entries
              .map((entry) {
                final index = entry.key;
                final segment = entry.value;
                return '      StackedBarSegment(value: ${segment.value}, color: segmentColors[$index], label: \'${segment.label}\')';
              })
              .join(',\n');

          return '''  StackedBarData(
    label: '${barData.label}',
    segments: [
$segmentsString,
    ],
  )''';
        })
        .join(',\n');

    final colorsString = config.segmentColors
        .map((color) => _getColorName(color))
        .join(', ');
    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);
    final animationCurveName = _getCurveName(config.animationCurve);

    final yAxisConfig =
        config.showYAxis
            ? '''
    yAxisConfig: YAxisConfig(
      divisions: ${config.yAxisDivisions},
      showAxisLine: ${config.showAxisLine},
      showGridLines: ${config.showYAxisGridLines},
      axisWidth: ${config.yAxisWidth.toStringAsFixed(1)},
      labelStyle: TextStyle(
        color: ${_getColorName(config.yAxisTextColor)},
        fontSize: ${config.yAxisFontSize.toStringAsFixed(1)},
        fontWeight: FontWeight.w500,
      ),
    ),'''
            : '';

    return '''// ${example.title} Example - Live Customization
// Note: Segment colors are applied from the segmentColors list
final segmentColors = [$colorsString];

final data = [
$dataString,
];

MaterialStackedBarChart(
  data: data,
  width: ${showRightPanel ? 500 : 700},
  height: 400,
  style: StackedBarChartStyle(
    backgroundColor: $backgroundColorName,
    gridColor: ${_getColorName(config.gridColor)},
    barSpacing: ${config.barSpacing.toStringAsFixed(2)},
    cornerRadius: ${config.cornerRadius.toStringAsFixed(1)},
    labelStyle: TextStyle(
      color: ${_getColorName(config.labelTextColor)},
      fontSize: ${config.labelFontSize.toStringAsFixed(1)},
      fontWeight: FontWeight.w600,
    ),
    valueStyle: TextStyle(
      color: ${_getColorName(config.valueTextColor)},
      fontSize: ${config.valueFontSize.toStringAsFixed(1)},
      fontWeight: FontWeight.w700,
    ),
    animationDuration: Duration(milliseconds: ${config.animationDuration.inMilliseconds}),
    animationCurve: $animationCurveName,$yAxisConfig
  ),
  showGrid: ${config.showGrid},
  showValues: ${config.showValues},
  interactive: ${config.enableInteraction},
  horizontalGridLines: ${config.horizontalGridLines},
  padding: EdgeInsets.all(${config.chartPadding.toStringAsFixed(1)}),
  onAnimationComplete: () {
    print('${example.title} animation completed!');
  },
)''';
  }

  // Helper methods for code generation
  static String _getCurveName(Curve curve) {
    if (curve == Curves.easeInOut) return 'Curves.easeInOut';
    if (curve == Curves.easeOutCubic) return 'Curves.easeOutCubic';
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
    return 'Curves.easeInOut';
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
    if (color == Colors.cyan) return 'Colors.cyan';
    if (color == Colors.lightBlue) return 'Colors.lightBlue';
    if (color == Colors.lightGreen) return 'Colors.lightGreen';
    if (color == Colors.lime) return 'Colors.lime';
    if (color == Colors.deepOrange) return 'Colors.deepOrange';
    if (color == Colors.amber) return 'Colors.amber';
    if (color == Colors.deepPurple) return 'Colors.deepPurple';
    if (color == Colors.grey) return 'Colors.grey';
    if (color == Colors.blueGrey) return 'Colors.blueGrey';
    if (color == Colors.black) return 'Colors.black';
    if (color == Colors.white) return 'Colors.white';
    if (color == AppColors.border) return 'AppColors.border';
    if (color == AppColors.textSecondary) return 'AppColors.textSecondary';
    if (color == AppColors.textPrimary) return 'AppColors.textPrimary';
    return 'Colors.blue';
  }
}
