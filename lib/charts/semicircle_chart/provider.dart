// data/semicircle_data_provider.dart
import 'package:flutter/material.dart';
import '../constants.dart';
import 'models.dart';

/// Provides all semicircle chart examples, property definitions, and code samples
class SemicircleDataProvider {
  // Semicircle Chart Examples for Demo
  static List<SemicircleExample> getSemicircleExamples() {
    return [
      SemicircleExample(
        title: 'Project Completion',
        description: 'Track project progress and completion status',
        percentage: 84.0,
        activeColor: AppColors.primary,
        inactiveColor: AppColors.border,
        category: 'progress',
        metadata: {'project': 'Website Redesign', 'deadline': '2024-12-31'},
      ),

      SemicircleExample(
        title: 'Storage Usage',
        description: 'Monitor disk space and storage consumption',
        percentage: 67.0,
        activeColor: Colors.orange,
        inactiveColor: Colors.grey[300]!,
        category: 'storage',
        metadata: {'total': '1TB', 'used': '670GB'},
      ),

      SemicircleExample(
        title: 'Goal Achievement',
        description: 'Personal or team goal tracking',
        percentage: 92.0,
        activeColor: Colors.green,
        inactiveColor: Colors.grey[200]!,
        category: 'goals',
        metadata: {'goal': 'Annual Sales Target', 'target': '100K'},
      ),

      SemicircleExample(
        title: 'System Performance',
        description: 'Monitor system health and performance metrics',
        percentage: 45.0,
        activeColor: Colors.red,
        inactiveColor: Colors.grey[300]!,
        category: 'performance',
        metadata: {'metric': 'CPU Usage', 'warning': 'High Load'},
      ),

      SemicircleExample(
        title: 'Learning Progress',
        description: 'Educational course or skill development tracking',
        percentage: 73.0,
        activeColor: Colors.purple,
        inactiveColor: Colors.grey[200]!,
        category: 'education',
        metadata: {'course': 'Flutter Development', 'modules': '12'},
      ),

      SemicircleExample(
        title: 'Budget Utilization',
        description: 'Financial budget spending and allocation',
        percentage: 58.0,
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey[300]!,
        category: 'finance',
        metadata: {'budget': '\$50,000', 'spent': '\$29,000'},
      ),
    ];
  }

