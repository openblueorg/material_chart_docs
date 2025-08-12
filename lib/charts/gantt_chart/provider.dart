// data/gantt_data_provider.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:chat_test_01/material_charts/material_charts.dart';
import '../../material_charts/material_charts.dart';

import '../constants.dart';
import 'models.dart';

/// Provides all Gantt chart examples, property definitions, and code samples
class GanttDataProvider {
  // Gantt Chart Examples for Demo
  static List<GanttExample> getGanttExamples() {
    return [
      GanttExample(
        title: 'Software Development',
        description: 'Complete software development lifecycle phases',
        primaryColor: AppColors.primary,
        category: 'development',
        data: [
          GanttData(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 32)),
            label: 'Project Planning',
            description: 'Requirements analysis and project setup',
            color: AppColors.chartPalette[0],
            icon: Icons.settings_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 24)),
            endDate: DateTime.now().add(const Duration(days: 68)),
            label: 'Development Sprint',
            description: 'Core development and implementation phase',
            color: AppColors.chartPalette[1],
            icon: Icons.code_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 54)),
            endDate: DateTime.now().add(const Duration(days: 82)),
            label: 'Quality Assurance',
            description: 'Testing and quality assurance phase',
            color: AppColors.chartPalette[2],
            icon: Icons.verified_outlined,
          ),
        ],
        metadata: {'team': 'Engineering', 'budget': '\$250K'},
      ),

      GanttExample(
        title: 'Event Planning',
        description: 'Conference organization timeline',
        primaryColor: Colors.purple,
        category: 'events',
        data: [
          GanttData(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 14)),
            label: 'Venue Booking',
            description: 'Secure venue and catering arrangements',
            color: Colors.purple[400],
            icon: Icons.location_on_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 10)),
            endDate: DateTime.now().add(const Duration(days: 35)),
            label: 'Speaker Outreach',
            description: 'Contact and confirm keynote speakers',
            color: Colors.indigo[400],
            icon: Icons.person_outline,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 28)),
            endDate: DateTime.now().add(const Duration(days: 42)),
            label: 'Marketing Campaign',
            description: 'Launch marketing and registration',
            color: Colors.orange[400],
            icon: Icons.campaign_outlined,
          ),
        ],
        metadata: {'attendees': '500+', 'duration': '3 days'},
      ),

      GanttExample(
        title: 'Product Launch',
        description: 'New product launch campaign timeline',
        primaryColor: Colors.green,
        category: 'marketing',
        data: [
          GanttData(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 21)),
            label: 'Market Research',
            description: 'Customer surveys and competitive analysis',
            color: Colors.blue[400],
            icon: Icons.analytics_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 15)),
            endDate: DateTime.now().add(const Duration(days: 45)),
            label: 'Product Development',
            description: 'Final product refinements and testing',
            color: Colors.green[400],
            icon: Icons.build_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 35)),
            endDate: DateTime.now().add(const Duration(days: 55)),
            label: 'Marketing Materials',
            description: 'Create promotional content and campaigns',
            color: Colors.orange[400],
            icon: Icons.design_services_outlined,
          ),
        ],
        metadata: {'budget': '\$100K', 'target': 'Q1 Launch'},
      ),

      GanttExample(
        title: 'Construction Project',
        description: 'Building construction phases',
        primaryColor: Colors.brown,
        category: 'construction',
        data: [
          GanttData(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 30)),
            label: 'Foundation',
            description: 'Site preparation and foundation work',
            color: Colors.brown[400],
            icon: Icons.foundation_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 25)),
            endDate: DateTime.now().add(const Duration(days: 75)),
            label: 'Structure',
            description: 'Main building structure construction',
            color: Colors.grey[600],
            icon: Icons.apartment_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 65)),
            endDate: DateTime.now().add(const Duration(days: 95)),
            label: 'Interior Work',
            description: 'Electrical, plumbing, and interior finishing',
            color: Colors.amber[600],
            icon: Icons.electrical_services_outlined,
          ),
        ],
        metadata: {'contractor': 'BuildCorp', 'area': '2500 sq ft'},
      ),

      GanttExample(
        title: 'Research Study',
        description: 'Academic research project timeline',
        primaryColor: Colors.teal,
        category: 'research',
        data: [
          GanttData(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 28)),
            label: 'Literature Review',
            description: 'Comprehensive review of existing research',
            color: Colors.teal[400],
            icon: Icons.library_books_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 20)),
            endDate: DateTime.now().add(const Duration(days: 60)),
            label: 'Data Collection',
            description: 'Surveys, interviews, and data gathering',
            color: Colors.blue[400],
            icon: Icons.data_usage_outlined,
          ),
          GanttData(
            startDate: DateTime.now().add(const Duration(days: 55)),
            endDate: DateTime.now().add(const Duration(days: 80)),
            label: 'Data Analysis',
            description: 'Statistical analysis and interpretation',
            color: Colors.purple[400],
            icon: Icons.analytics_outlined,
          ),
        ],
        metadata: {'participants': '200', 'duration': '6 months'},
      ),
    ];
  }

  // Animation curve options for customization
  static List<GanttCurveOption> getAnimationCurves() {
    return [
      GanttCurveOption(name: 'Ease In Out', curve: Curves.easeInOut),
      GanttCurveOption(name: 'Ease Out Cubic', curve: Curves.easeOutCubic),
      GanttCurveOption(name: 'Ease In', curve: Curves.easeIn),
      GanttCurveOption(name: 'Ease Out', curve: Curves.easeOut),
      GanttCurveOption(name: 'Bounce In', curve: Curves.bounceIn),
      GanttCurveOption(name: 'Bounce Out', curve: Curves.bounceOut),
      GanttCurveOption(name: 'Elastic In', curve: Curves.elasticIn),
      GanttCurveOption(name: 'Elastic Out', curve: Curves.elasticOut),
      GanttCurveOption(
        name: 'Fast Linear',
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      GanttCurveOption(name: 'Decelerate', curve: Curves.decelerate),
      GanttCurveOption(name: 'Linear', curve: Curves.linear),
    ];
  }

  // Date format options for timeline display
  static List<DateFormatOption> getDateFormatOptions() {
    final now = DateTime.now();
    return [
      DateFormatOption(
        name: 'Short Date (MMM dd)',
        format: DateFormat('MMM dd'),
        example: DateFormat('MMM dd').format(now),
      ),
      DateFormatOption(
        name: 'Month Year (MMM yyyy)',
        format: DateFormat('MMM yyyy'),
        example: DateFormat('MMM yyyy').format(now),
      ),
      DateFormatOption(
        name: 'Full Date (MMM dd, yyyy)',
        format: DateFormat('MMM dd, yyyy'),
        example: DateFormat('MMM dd, yyyy').format(now),
      ),
      DateFormatOption(
        name: 'Numeric (MM/dd)',
        format: DateFormat('MM/dd'),
        example: DateFormat('MM/dd').format(now),
      ),
      DateFormatOption(
        name: 'Day Month (dd MMM)',
        format: DateFormat('dd MMM'),
        example: DateFormat('dd MMM').format(now),
      ),
      DateFormatOption(
        name: 'Week Year (w yyyy)',
        format: DateFormat('w yyyy'),
        example:
            'W${((now.difference(DateTime(now.year, 1, 1)).inDays) / 7).ceil()} ${now.year}',
      ),
    ];
  }

  // Property Documentation Sections
  static List<GanttPropertySection> getPropertySections() {
    return [
      GanttPropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.primary,
        properties: [
          GanttPropertyInfo(
            name: 'data',
            type: 'List<GanttData>',
            description: 'List of tasks with start/end dates and details',
            required: true,
            example:
                '[GanttData(startDate: start, endDate: end, label: "Task")]',
          ),
          GanttPropertyInfo(
            name: 'width',
            type: 'double',
            description: 'Chart width in pixels',
            required: true,
            example: '800',
          ),
          GanttPropertyInfo(
            name: 'height',
            type: 'double',
            description: 'Chart height in pixels',
            required: true,
            example: '420',
          ),
          GanttPropertyInfo(
            name: 'interactive',
            type: 'bool',
            description: 'Enable hover and tap interactions',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          GanttPropertyInfo(
            name: 'onPointTap',
            type: 'Function(GanttData)?',
            description: 'Callback when a task is tapped',
            required: false,
            example: '(data) => showDetails(data)',
          ),
          GanttPropertyInfo(
            name: 'onPointHover',
            type: 'Function(GanttData)?',
            description: 'Callback when a task is hovered',
            required: false,
            example: '(data) => updateTooltip(data)',
          ),
        ],
      ),

      GanttPropertySection(
        title: 'Visual Styling',
        description: 'Colors and visual appearance',
        icon: Icons.palette,
        color: AppColors.accent,
        properties: [
          GanttPropertyInfo(
            name: 'lineColor',
            type: 'Color',
            description: 'Color of task timeline bars',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.green',
          ),
          GanttPropertyInfo(
            name: 'pointColor',
            type: 'Color',
            description: 'Color of task milestone points',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.red',
          ),
          GanttPropertyInfo(
            name: 'connectionLineColor',
            type: 'Color',
            description: 'Color of lines connecting tasks',
            required: false,
            defaultValue: 'Colors.grey',
            example: 'Colors.blue[300]',
          ),
          GanttPropertyInfo(
            name: 'backgroundColor',
            type: 'Color',
            description: 'Background color of the chart',
            required: false,
            defaultValue: 'Colors.white',
            example: 'Colors.grey[50]',
          ),
        ],
      ),

      GanttPropertySection(
        title: 'Layout Configuration',
        description: 'Spacing and positioning',
        icon: Icons.space_bar,
        color: AppColors.primaryLight,
        properties: [
          GanttPropertyInfo(
            name: 'verticalSpacing',
            type: 'double',
            description: 'Space between task rows',
            required: false,
            defaultValue: '120.0',
            example: '90.0',
          ),
          GanttPropertyInfo(
            name: 'horizontalPadding',
            type: 'double',
            description: 'Padding on left and right sides',
            required: false,
            defaultValue: '32.0',
            example: '40.0',
          ),
          GanttPropertyInfo(
            name: 'labelOffset',
            type: 'double',
            description: 'Distance of labels from timeline',
            required: false,
            defaultValue: '25.0',
            example: '30.0',
          ),
          GanttPropertyInfo(
            name: 'timelineYOffset',
            type: 'double',
            description: 'Vertical offset of timeline from top',
            required: false,
            defaultValue: '60.0',
            example: '80.0',
          ),
        ],
      ),

      GanttPropertySection(
        title: 'Line Properties',
        description: 'Line thickness and styling',
        icon: Icons.line_weight,
        color: AppColors.accentLight,
        properties: [
          GanttPropertyInfo(
            name: 'lineWidth',
            type: 'double',
            description: 'Thickness of task timeline bars',
            required: false,
            defaultValue: '2.0',
            example: '6.0',
          ),
          GanttPropertyInfo(
            name: 'pointRadius',
            type: 'double',
            description: 'Size of milestone points',
            required: false,
            defaultValue: '4.0',
            example: '8.0',
          ),
          GanttPropertyInfo(
            name: 'connectionLineWidth',
            type: 'double',
            description: 'Thickness of connection lines',
            required: false,
            defaultValue: '1.0',
            example: '2.0',
          ),
        ],
      ),

      GanttPropertySection(
        title: 'Display Options',
        description: 'Visibility and behavior settings',
        icon: Icons.visibility,
        color: Colors.indigo,
        properties: [
          GanttPropertyInfo(
            name: 'showConnections',
            type: 'bool',
            description: 'Show curved lines connecting tasks',
            required: false,
            defaultValue: 'true',
            example: 'false',
          ),
          GanttPropertyInfo(
            name: 'dateFormat',
            type: 'DateFormat?',
            description: 'Custom format for timeline dates',
            required: false,
            example: 'DateFormat("MMM dd")',
          ),
        ],
      ),

      GanttPropertySection(
        title: 'Text Styling',
        description: 'Typography and text appearance',
        icon: Icons.text_fields,
        color: Colors.purple,
        properties: [
          GanttPropertyInfo(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Style for task labels',
            required: false,
            example: 'TextStyle(fontSize: 14, fontWeight: FontWeight.bold)',
          ),
          GanttPropertyInfo(
            name: 'dateStyle',
            type: 'TextStyle?',
            description: 'Style for timeline dates',
            required: false,
            example: 'TextStyle(fontSize: 11, color: Colors.grey)',
          ),
          GanttPropertyInfo(
            name: 'descriptionStyle',
            type: 'TextStyle?',
            description: 'Style for task descriptions',
            required: false,
            example: 'TextStyle(fontSize: 12, color: Colors.grey[600])',
          ),
        ],
      ),

      GanttPropertySection(
        title: 'Animation Config',
        description: 'Animation settings',
        icon: Icons.animation,
        color: Colors.teal,
        properties: [
          GanttPropertyInfo(
            name: 'animationDuration',
            type: 'Duration',
            description: 'Length of the chart animation',
            required: false,
            defaultValue: 'Duration(milliseconds: 1500)',
            example: 'Duration(milliseconds: 2000)',
          ),
          GanttPropertyInfo(
            name: 'animationCurve',
            type: 'Curve',
            description: 'Animation easing curve style',
            required: false,
            defaultValue: 'Curves.easeInOut',
            example: 'Curves.easeOutCubic',
          ),
          GanttPropertyInfo(
            name: 'onAnimationComplete',
            type: 'VoidCallback?',
            description: 'Callback when animation finishes',
            required: false,
            example: '() => print("Animation done!")',
          ),
        ],
      ),

      GanttPropertySection(
        title: 'Data Model',
        description: 'GanttData structure',
        icon: Icons.data_object,
        color: Colors.orange,
        properties: [
          GanttPropertyInfo(
            name: 'startDate',
            type: 'DateTime',
            description: 'Task start date and time',
            required: true,
            example: 'DateTime.now()',
          ),
          GanttPropertyInfo(
            name: 'endDate',
            type: 'DateTime',
            description: 'Task end date and time',
            required: true,
            example: 'DateTime.now().add(Duration(days: 30))',
          ),
          GanttPropertyInfo(
            name: 'label',
            type: 'String',
            description: 'Task name or title',
            required: true,
            example: '"Development Phase"',
          ),
          GanttPropertyInfo(
            name: 'description',
            type: 'String?',
            description: 'Optional detailed description',
            required: false,
            example: '"Core feature implementation"',
          ),
          GanttPropertyInfo(
            name: 'color',
            type: 'Color?',
            description: 'Custom color for this task',
            required: false,
            example: 'Colors.green',
          ),
          GanttPropertyInfo(
            name: 'icon',
            type: 'IconData?',
            description: 'Icon to represent the task',
            required: false,
            example: 'Icons.code_outlined',
          ),
        ],
      ),
    ];
  }

  // Code Examples
  static List<GanttCodeExample> getCodeExamples() {
    return [
      GanttCodeExample(
        title: 'Basic Usage',
        description: 'Simple Gantt chart with minimal configuration',
        category: 'basic',
        code: '''MaterialGanttChart(
  data: [
    GanttData(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 30)),
      label: 'Task 1',
    ),
    GanttData(
      startDate: DateTime.now().add(Duration(days: 20)),
      endDate: DateTime.now().add(Duration(days: 60)),
      label: 'Task 2',
    ),
  ],
  width: 600,
  height: 300,
)''',
      ),

      GanttCodeExample(
        title: 'Advanced Styling',
        description: 'Customized appearance with colors and typography',
        category: 'styling',
        code: '''MaterialGanttChart(
  data: projectTasks,
  width: 800,
  height: 450,
  style: GanttChartStyle(
    lineColor: Colors.blue,
    pointColor: Colors.red,
    connectionLineColor: Colors.grey[400]!,
    backgroundColor: Colors.grey[50]!,
    lineWidth: 8,
    pointRadius: 10,
    connectionLineWidth: 3,
    verticalSpacing: 120,
    horizontalPadding: 40,
    showConnections: true,
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    dateStyle: TextStyle(
      fontSize: 12,
      color: Colors.grey[600],
    ),
    dateFormat: DateFormat('MMM dd, yyyy'),
  ),
)''',
      ),

      GanttCodeExample(
        title: 'Interactive Features',
        description: 'Handling user interactions and callbacks',
        category: 'interactive',
        code: '''MaterialGanttChart(
  data: milestones,
  width: 700,
  height: 400,
  interactive: true,
  onPointTap: (GanttData task) {
    showDialog(
      context: context,
      builder: (_) => TaskDetailsDialog(task: task),
    );
  },
  onPointHover: (GanttData task) {
    setState(() {
      hoveredTask = task;
    });
  },
  onAnimationComplete: () {
    print('Gantt chart animation completed!');
    _showTaskSummary();
  },
)''',
      ),

      GanttCodeExample(
        title: 'Complex Project Timeline',
        description: 'Real-world project management example',
        category: 'advanced',
        code: '''final projectPhases = [
  GanttData(
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 21)),
    label: 'Planning Phase',
    description: 'Project planning and resource allocation',
    color: Colors.blue[400],
    icon: Icons.planning_outlined,
  ),
  GanttData(
    startDate: DateTime.now().add(Duration(days: 14)),
    endDate: DateTime.now().add(Duration(days: 70)),
    label: 'Development',
    description: 'Core development and implementation',
    color: Colors.green[400],
    icon: Icons.code_outlined,
  ),
  GanttData(
    startDate: DateTime.now().add(Duration(days: 60)),
    endDate: DateTime.now().add(Duration(days: 85)),
    label: 'Testing & QA',
    description: 'Quality assurance and bug fixes',
    color: Colors.orange[400],
    icon: Icons.bug_report_outlined,
  ),
  GanttData(
    startDate: DateTime.now().add(Duration(days: 80)),
    endDate: DateTime.now().add(Duration(days: 90)),
    label: 'Deployment',
    description: 'Production deployment and launch',
    color: Colors.red[400],
    icon: Icons.rocket_launch_outlined,
  ),
];

MaterialGanttChart(
  data: projectPhases,
  width: 900,
  height: 500,
  style: GanttChartStyle(
    verticalSpacing: 100,
    showConnections: true,
    animationDuration: Duration(milliseconds: 2500),
    animationCurve: Curves.easeOutQuart,
  ),
)''',
      ),

      GanttCodeExample(
        title: 'Custom Date Formatting',
        description: 'Timeline with specialized date display',
        category: 'formatting',
        code: '''MaterialGanttChart(
  data: eventSchedule,
  width: 800,
  height: 350,
  style: GanttChartStyle(
    dateFormat: DateFormat('EEE, MMM dd'),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    dateStyle: TextStyle(
      fontSize: 11,
      color: Colors.indigo[600],
      fontWeight: FontWeight.w500,
    ),
    timelineYOffset: 70,
    labelOffset: 30,
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
      Colors.cyan,
      Colors.deepPurple,
    ];
  }

  // Background colors for chart
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
    GanttExample example,
    GanttConfig config,
    bool showRightPanel,
  ) {
    final dataString = example.data
        .take(3)
        .map(
          (data) =>
              '    GanttData(\n'
              '      startDate: DateTime.now()${data.startDate.difference(DateTime.now()).inDays != 0 ? '.add(Duration(days: ${data.startDate.difference(DateTime.now()).inDays}))' : ''},\n'
              '      endDate: DateTime.now().add(Duration(days: ${data.endDate.difference(DateTime.now()).inDays})),\n'
              '      label: \'${data.label}\',\n'
              '      description: \'${data.description ?? 'Task description'}\',\n'
              '      color: ${_getColorName(data.color ?? AppColors.primary)},\n'
              '      icon: ${data.icon != null ? _getIconName(data.icon!) : 'Icons.task_outlined'},\n'
              '    )',
        )
        .join(',\n');

    final lineColorName = _getColorName(config.lineColor);
    final pointColorName = _getColorName(config.pointColor);
    final connectionLineColorName = _getColorName(config.connectionLineColor);
    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);
    final animationCurveName = _getCurveName(config.animationCurve);
    final dateFormatName =
        config.dateFormat != null
            ? 'DateFormat(\'${config.dateFormat!.pattern}\')'
            : 'DateFormat(\'MMM dd\')';

    return '''// ${example.title} Example - Live Customization
final data = [
$dataString,
  // ... more tasks
];

MaterialGanttChart(
  data: data,
  width: ${config.width.toInt()},
  height: ${config.height.toInt()},
  interactive: ${config.interactive},
  style: GanttChartStyle(
    lineColor: $lineColorName,
    pointColor: $pointColorName,
    connectionLineColor: $connectionLineColorName,
    backgroundColor: $backgroundColorName,
    lineWidth: ${config.lineWidth.toStringAsFixed(1)},
    pointRadius: ${config.pointRadius.toStringAsFixed(1)},
    connectionLineWidth: ${config.connectionLineWidth.toStringAsFixed(1)},
    verticalSpacing: ${config.verticalSpacing.toStringAsFixed(0)},
    horizontalPadding: ${config.horizontalPadding.toStringAsFixed(0)},
    labelOffset: ${config.labelOffset.toStringAsFixed(0)},
    timelineYOffset: ${config.timelineYOffset.toStringAsFixed(0)},
    showConnections: ${config.showConnections},
    animationDuration: Duration(milliseconds: ${config.animationDuration.inMilliseconds}),
    animationCurve: $animationCurveName,
    dateFormat: $dateFormatName,${config.labelStyle != null ? '\n    labelStyle: TextStyle(\n      fontSize: 14,\n      fontWeight: FontWeight.w700,\n      color: Colors.black87,\n    ),' : ''}${config.dateStyle != null ? '\n    dateStyle: TextStyle(\n      fontSize: 11,\n      fontWeight: FontWeight.w600,\n      color: Colors.grey[600],\n    ),' : ''}
  ),
  onPointTap: (data) => print('Tapped: \${data.label}'),
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
    if (color.toString().contains('MaterialColor')) {
      // Handle material color shades
      if (color.toString().contains('blue')) return 'Colors.blue[400]!';
      if (color.toString().contains('green')) return 'Colors.green[400]!';
      if (color.toString().contains('orange')) return 'Colors.orange[400]!';
      if (color.toString().contains('purple')) return 'Colors.purple[400]!';
      if (color.toString().contains('red')) return 'Colors.red[400]!';
      if (color.toString().contains('indigo')) return 'Colors.indigo[400]!';
      if (color.toString().contains('grey')) return 'Colors.grey[600]!';
      if (color.toString().contains('amber')) return 'Colors.amber[600]!';
    }
    return 'Colors.blue';
  }

  static String _getIconName(IconData icon) {
    if (icon == Icons.settings_outlined) return 'Icons.settings_outlined';
    if (icon == Icons.code_outlined) return 'Icons.code_outlined';
    if (icon == Icons.verified_outlined) return 'Icons.verified_outlined';
    if (icon == Icons.rocket_launch_outlined)
      return 'Icons.rocket_launch_outlined';
    if (icon == Icons.location_on_outlined) return 'Icons.location_on_outlined';
    if (icon == Icons.person_outline) return 'Icons.person_outline';
    if (icon == Icons.campaign_outlined) return 'Icons.campaign_outlined';
    if (icon == Icons.event_outlined) return 'Icons.event_outlined';
    return 'Icons.task_outlined';
  }
}
