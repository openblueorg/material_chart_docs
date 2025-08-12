// data/pie_chart_data_provider.dart
import 'package:flutter/material.dart';
// import 'package:chat_test_01/material_charts/material_charts.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';

/// Provides all pie chart examples, property definitions, and code samples
class PieChartDataProvider {
  // Chart Examples for Demo
  static List<PieChartExample> getChartExamples() {
    return [
      PieChartExample(
        title: 'Market Share Analysis',
        description: 'Company market share breakdown by platform',
        primaryColor: AppColors.primary,
        category: 'business',
        data: [
          PieChartData(
            value: 32,
            label: 'Desktop',
            color: AppColors.chartPalette[0],
          ),
          PieChartData(
            value: 28,
            label: 'Mobile',
            color: AppColors.chartPalette[1],
          ),
          PieChartData(
            value: 22,
            label: 'Tablet',
            color: AppColors.chartPalette[2],
          ),
          PieChartData(
            value: 12,
            label: 'Smart TV',
            color: AppColors.chartPalette[3],
          ),
          PieChartData(
            value: 6,
            label: 'Other',
            color: AppColors.chartPalette[4],
          ),
        ],
        metadata: {'unit': '%', 'trend': 'stable'},
      ),

      PieChartExample(
        title: 'Budget Distribution',
        description: 'Monthly budget allocation by category',
        primaryColor: AppColors.accent,
        category: 'finance',
        data: [
          PieChartData(value: 35, label: 'Housing', color: Colors.indigo),
          PieChartData(value: 25, label: 'Food', color: Colors.green),
          PieChartData(
            value: 15,
            label: 'Transportation',
            color: Colors.orange,
          ),
          PieChartData(value: 10, label: 'Entertainment', color: Colors.purple),
          PieChartData(value: 10, label: 'Healthcare', color: Colors.red),
          PieChartData(value: 5, label: 'Savings', color: Colors.teal),
        ],
        metadata: {'unit': '%', 'period': 'monthly'},
      ),

      PieChartExample(
        title: 'Survey Results',
        description: 'Customer satisfaction survey responses',
        primaryColor: AppColors.primaryLight,
        category: 'analytics',
        data: [
          PieChartData(
            value: 45,
            label: 'Very Satisfied',
            color: Colors.green[600]!,
          ),
          PieChartData(value: 30, label: 'Satisfied', color: Colors.lightGreen),
          PieChartData(value: 15, label: 'Neutral', color: Colors.amber),
          PieChartData(value: 7, label: 'Unsatisfied', color: Colors.orange),
          PieChartData(value: 3, label: 'Very Unsatisfied', color: Colors.red),
        ],
        metadata: {'unit': '%', 'responses': 1500},
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

  // Color palette options for customization
  static List<ColorPalette> getColorPalettes() {
    return [
      ColorPalette(
        name: 'Default',
        colors: [
          Colors.blue,
          Colors.red,
          Colors.green,
          Colors.orange,
          Colors.purple,
          Colors.teal,
        ],
      ),
      ColorPalette(
        name: 'Business',
        colors: [
          AppColors.primary,
          AppColors.accent,
          AppColors.primaryLight,
          AppColors.accentLight,
          Colors.indigo,
          Colors.cyan,
        ],
      ),
      ColorPalette(
        name: 'Warm',
        colors: [
          Colors.red[400]!,
          Colors.orange[400]!,
          Colors.amber[400]!,
          Colors.pink[400]!,
          Colors.deepOrange[400]!,
          Colors.yellow[600]!,
        ],
      ),
      ColorPalette(
        name: 'Cool',
        colors: [
          Colors.blue[400]!,
          Colors.cyan[400]!,
          Colors.teal[400]!,
          Colors.indigo[400]!,
          Colors.lightBlue[400]!,
          Colors.blueGrey[400]!,
        ],
      ),
      ColorPalette(
        name: 'Nature',
        colors: [
          Colors.green[400]!,
          Colors.lightGreen[400]!,
          Colors.lime[400]!,
          Colors.brown[400]!,
          Colors.green[600]!,
          Colors.teal[300]!,
        ],
      ),
      ColorPalette(
        name: 'Vibrant',
        colors: [
          Colors.purple[400]!,
          Colors.pink[400]!,
          Colors.deepPurple[400]!,
          Colors.indigo[400]!,
          Colors.blue[400]!,
          Colors.cyan[400]!,
        ],
      ),
    ];
  }

  // Connector line color options
  static List<Color> getConnectorLineColors() {
    return [
      Colors.black54,
      Colors.grey,
      Colors.black87,
      Colors.blueGrey,
      AppColors.textSecondary,
      AppColors.border,
    ];
  }

  // Property Documentation Sections
  static List<PropertySection> getPropertySections() {
    return [
      PropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.accent,
        properties: [
          PropertyInfo(
            name: 'data',
            type: 'List<PieChartData>',
            description: 'Chart data points with values, labels, and colors',
            required: true,
            example: '[PieChartData(value: 30, label: "Category A")]',
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
            name: 'minSizePercent',
            type: 'double',
            description: 'Minimum size percentage for small slices',
            required: false,
            defaultValue: '0.0',
            example: '5.0',
          ),
          PropertyInfo(
            name: 'chartRadius',
            type: 'double',
            description: 'Fixed radius for the pie chart',
            required: false,
            defaultValue: 'double.maxFinite',
            example: '150.0',
          ),
          PropertyInfo(
            name: 'interactive',
            type: 'bool',
            description: 'Enable hover effects and interactions',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'showLabelOnlyOnHover',
            type: 'bool',
            description: 'Show labels only when hovering over slices',
            required: false,
            defaultValue: 'false',
            example: 'false',
          ),
          PropertyInfo(
            name: 'padding',
            type: 'EdgeInsets',
            description: 'Space around the chart content',
            required: false,
            defaultValue: 'EdgeInsets.all(24)',
            example: 'EdgeInsets.all(20)',
          ),
        ],
      ),

      PropertySection(
        title: 'Style Properties',
        description: 'Visual styling options',
        icon: Icons.palette,
        color: AppColors.primary,
        properties: [
          PropertyInfo(
            name: 'defaultColors',
            type: 'List<Color>',
            description: 'Default color palette for slices',
            required: false,
            defaultValue: '[Colors.blue, Colors.red, ...]',
            example: '[Colors.blue, Colors.green]',
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
            name: 'startAngle',
            type: 'double',
            description: 'Starting angle for the first slice in degrees',
            required: false,
            defaultValue: '-90',
            example: '0',
          ),
          PropertyInfo(
            name: 'holeRadius',
            type: 'double',
            description: 'Radius of center hole for doughnut charts (0-1)',
            required: false,
            defaultValue: '0',
            example: '0.4',
          ),
          PropertyInfo(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Styling for slice labels',
            required: false,
            example: 'TextStyle(fontSize: 12)',
          ),
          PropertyInfo(
            name: 'valueStyle',
            type: 'TextStyle?',
            description: 'Styling for slice values/percentages',
            required: false,
            example: 'TextStyle(fontSize: 10)',
          ),
        ],
      ),

      PropertySection(
        title: 'Labels & Legend',
        description: 'Label and legend configuration',
        icon: Icons.label,
        color: AppColors.primaryLight,
        properties: [
          PropertyInfo(
            name: 'showLabels',
            type: 'bool',
            description: 'Display labels on pie slices',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'showValues',
            type: 'bool',
            description: 'Display percentage values on slices',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'labelPosition',
            type: 'LabelPosition',
            description: 'Position labels inside or outside slices',
            required: false,
            defaultValue: 'LabelPosition.outside',
            example: 'LabelPosition.inside',
          ),
          PropertyInfo(
            name: 'labelOffset',
            type: 'double',
            description: 'Distance of labels from slice edge',
            required: false,
            defaultValue: '20',
            example: '30',
          ),
          PropertyInfo(
            name: 'showLegend',
            type: 'bool',
            description: 'Display chart legend',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'legendPosition',
            type: 'PieChartLegendPosition',
            description: 'Position of the legend',
            required: false,
            defaultValue: 'PieChartLegendPosition.right',
            example: 'PieChartLegendPosition.bottom',
          ),
          PropertyInfo(
            name: 'showConnectorLines',
            type: 'bool',
            description: 'Show lines connecting labels to slices',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          PropertyInfo(
            name: 'connectorLineColor',
            type: 'Color',
            description: 'Color of connector lines',
            required: false,
            defaultValue: 'Colors.black54',
            example: 'Colors.grey',
          ),
          PropertyInfo(
            name: 'connectorLineStrokeWidth',
            type: 'double',
            description: 'Thickness of connector lines',
            required: false,
            defaultValue: '1.0',
            example: '2.0',
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

      PropertySection(
        title: 'Data Model',
        description: 'Data structure definition',
        icon: Icons.data_object,
        color: AppColors.accent,
        properties: [
          PropertyInfo(
            name: 'value',
            type: 'double',
            description: 'Numeric value for slice size',
            required: true,
            example: '42.5',
          ),
          PropertyInfo(
            name: 'label',
            type: 'String',
            description: 'Text label for the slice',
            required: true,
            example: '"Category A"',
          ),
          PropertyInfo(
            name: 'color',
            type: 'Color?',
            description: 'Optional custom color for the slice',
            required: false,
            example: 'Colors.blue',
          ),
          PropertyInfo(
            name: 'onTap',
            type: 'VoidCallback?',
            description: 'Optional tap callback for the slice',
            required: false,
            example: '() => print("Tapped!")',
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
        description: 'Simple pie chart with minimal configuration',
        category: 'basic',
        code: '''MaterialPieChart(
  data: [
    PieChartData(value: 30, label: 'Desktop'),
    PieChartData(value: 25, label: 'Mobile'),
    PieChartData(value: 20, label: 'Tablet'),
    PieChartData(value: 15, label: 'Smart TV'),
    PieChartData(value: 10, label: 'Other'),
  ],
  width: 400,
  height: 300,
)''',
      ),

      CodeExample(
        title: 'Doughnut Chart',
        description: 'Pie chart with center hole (doughnut style)',
        category: 'advanced',
        code: '''MaterialPieChart(
  data: chartData,
  width: 500,
  height: 400,
  style: PieChartStyle(
    holeRadius: 0.4, // Creates center hole
    startAngle: -90,
    backgroundColor: Colors.white,
    labelPosition: LabelPosition.outside,
    showConnectorLines: true,
    connectorLineColor: Colors.grey,
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  interactive: true,
)''',
      ),

      CodeExample(
        title: 'Custom Styling',
        description: 'Fully customized appearance with callbacks',
        category: 'advanced',
        code: '''MaterialPieChart(
  data: [
    PieChartData(
      value: 35,
      label: 'Category A',
      color: Colors.blue,
      onTap: () => print('Tapped Category A'),
    ),
    PieChartData(
      value: 25,
      label: 'Category B',
      color: Colors.red,
      onTap: () => print('Tapped Category B'),
    ),
    // More data...
  ],
  width: 600,
  height: 450,
  minSizePercent: 5.0, // Minimum slice size
  style: PieChartStyle(
    backgroundColor: Colors.grey[50]!,
    labelStyle: TextStyle(
      color: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    valueStyle: TextStyle(
      color: Colors.black54,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    showLegend: true,
    legendPosition: PieChartLegendPosition.bottom,
    chartAlignment: ChartAlignment.centerLeft,
  ),
  showLabelOnlyOnHover: true,
  padding: EdgeInsets.all(20),
  onAnimationComplete: () {
    print('Pie chart animation completed!');
  },
)''',
      ),
    ];
  }

  // Generate dynamic live code with all settings
  static String generateLiveCode(
    PieChartExample example,
    PieChartConfig config,
    bool showRightPanel,
  ) {
    final dataString = example.data
        .map(
          (data) =>
              '    PieChartData(\n'
              '      value: ${data.value},\n'
              '      label: \'${data.label}\',\n'
              '      color: ${_getColorName(data.color!)},\n'
              '    )',
        )
        .join(',\n');

    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);

    final animationCurveName = _getCurveName(config.animationCurve);
    final connectorColorName = _getColorName(config.connectorLineColor);

    return '''// ${example.title} Example - Live Customization
final data = [
$dataString,
];

MaterialPieChart(
  data: data,
  width: ${showRightPanel ? 500 : 700},
  height: 350,
  minSizePercent: ${config.minSizePercent.toStringAsFixed(1)},
  chartRadius: ${config.chartRadius == double.maxFinite ? 'double.maxFinite' : config.chartRadius.toStringAsFixed(0)},
  style: PieChartStyle(
    defaultColors: ${_getColorPaletteName(config.colorPalette)},
    backgroundColor: $backgroundColorName,
    startAngle: ${config.startAngle.toStringAsFixed(1)},
    holeRadius: ${config.holeRadius.toStringAsFixed(2)},
    animationDuration: Duration(milliseconds: ${config.animationDuration.inMilliseconds}),
    animationCurve: $animationCurveName,
    showLabels: ${config.showLabels},
    showValues: ${config.showValues},
    labelOffset: ${config.labelOffset.toStringAsFixed(1)},
    showLegend: ${config.showLegend},
    legendPosition: ${_getLegendPositionName(config.legendPosition)},
    labelPosition: ${_getLabelPositionName(config.labelPosition)},
    showConnectorLines: ${config.showConnectorLines},
    connectorLineColor: $connectorColorName,
    connectorLineStrokeWidth: ${config.connectorLineStrokeWidth.toStringAsFixed(1)},
    chartAlignment: ${_getChartAlignmentName(config.chartAlignment)},
    labelStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: ${config.labelFontSize.toStringAsFixed(1)},
      fontWeight: FontWeight.w600,
    ),
    valueStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: ${config.valueFontSize.toStringAsFixed(1)},
      fontWeight: FontWeight.w700,
    ),
  ),
  interactive: ${config.interactive},
  showLabelOnlyOnHover: ${config.showLabelOnlyOnHover},
  padding: EdgeInsets.all(${config.padding.toStringAsFixed(1)}),
  onAnimationComplete: () {
    print('${example.title} animation completed!');
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

  static String _getColorName(Color color) {
    if (color == AppColors.primary) return 'AppColors.primary';
    if (color == AppColors.accent) return 'AppColors.accent';
    if (color == AppColors.primaryLight) return 'AppColors.primaryLight';
    if (color == AppColors.accentLight) return 'AppColors.accentLight';
    if (color == Colors.blue) return 'Colors.blue';
    if (color == Colors.red) return 'Colors.red';
    if (color == Colors.green) return 'Colors.green';
    if (color == Colors.orange) return 'Colors.orange';
    if (color == Colors.purple) return 'Colors.purple';
    if (color == Colors.teal) return 'Colors.teal';
    if (color == Colors.indigo) return 'Colors.indigo';
    if (color == Colors.pink) return 'Colors.pink';
    if (color == Colors.cyan) return 'Colors.cyan';
    if (color == Colors.amber) return 'Colors.amber';
    if (color == Colors.lightGreen) return 'Colors.lightGreen';
    if (color == Colors.deepOrange) return 'Colors.deepOrange';
    if (color == Colors.black54) return 'Colors.black54';
    if (color == Colors.grey) return 'Colors.grey';
    if (color == Colors.black87) return 'Colors.black87';
    if (color == Colors.blueGrey) return 'Colors.blueGrey';
    if (color == Colors.green[600]) return 'Colors.green[600]!';
    if (color == Colors.yellow[600]) return 'Colors.yellow[600]!';
    if (color == Colors.red[400]) return 'Colors.red[400]!';
    if (color == Colors.orange[400]) return 'Colors.orange[400]!';
    if (color == Colors.amber[400]) return 'Colors.amber[400]!';
    if (color == Colors.pink[400]) return 'Colors.pink[400]!';
    if (color == Colors.deepOrange[400]) return 'Colors.deepOrange[400]!';
    if (color == Colors.blue[400]) return 'Colors.blue[400]!';
    if (color == Colors.cyan[400]) return 'Colors.cyan[400]!';
    if (color == Colors.teal[400]) return 'Colors.teal[400]!';
    if (color == Colors.indigo[400]) return 'Colors.indigo[400]!';
    if (color == Colors.lightBlue[400]) return 'Colors.lightBlue[400]!';
    if (color == Colors.blueGrey[400]) return 'Colors.blueGrey[400]!';
    if (color == Colors.green[400]) return 'Colors.green[400]!';
    if (color == Colors.lightGreen[400]) return 'Colors.lightGreen[400]!';
    if (color == Colors.lime[400]) return 'Colors.lime[400]!';
    if (color == Colors.brown[400]) return 'Colors.brown[400]!';
    if (color == Colors.teal[300]) return 'Colors.teal[300]!';
    if (color == Colors.purple[400]) return 'Colors.purple[400]!';
    if (color == Colors.deepPurple[400]) return 'Colors.deepPurple[400]!';
    return 'Colors.blue';
  }

  static String _getColorPaletteName(List<Color> colors) {
    if (colors.length == 6 &&
        colors[0] == Colors.blue &&
        colors[1] == Colors.red) {
      return '[Colors.blue, Colors.red, Colors.green, Colors.orange, Colors.purple, Colors.teal]';
    }
    return colors.map((c) => _getColorName(c)).toList().toString();
  }

  static String _getLegendPositionName(PieChartLegendPosition position) {
    switch (position) {
      case PieChartLegendPosition.right:
        return 'PieChartLegendPosition.right';
      case PieChartLegendPosition.bottom:
        return 'PieChartLegendPosition.bottom';
    }
  }

  static String _getLabelPositionName(LabelPosition position) {
    switch (position) {
      case LabelPosition.inside:
        return 'LabelPosition.inside';
      case LabelPosition.outside:
        return 'LabelPosition.outside';
    }
  }

  static String _getChartAlignmentName(ChartAlignment alignment) {
    switch (alignment) {
      case ChartAlignment.center:
        return 'ChartAlignment.center';
      case ChartAlignment.topLeft:
        return 'ChartAlignment.topLeft';
      case ChartAlignment.topCenter:
        return 'ChartAlignment.topCenter';
      case ChartAlignment.topRight:
        return 'ChartAlignment.topRight';
      case ChartAlignment.centerLeft:
        return 'ChartAlignment.centerLeft';
      case ChartAlignment.centerRight:
        return 'ChartAlignment.centerRight';
      case ChartAlignment.bottomLeft:
        return 'ChartAlignment.bottomLeft';
      case ChartAlignment.bottomCenter:
        return 'ChartAlignment.bottomCenter';
      case ChartAlignment.bottomRight:
        return 'ChartAlignment.bottomRight';
    }
  }
}
