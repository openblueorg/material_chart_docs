// multiline_provider.dart
import 'package:flutter/material.dart';
import 'package:chat_test_01/material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';

/// Provides all multi-line chart examples, property definitions, and code samples
class MultiLineChartDataProvider {
  // Chart Examples for Demo
  static List<MultiLineChartExample> getChartExamples() {
    return [
      MultiLineChartExample(
        title: 'Business Metrics Dashboard',
        description: 'Track revenue, profit, and growth trends',
        category: 'business',
        series: [
          ChartSeries(
            name: 'Revenue',
            dataPoints: [
              const ChartDataPoint(value: 32000, label: 'Jan'),
              const ChartDataPoint(value: 48000, label: 'Feb'),
              const ChartDataPoint(value: 42000, label: 'Mar'),
              const ChartDataPoint(value: 65000, label: 'Apr'),
              const ChartDataPoint(value: 58000, label: 'May'),
              const ChartDataPoint(value: 78000, label: 'Jun'),
              const ChartDataPoint(value: 85000, label: 'Jul'),
            ],
            color: AppColors.primary,
          ),
          ChartSeries(
            name: 'Profit',
            dataPoints: [
              const ChartDataPoint(value: 22000, label: 'Jan'),
              const ChartDataPoint(value: 35000, label: 'Feb'),
              const ChartDataPoint(value: 28000, label: 'Mar'),
              const ChartDataPoint(value: 48000, label: 'Apr'),
              const ChartDataPoint(value: 38000, label: 'May'),
              const ChartDataPoint(value: 58000, label: 'Jun'),
              const ChartDataPoint(value: 62000, label: 'Jul'),
            ],
            color: AppColors.accent,
          ),
          ChartSeries(
            name: 'Growth Target',
            dataPoints: [
              const ChartDataPoint(value: 18000, label: 'Jan'),
              const ChartDataPoint(value: 28000, label: 'Feb'),
              const ChartDataPoint(value: 35000, label: 'Mar'),
              const ChartDataPoint(value: 45000, label: 'Apr'),
              const ChartDataPoint(value: 52000, label: 'May'),
              const ChartDataPoint(value: 65000, label: 'Jun'),
              const ChartDataPoint(value: 75000, label: 'Jul'),
            ],
            color: AppColors.primaryLight,
          ),
        ],
        metadata: {'unit': 'USD', 'trend': 'positive'},
      ),

      MultiLineChartExample(
        title: 'Website Analytics',
        description: 'Monitor page views, sessions, and bounce rate',
        category: 'analytics',
        series: [
          ChartSeries(
            name: 'Page Views',
            dataPoints: [
              const ChartDataPoint(value: 2500, label: 'Mon'),
              const ChartDataPoint(value: 3200, label: 'Tue'),
              const ChartDataPoint(value: 2800, label: 'Wed'),
              const ChartDataPoint(value: 3800, label: 'Thu'),
              const ChartDataPoint(value: 4200, label: 'Fri'),
              const ChartDataPoint(value: 3600, label: 'Sat'),
              const ChartDataPoint(value: 2900, label: 'Sun'),
            ],
            color: Colors.blue,
          ),
          ChartSeries(
            name: 'Sessions',
            dataPoints: [
              const ChartDataPoint(value: 1800, label: 'Mon'),
              const ChartDataPoint(value: 2200, label: 'Tue'),
              const ChartDataPoint(value: 1950, label: 'Wed'),
              const ChartDataPoint(value: 2600, label: 'Thu'),
              const ChartDataPoint(value: 2900, label: 'Fri'),
              const ChartDataPoint(value: 2400, label: 'Sat'),
              const ChartDataPoint(value: 1850, label: 'Sun'),
            ],
            color: Colors.green,
          ),
          ChartSeries(
            name: 'Bounce Rate',
            dataPoints: [
              const ChartDataPoint(value: 850, label: 'Mon'),
              const ChartDataPoint(value: 920, label: 'Tue'),
              const ChartDataPoint(value: 780, label: 'Wed'),
              const ChartDataPoint(value: 1100, label: 'Thu'),
              const ChartDataPoint(value: 1250, label: 'Fri'),
              const ChartDataPoint(value: 980, label: 'Sat'),
              const ChartDataPoint(value: 720, label: 'Sun'),
            ],
            color: Colors.red,
          ),
        ],
        metadata: {'unit': 'count', 'period': 'weekly'},
      ),

      MultiLineChartExample(
        title: 'Temperature Monitoring',
        description: 'Track temperature variations across different sensors',
        category: 'sensors',
        series: [
          ChartSeries(
            name: 'Outdoor',
            dataPoints: [
              const ChartDataPoint(value: 18.5, label: '6AM'),
              const ChartDataPoint(value: 22.3, label: '9AM'),
              const ChartDataPoint(value: 28.7, label: '12PM'),
              const ChartDataPoint(value: 32.1, label: '3PM'),
              const ChartDataPoint(value: 29.8, label: '6PM'),
              const ChartDataPoint(value: 24.6, label: '9PM'),
              const ChartDataPoint(value: 20.2, label: '12AM'),
            ],
            color: Colors.orange,
          ),
          ChartSeries(
            name: 'Indoor',
            dataPoints: [
              const ChartDataPoint(value: 21.2, label: '6AM'),
              const ChartDataPoint(value: 22.8, label: '9AM'),
              const ChartDataPoint(value: 24.1, label: '12PM'),
              const ChartDataPoint(value: 25.3, label: '3PM'),
              const ChartDataPoint(value: 24.9, label: '6PM'),
              const ChartDataPoint(value: 23.5, label: '9PM'),
              const ChartDataPoint(value: 22.1, label: '12AM'),
            ],
            color: Colors.teal,
          ),
          ChartSeries(
            name: 'Basement',
            dataPoints: [
              const ChartDataPoint(value: 19.8, label: '6AM'),
              const ChartDataPoint(value: 20.1, label: '9AM'),
              const ChartDataPoint(value: 20.5, label: '12PM'),
              const ChartDataPoint(value: 21.2, label: '3PM'),
              const ChartDataPoint(value: 21.0, label: '6PM'),
              const ChartDataPoint(value: 20.7, label: '9PM'),
              const ChartDataPoint(value: 20.3, label: '12AM'),
            ],
            color: Colors.indigo,
          ),
        ],
        metadata: {'unit': '°C', 'location': 'Smart Home'},
      ),

      MultiLineChartExample(
        title: 'Stock Performance',
        description: 'Compare stock prices for different companies',
        category: 'finance',
        series: [
          ChartSeries(
            name: 'AAPL',
            dataPoints: [
              const ChartDataPoint(value: 150.2, label: 'Jan'),
              const ChartDataPoint(value: 155.8, label: 'Feb'),
              const ChartDataPoint(value: 148.9, label: 'Mar'),
              const ChartDataPoint(value: 162.4, label: 'Apr'),
              const ChartDataPoint(value: 158.7, label: 'May'),
              const ChartDataPoint(value: 165.3, label: 'Jun'),
            ],
            color: Colors.grey,
          ),
          ChartSeries(
            name: 'GOOGL',
            dataPoints: [
              const ChartDataPoint(value: 2250.5, label: 'Jan'),
              const ChartDataPoint(value: 2380.2, label: 'Feb'),
              const ChartDataPoint(value: 2195.8, label: 'Mar'),
              const ChartDataPoint(value: 2420.7, label: 'Apr'),
              const ChartDataPoint(value: 2485.3, label: 'May'),
              const ChartDataPoint(value: 2510.9, label: 'Jun'),
            ],
            color: Colors.red,
          ),
          ChartSeries(
            name: 'MSFT',
            dataPoints: [
              const ChartDataPoint(value: 310.8, label: 'Jan'),
              const ChartDataPoint(value: 325.4, label: 'Feb'),
              const ChartDataPoint(value: 298.6, label: 'Mar'),
              const ChartDataPoint(value: 340.2, label: 'Apr'),
              const ChartDataPoint(value: 355.7, label: 'May'),
              const ChartDataPoint(value: 362.1, label: 'Jun'),
            ],
            color: Colors.blue,
          ),
        ],
        metadata: {'unit': 'USD', 'market': 'NASDAQ'},
      ),
    ];
  }