  // Animation curve options for customization
  static List<SemicircleCurveOption> getAnimationCurves() {
    return [
      SemicircleCurveOption(name: 'Ease In Out', curve: Curves.easeInOut),
      SemicircleCurveOption(name: 'Ease Out Cubic', curve: Curves.easeOutCubic),
      SemicircleCurveOption(name: 'Ease In', curve: Curves.easeIn),
      SemicircleCurveOption(name: 'Ease Out', curve: Curves.easeOut),
      SemicircleCurveOption(name: 'Bounce In', curve: Curves.bounceIn),
      SemicircleCurveOption(name: 'Bounce Out', curve: Curves.bounceOut),
      SemicircleCurveOption(name: 'Elastic In', curve: Curves.elasticIn),
      SemicircleCurveOption(name: 'Elastic Out', curve: Curves.elasticOut),
      SemicircleCurveOption(
        name: 'Fast Linear',
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      SemicircleCurveOption(name: 'Decelerate', curve: Curves.decelerate),
      SemicircleCurveOption(name: 'Linear', curve: Curves.linear),
    ];
  }

  // Percentage formatter options
  static List<FormatterOption> getPercentageFormatters() {
    return [
      FormatterOption(
        name: 'Default (84%)',
        formatter: (percentage) => '${percentage.toStringAsFixed(0)}%',
      ),
      FormatterOption(
        name: 'Decimal (84.5%)',
        formatter: (percentage) => '${percentage.toStringAsFixed(1)}%',
      ),
      FormatterOption(
        name: 'Fraction (84/100)',
        formatter: (percentage) => '${percentage.toStringAsFixed(0)}/100',
      ),
      FormatterOption(
        name: 'Points (840 pts)',
        formatter:
            (percentage) => '${(percentage * 10).toStringAsFixed(0)} pts',
      ),
      FormatterOption(
        name: 'Score (8.4/10)',
        formatter: (percentage) => '${(percentage / 10).toStringAsFixed(1)}/10',
      ),
    ];
  }

  // Property Documentation Sections
  static List<SemicirclePropertySection> getPropertySections() {
    return [
      SemicirclePropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.primary,
        properties: [
          SemicirclePropertyInfo(
            name: 'percentage',
            type: 'double',
            description: 'The percentage value to display (0-100)',
            required: true,
            example: '84.0',
          ),
          SemicirclePropertyInfo(
            name: 'size',
            type: 'double',
            description: 'Size of the chart (width and height)',
            required: false,
            defaultValue: '200.0',
            example: '280.0',
          ),
          SemicirclePropertyInfo(
            name: 'hollowRadius',
            type: 'double',
            description: 'Radius ratio for hollow center (0-1)',
            required: false,
            defaultValue: '0.6',
            example: '0.65',
          ),
          SemicirclePropertyInfo(
            name: 'onAnimationComplete',
            type: 'VoidCallback?',
            description: 'Callback when animation finishes',
            required: false,
            example: '() => print("Animation done!")',
          ),
        ],
      ),

      SemicirclePropertySection(
        title: 'Chart Style',
        description: 'Visual styling and appearance',
        icon: Icons.palette,
        color: AppColors.accent,
        properties: [
          SemicirclePropertyInfo(
            name: 'activeColor',
            type: 'Color',
            description: 'Color for the filled portion',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.green',
          ),
          SemicirclePropertyInfo(
            name: 'inactiveColor',
            type: 'Color',
            description: 'Color for the unfilled portion',
            required: false,
            defaultValue: 'Color(0xFFE0E0E0)',
            example: 'Colors.grey[300]',
          ),
          SemicirclePropertyInfo(
            name: 'textColor',
            type: 'Color?',
            description: 'Override color for text elements',
            required: false,
            example: 'Colors.black87',
          ),
        ],
      ),

      SemicirclePropertySection(
        title: 'Display Options',
        description: 'Control visibility of chart elements',
        icon: Icons.visibility,
        color: AppColors.primaryLight,
        properties: [
          SemicirclePropertyInfo(
            name: 'showPercentageText',
            type: 'bool',
            description: 'Show percentage text in center',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          SemicirclePropertyInfo(
            name: 'showLegend',
            type: 'bool',
            description: 'Show legend above the chart',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
        ],
      ),

      SemicirclePropertySection(
        title: 'Text Styling',
        description: 'Customize text appearance',
        icon: Icons.text_fields,
        color: AppColors.accentLight,
        properties: [
          SemicirclePropertyInfo(
            name: 'percentageStyle',
            type: 'TextStyle?',
            description: 'Style for percentage text',
            required: false,
            example: 'TextStyle(fontSize: 32, fontWeight: FontWeight.bold)',
          ),
          SemicirclePropertyInfo(
            name: 'legendStyle',
            type: 'TextStyle?',
            description: 'Style for legend text',
            required: false,
            example: 'TextStyle(fontSize: 14, color: Colors.grey)',
          ),
        ],
      ),

      SemicirclePropertySection(
        title: 'Custom Formatters',
        description: 'Format display text',
        icon: Icons.format_paint,
        color: Colors.indigo,
        properties: [
          SemicirclePropertyInfo(
            name: 'percentageFormatter',
            type: 'String Function(double)?',
            description: 'Custom percentage text formatter',
            required: false,
            example: '(percentage) => "\${percentage.toInt()}/100"',
          ),
          SemicirclePropertyInfo(
            name: 'legendFormatter',
            type: 'String Function(String, double)?',
            description: 'Custom legend text formatter',
            required: false,
            example: '(type, value) => "\$type: \$value%"',
          ),
        ],
      ),

      SemicirclePropertySection(
        title: 'Animation Config',
        description: 'Animation settings',
        icon: Icons.animation,
        color: Colors.purple,
        properties: [
          SemicirclePropertyInfo(
            name: 'animationDuration',
            type: 'Duration',
            description: 'Length of the chart animation',
            required: false,
            defaultValue: 'Duration(milliseconds: 1500)',
            example: 'Duration(milliseconds: 2000)',
          ),
          SemicirclePropertyInfo(
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
  static List<SemicircleCodeExample> getCodeExamples() {
    return [
      SemicircleCodeExample(
        title: 'Basic Usage',
        description: 'Simple semicircle chart with minimal configuration',
        category: 'basic',
        code: '''MaterialChartHollowSemiCircle(
  percentage: 75,
  size: 200,
  hollowRadius: 0.6,
)''',
      ),

      SemicircleCodeExample(
        title: 'Custom Styling',
        description: 'Chart with custom colors and text styling',
        category: 'styling',
        code: '''MaterialChartHollowSemiCircle(
  percentage: 84,
  size: 280,
  hollowRadius: 0.65,
  style: ChartStyle(
    activeColor: Colors.green,
    inactiveColor: Colors.grey[300]!,
    showPercentageText: true,
    showLegend: true,
    percentageStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: Colors.black87,
    ),
    legendStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    ),
  ),
)''',
      ),

      SemicircleCodeExample(
        title: 'Custom Formatters',
        description: 'Using custom formatters for text display',
        category: 'advanced',
        code: '''MaterialChartHollowSemiCircle(
  percentage: 67.5,
  size: 250,
  style: ChartStyle(
    activeColor: Colors.orange,
    percentageFormatter: (percentage) {
      return '\${percentage.toStringAsFixed(1)}/100';
    },
    legendFormatter: (type, value) {
      if (type == 'Active') {
        return 'Used: \${value.toStringAsFixed(0)}%';
      } else {
        return 'Free: \${value.toStringAsFixed(0)}%';
      }
    },
  ),
)''',
      ),

      SemicircleCodeExample(
        title: 'Animation Configuration',
        description: 'Custom animation settings with callback',
        category: 'animation',
        code: '''MaterialChartHollowSemiCircle(
  percentage: 92,
  size: 300,
  style: ChartStyle(
    activeColor: Colors.purple,
    animationDuration: Duration(milliseconds: 2500),
    animationCurve: Curves.elasticOut,
  ),
  onAnimationComplete: () {
    print('Chart animation completed!');
    // Show success message
    _showCompletionDialog();
  },
)''',
      ),

      SemicircleCodeExample(
        title: 'Progress Tracking',
        description: 'Real-world example for project progress',
        category: 'example',
        code: '''class ProjectProgressChart extends StatelessWidget {
  final double completionPercentage;
  final String projectName;

  const ProjectProgressChart({
    required this.completionPercentage,
    required this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          projectName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        MaterialChartHollowSemiCircle(
          percentage: completionPercentage,
          size: 200,
          hollowRadius: 0.7,
          style: ChartStyle(
            activeColor: completionPercentage >= 80 
                ? Colors.green 
                : completionPercentage >= 50 
                    ? Colors.orange 
                    : Colors.red,
            percentageStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            legendFormatter: (type, value) {
              return type == 'Active' 
                  ? 'Completed: \${value.toInt()}%'
                  : 'Remaining: \${value.toInt()}%';
            },
          ),
        ),
      ],
    );
  }
}''',
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
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.amber,
      Colors.brown,
      Colors.deepOrange,
      Colors.lightGreen,
    ];
  }

  // Background colors for chart container
  static List<Color> getBackgroundColors() {
    return [
      Colors.transparent,
      Colors.white,
      const Color(0xFFF8F9FA),
      const Color(0xFFF1F3F4),
      const Color(0xFFE8F0FE),
      const Color(0xFFFFF3E0),
      const Color(0xFFE8F5E8),
      const Color(0xFFFCE4EC),
      const Color(0xFFE3F2FD),
      const Color(0xFFF3E5F5),
    ];
  }

  // Generate dynamic live code with current configuration
  static String generateLiveCode(
    SemicircleExample example,
    SemicircleConfig config,
    bool showRightPanel,
  ) {
    final activeColorName = _getColorName(config.activeColor);
    final inactiveColorName = _getColorName(config.inactiveColor);
    final animationCurveName = _getCurveName(config.animationCurve);

    return '''// ${example.title} Example - Live Customization
MaterialChartHollowSemiCircle(
  percentage: ${config.percentage.toStringAsFixed(1)},
  size: ${config.size.toStringAsFixed(0)},
  hollowRadius: ${config.hollowRadius.toStringAsFixed(2)},
  style: ChartStyle(
    activeColor: $activeColorName,
    inactiveColor: $inactiveColorName,${config.textColor != null ? '\n    textColor: ${_getColorName(config.textColor!)},\n' : ''}
    animationDuration: Duration(milliseconds: ${config.animationDuration.inMilliseconds}),
    animationCurve: $animationCurveName,
    showPercentageText: ${config.showPercentageText},
    showLegend: ${config.showLegend},${config.percentageStyle != null ? '\n    percentageStyle: TextStyle(\n      fontSize: ${config.size / 8},\n      fontWeight: FontWeight.w900,\n      color: Colors.black87,\n    ),' : ''}${config.legendStyle != null ? '\n    legendStyle: TextStyle(\n      fontSize: 13,\n      fontWeight: FontWeight.w600,\n      color: Colors.grey[600],\n    ),' : ''}${config.percentageFormatter != null ? '\n    percentageFormatter: (percentage) => "\${percentage.toStringAsFixed(0)}%",' : ''}
  ),
  onAnimationComplete: () {
    print('${example.title} animation completed!');
  },
)''';
  }

  // Get curve name for code generation
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
    if (color == AppColors.border) return 'AppColors.border';
    if (color == Colors.green) return 'Colors.green';
    if (color == Colors.red) return 'Colors.red';
    if (color == Colors.blue) return 'Colors.blue';
    if (color == Colors.orange) return 'Colors.orange';
    if (color == Colors.purple) return 'Colors.purple';
    if (color == Colors.teal) return 'Colors.teal';
    if (color == Colors.indigo) return 'Colors.indigo';
    if (color == Colors.pink) return 'Colors.pink';
    if (color == Colors.amber) return 'Colors.amber';
    if (color == Colors.brown) return 'Colors.brown';
    if (color == Colors.white) return 'Colors.white';
    if (color == Colors.black87) return 'Colors.black87';
    if (color == Colors.grey[200]) return 'Colors.grey[200]!';
    if (color == Colors.grey[300]) return 'Colors.grey[300]!';
    if (color == Colors.grey[600]) return 'Colors.grey[600]!';
    return 'Colors.blue';
  }
}