  // Animation curve options for customization
  static List<MultiLineCurveOption> getAnimationCurves() {
    return [
      MultiLineCurveOption(name: 'Ease Out Cubic', curve: Curves.easeOutCubic),
      MultiLineCurveOption(name: 'Ease In Out', curve: Curves.easeInOut),
      MultiLineCurveOption(name: 'Ease In', curve: Curves.easeIn),
      MultiLineCurveOption(name: 'Ease Out', curve: Curves.easeOut),
      MultiLineCurveOption(name: 'Bounce In', curve: Curves.bounceIn),
      MultiLineCurveOption(name: 'Bounce Out', curve: Curves.bounceOut),
      MultiLineCurveOption(name: 'Elastic In', curve: Curves.elasticIn),
      MultiLineCurveOption(name: 'Elastic Out', curve: Curves.elasticOut),
      MultiLineCurveOption(
        name: 'Fast Linear',
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      MultiLineCurveOption(name: 'Decelerate', curve: Curves.decelerate),
      MultiLineCurveOption(name: 'Linear', curve: Curves.linear),
    ];
  }

  // Legend position options
  static List<LegendPositionOption> getLegendPositions() {
    return [
      LegendPositionOption(
        name: 'Bottom',
        position: LegendPosition.bottom,
        icon: Icons.south,
      ),
      LegendPositionOption(
        name: 'Top',
        position: LegendPosition.top,
        icon: Icons.north,
      ),
      LegendPositionOption(
        name: 'Left',
        position: LegendPosition.left,
        icon: Icons.west,
      ),
      LegendPositionOption(
        name: 'Right',
        position: LegendPosition.right,
        icon: Icons.east,
      ),
    ];
  }

  // Property Documentation Sections
  static List<MultiLinePropertySection> getPropertySections() {
    return [
      MultiLinePropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.primary,
        properties: [
          MultiLinePropertyInfo(
            name: 'series',
            type: 'List<ChartSeries>',
            description: 'List of data series to display on the chart',
            required: true,
            example: '[ChartSeries(name: "Revenue", dataPoints: [...)]',
          ),
          MultiLinePropertyInfo(
            name: 'width',
            type: 'double?',
            description: 'Chart width in pixels (optional)',
            required: false,
            example: '400',
          ),
          MultiLinePropertyInfo(
            name: 'height',
            type: 'double?',
            description: 'Chart height in pixels (optional)',
            required: false,
            example: '300',
          ),
          MultiLinePropertyInfo(
            name: 'enableZoom',
            type: 'bool',
            description: 'Enable zoom functionality',
            required: false,
            defaultValue: 'false',
            example: 'true',
          ),
          MultiLinePropertyInfo(
            name: 'enablePan',
            type: 'bool',
            description: 'Enable pan functionality',
            required: false,
            defaultValue: 'false',
            example: 'true',
          ),
          MultiLinePropertyInfo(
            name: 'onPointTap',
            type: 'ValueChanged<ChartDataPoint>?',
            description: 'Callback when a point is tapped',
            required: false,
            example: '(point) => print(point.value)',
          ),
          MultiLinePropertyInfo(
            name: 'onChartTap',
            type: 'ValueChanged<Offset>?',
            description: 'Callback when chart area is tapped',
            required: false,
            example: '(offset) => print(offset)',
          ),
        ],
      ),

      MultiLinePropertySection(
        title: 'Style Properties',
        description: 'Visual styling options',
        icon: Icons.palette,
        color: AppColors.accent,
        properties: [
          MultiLinePropertyInfo(
            name: 'colors',
            type: 'List<Color>',
            description: 'Colors used for different series',
            required: true,
            example: '[Colors.blue, Colors.red, Colors.green]',
          ),
          MultiLinePropertyInfo(
            name: 'backgroundColor',
            type: 'Color',
            description: 'Background color of the chart',
            required: false,
            defaultValue: 'Colors.white',
            example: 'Colors.white',
          ),
          MultiLinePropertyInfo(
            name: 'gridColor',
            type: 'Color',
            description: 'Color of the grid lines',
            required: false,
            defaultValue: 'Colors.grey',
            example: 'Colors.grey',
          ),
          MultiLinePropertyInfo(
            name: 'defaultLineWidth',
            type: 'double',
            description: 'Default thickness of series lines',
            required: false,
            defaultValue: '2.0',
            example: '3.0',
          ),
          MultiLinePropertyInfo(
            name: 'defaultPointSize',
            type: 'double',
            description: 'Default size of data points',
            required: false,
            defaultValue: '4.0',
            example: '6.0',
          ),
          MultiLinePropertyInfo(
            name: 'showPoints',
            type: 'bool',
            description: 'Display data points on lines',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          MultiLinePropertyInfo(
            name: 'showGrid',
            type: 'bool',
            description: 'Display background grid lines',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          MultiLinePropertyInfo(
            name: 'showLegend',
            type: 'bool',
            description: 'Display chart legend',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          MultiLinePropertyInfo(
            name: 'smoothLines',
            type: 'bool',
            description: 'Use smooth curves instead of straight lines',
            required: false,
            defaultValue: 'false',
            example: 'true',
          ),
          MultiLinePropertyInfo(
            name: 'legendPosition',
            type: 'LegendPosition',
            description: 'Position of the legend',
            required: false,
            defaultValue: 'LegendPosition.bottom',
            example: 'LegendPosition.right',
          ),
        ],
      ),

      MultiLinePropertySection(
        title: 'Series Model',
        description: 'Individual series configuration',
        icon: Icons.timeline,
        color: AppColors.primaryLight,
        properties: [
          MultiLinePropertyInfo(
            name: 'name',
            type: 'String',
            description: 'Name of the data series for legend',
            required: true,
            example: '"Revenue"',
          ),
          MultiLinePropertyInfo(
            name: 'dataPoints',
            type: 'List<ChartDataPoint>',
            description: 'List of data points for this series',
            required: true,
            example: '[ChartDataPoint(value: 100, label: "Jan")]',
          ),
          MultiLinePropertyInfo(
            name: 'color',
            type: 'Color?',
            description: 'Optional color override for this series',
            required: false,
            example: 'Colors.blue',
          ),
          MultiLinePropertyInfo(
            name: 'lineWidth',
            type: 'double?',
            description: 'Optional line width override',
            required: false,
            example: '3.0',
          ),
          MultiLinePropertyInfo(
            name: 'pointSize',
            type: 'double?',
            description: 'Optional point size override',
            required: false,
            example: '6.0',
          ),
          MultiLinePropertyInfo(
            name: 'showPoints',
            type: 'bool?',
            description: 'Optional show points override',
            required: false,
            example: 'false',
          ),
          MultiLinePropertyInfo(
            name: 'smoothLine',
            type: 'bool?',
            description: 'Optional smooth line override',
            required: false,
            example: 'true',
          ),
        ],
      ),

      MultiLinePropertySection(
        title: 'Animation Config',
        description: 'Animation settings',
        icon: Icons.animation,
        color: AppColors.accentLight,
        properties: [
          MultiLinePropertyInfo(
            name: 'duration',
            type: 'Duration',
            description: 'Length of the chart animation',
            required: false,
            defaultValue: 'Duration(milliseconds: 1000)',
            example: 'Duration(milliseconds: 1500)',
          ),
          MultiLinePropertyInfo(
            name: 'curve',
            type: 'Curve',
            description: 'Animation easing curve style',
            required: false,
            defaultValue: 'Curves.easeInOut',
            example: 'Curves.easeOutCubic',
          ),
          MultiLinePropertyInfo(
            name: 'enabled',
            type: 'bool',
            description: 'Enable or disable animations',
            required: false,
            defaultValue: 'true',
            example: 'false',
          ),
        ],
      ),

      MultiLinePropertySection(
        title: 'Crosshair & Tooltips',
        description: 'Interactive features',
        icon: Icons.my_location,
        color: Colors.purple,
        properties: [
          MultiLinePropertyInfo(
            name: 'enabled',
            type: 'bool',
            description: 'Enable crosshair functionality',
            required: false,
            defaultValue: 'true',
            example: 'false',
          ),
          MultiLinePropertyInfo(
            name: 'lineColor',
            type: 'Color',
            description: 'Color of crosshair lines',
            required: false,
            defaultValue: 'Colors.grey',
            example: 'Colors.blue',
          ),
          MultiLinePropertyInfo(
            name: 'lineWidth',
            type: 'double',
            description: 'Width of crosshair lines',
            required: false,
            defaultValue: '1.0',
            example: '2.0',
          ),
          MultiLinePropertyInfo(
            name: 'showLabel',
            type: 'bool',
            description: 'Show value labels on crosshair',
            required: false,
            defaultValue: 'true',
            example: 'false',
          ),
          MultiLinePropertyInfo(
            name: 'tooltipStyle',
            type: 'MultiLineTooltipStyle',
            description: 'Styling for hover tooltips',
            required: false,
            example: 'MultiLineTooltipStyle(...)',
          ),
        ],
      ),
    ];
  }

  // Code Examples
  static List<MultiLineCodeExample> getCodeExamples() {
    return [
      MultiLineCodeExample(
        title: 'Basic Usage',
        description: 'Simple multi-line chart with minimal configuration',
        category: 'basic',
        code: '''final series = [
  ChartSeries(
    name: 'Revenue',
    dataPoints: [
      ChartDataPoint(value: 32, label: 'Jan'),
      ChartDataPoint(value: 48, label: 'Feb'),
      ChartDataPoint(value: 42, label: 'Mar'),
      ChartDataPoint(value: 65, label: 'Apr'),
    ],
    color: Colors.blue,
  ),
  ChartSeries(
    name: 'Profit',
    dataPoints: [
      ChartDataPoint(value: 22, label: 'Jan'),
      ChartDataPoint(value: 35, label: 'Feb'),
      ChartDataPoint(value: 28, label: 'Mar'),
      ChartDataPoint(value: 48, label: 'Apr'),
    ],
    color: Colors.green,
  ),
];

MultiLineChart(
  series: series,
  width: 600,
  height: 400,
  style: MultiLineChartStyle(
    colors: [Colors.blue, Colors.green, Colors.red],
  ),
)''',
      ),

      MultiLineCodeExample(
        title: 'Advanced Styling',
        description: 'Customized appearance with animations and interactions',
        category: 'advanced',
        code: '''MultiLineChart(
  series: chartSeries,
  width: 700,
  height: 400,
  enableZoom: true,
  enablePan: true,
  style: MultiLineChartStyle(
    colors: [Colors.blue, Colors.red, Colors.green],
    backgroundColor: Colors.white,
    gridColor: Colors.grey.withOpacity(0.3),
    defaultLineWidth: 3.0,
    defaultPointSize: 6.0,
    showPoints: true,
    showGrid: true,
    showLegend: true,
    smoothLines: false,
    legendPosition: LegendPosition.bottom,
    forceYAxisFromZero: false,
    labelStyle: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    legendStyle: TextStyle(
      color: Colors.black87,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
    animation: ChartAnimation(
      duration: Duration(milliseconds: 2000),
      curve: Curves.easeOutCubic,
      enabled: true,
    ),
    crosshair: CrosshairConfig(
      enabled: true,
      lineColor: Colors.grey,
      lineWidth: 1.0,
      showLabel: true,
    ),
  ),
)''',
      ),

      MultiLineCodeExample(
        title: 'With Callbacks',
        description: 'Handling user interactions and events',
        category: 'callbacks',
        code: '''MultiLineChart(
  series: businessData,
  width: 600,
  height: 350,
  enableZoom: true,
  enablePan: true,
  onPointTap: (ChartDataPoint point) {
    print('Point tapped: \${point.value} - \${point.label}');
    _showPointDetails(point);
  },
  onChartTap: (Offset position) {
    print('Chart tapped at: \${position.dx}, \${position.dy}');
    _hideTooltips();
  },
  style: MultiLineChartStyle(
    colors: AppColors.chartPalette,
    animation: ChartAnimation(
      duration: Duration(milliseconds: 1500),
      enabled: true,
    ),
  ),
)''',
      ),

      MultiLineCodeExample(
        title: 'Custom Series Configuration',
        description: 'Individual series with custom styling',
        category: 'series',
        code: '''final customSeries = [
  ChartSeries(
    name: 'Smooth Trend',
    dataPoints: trendData,
    color: Colors.blue,
    lineWidth: 4.0,
    pointSize: 8.0,
    smoothLine: true,
    showPoints: true,
  ),
  ChartSeries(
    name: 'Actual Data',
    dataPoints: actualData,
    color: Colors.red,
    lineWidth: 2.0,
    pointSize: 4.0,
    smoothLine: false,
    showPoints: false,
  ),
  ChartSeries(
    name: 'Forecast',
    dataPoints: forecastData,
    color: Colors.green.withOpacity(0.7),
    lineWidth: 3.0,
    pointSize: 6.0,
    smoothLine: true,
    showPoints: true,
  ),
];

MultiLineChart(
  series: customSeries,
  style: MultiLineChartStyle(
    colors: [Colors.blue, Colors.red, Colors.green],
    showLegend: true,
    legendPosition: LegendPosition.right,
  ),
)''',
      ),
    ];
  }

  // Available color palettes for customization
  static List<ColorSetOption> getColorPalette() {
    return [
      ColorSetOption(
        name: 'Default',
        colors: [
          AppColors.primary,
          AppColors.accent,
          AppColors.primaryLight,
          AppColors.accentLight,
        ],
      ),
      ColorSetOption(
        name: 'Business',
        colors: [Colors.blue, Colors.green, Colors.orange, Colors.purple],
      ),
      ColorSetOption(
        name: 'Vibrant',
        colors: [Colors.red, Colors.pink, Colors.purple, Colors.deepPurple],
      ),
      ColorSetOption(
        name: 'Nature',
        colors: [Colors.green, Colors.teal, Colors.lightGreen, Colors.lime],
      ),
      ColorSetOption(
        name: 'Ocean',
        colors: [Colors.blue, Colors.cyan, Colors.lightBlue, Colors.indigo],
      ),
      ColorSetOption(
        name: 'Warm',
        colors: [Colors.orange, Colors.red, Colors.deepOrange, Colors.amber],
      ),
      ColorSetOption(
        name: 'Cool',
        colors: [Colors.blue, Colors.indigo, Colors.purple, Colors.teal],
      ),
      ColorSetOption(
        name: 'Monochrome',
        colors: [
          Colors.black,
          Colors.grey[700]!,
          Colors.grey[500]!,
          Colors.grey[300]!,
        ],
      ),
    ];
  }

  // Generate dynamic live code with current configuration
  static String generateLiveCode(
    MultiLineChartExample example,
    MultiLineChartConfig config,
    bool showRightPanel,
  ) {
    final seriesString = example.series
        .map((series) {
          final dataString = series.dataPoints
              .map(
                (data) =>
                    '    ChartDataPoint(value: ${data.value}, label: \'${data.label}\')',
              )
              .join(',\n    ');

          return '''  ChartSeries(
    name: '${series.name}',
    dataPoints: [
    $dataString,
    ],
    color: ${_getColorName(series.color ?? AppColors.primary)},
    // lineWidth and pointSize will use defaults from style
  )''';
        })
        .join(',\n');

    final colorsString = config.colors
        .map((color) => _getColorName(color))
        .join(', ');
    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);
    final animationCurveName = _getCurveName(config.animationCurve);
    final legendPositionName = _getLegendPositionName(config.legendPosition);

    return '''// ${example.title} Example - Live Customization
// Note: Series will inherit line width and point size from style defaults
final series = [
$seriesString,
];

MultiLineChart(
  series: series,
  width: ${showRightPanel ? 500 : 700},
  height: 350,
  enableZoom: ${config.enableZoom},
  enablePan: ${config.enablePan},
  style: MultiLineChartStyle(
    colors: [$colorsString],
    backgroundColor: $backgroundColorName,
    gridColor: ${_getColorName(config.gridColor)},
    defaultLineWidth: ${config.defaultLineWidth.toStringAsFixed(1)}, // Applied to all series
    defaultPointSize: ${config.defaultPointSize.toStringAsFixed(1)}, // Applied to all series
    showPoints: ${config.showPoints},
    showGrid: ${config.showGrid},
    showLegend: ${config.showLegend},
    smoothLines: ${config.smoothLines}, // Applied to all series
    legendPosition: $legendPositionName,
    forceYAxisFromZero: ${config.forceYAxisFromZero},
    gridLineWidth: ${config.gridLineWidth.toStringAsFixed(1)},
    horizontalGridLines: ${config.horizontalGridLines},
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    legendStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
    animation: ChartAnimation(
      duration: Duration(milliseconds: ${config.animationDuration.inMilliseconds}),
      curve: $animationCurveName,
      enabled: ${config.enableAnimation},
    ),${config.enableCrosshair ? '''
    crosshair: CrosshairConfig(
      enabled: true,
      lineColor: ${_getColorName(config.crosshairColor)},
      lineWidth: ${config.crosshairWidth.toStringAsFixed(1)},
      showLabel: ${config.showCrosshairLabels},
    ),''' : ''}
    tooltipStyle: MultiLineTooltipStyle(
      backgroundColor: ${_getColorName(config.tooltipBackgroundColor)},
      textStyle: TextStyle(
        color: ${_getColorName(config.tooltipTextColor)},
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      padding: ${config.tooltipPadding.toStringAsFixed(1)},
      borderRadius: ${config.tooltipBorderRadius.toStringAsFixed(1)},
    ),
  ),
  onChartTap: (offset) {
    print('Chart tapped at: \${offset.dx.toStringAsFixed(1)}, \${offset.dy.toStringAsFixed(1)}');
  },
)''';
  }

  // Helper methods for code generation
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

  static String _getLegendPositionName(LegendPosition position) {
    switch (position) {
      case LegendPosition.top:
        return 'LegendPosition.top';
      case LegendPosition.bottom:
        return 'LegendPosition.bottom';
      case LegendPosition.left:
        return 'LegendPosition.left';
      case LegendPosition.right:
        return 'LegendPosition.right';
    }
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
    if (color == Colors.black) return 'Colors.black';
    if (color == Colors.white) return 'Colors.white';
    if (color == AppColors.border) return 'AppColors.border';
    return 'Colors.blue';
  }
}
