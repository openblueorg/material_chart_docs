import 'package:chat_test_01/material_charts/material_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

/// # MaterialChartLine Widget Documentation
///
/// A highly customizable animated line chart widget that displays data points
/// connected by smooth lines. Perfect for visualizing trends, progress, and
/// time-series data with beautiful animations and styling options.
///
/// ## Features
/// - ✨ Smooth animations with customizable duration and curves
/// - 🎨 Fully customizable styling (colors, stroke width, point size)
/// - 📊 Optional grid lines and data points
/// - 🏷️ Automatic label positioning
/// - 📱 Responsive design with configurable padding
/// - 🎯 Callback support for animation completion
///
/// ## Use Cases
/// - Sales trends over time
/// - Performance metrics
/// - Temperature variations
/// - Stock price movements
/// - User engagement analytics
class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  int _selectedExample = 0;
  bool _showCode = false;
  final bool _animateChart = true;
  Key _chartKey = UniqueKey(); // Add key for forcing chart rebuild

  // Sample data sets for different examples
  final List<Map<String, dynamic>> _examples = [
    {
      'title': 'Monthly Sales Data',
      'description': 'Track sales performance across months',
      'data': [
        const ChartData(value: 15000, label: 'Jan'),
        const ChartData(value: 32000, label: 'Feb'),
        const ChartData(value: 28000, label: 'Mar'),
        const ChartData(value: 45000, label: 'Apr'),
        const ChartData(value: 38000, label: 'May'),
        const ChartData(value: 52000, label: 'Jun'),
        const ChartData(value: 48000, label: 'Jul'),
        const ChartData(value: 65000, label: 'Aug'),
      ],
      'color': AppColors.primary,
    },
    {
      'title': 'Temperature Variation',
      'description': 'Daily temperature readings',
      'data': [
        const ChartData(value: 22, label: 'Mon'),
        const ChartData(value: 25, label: 'Tue'),
        const ChartData(value: 28, label: 'Wed'),
        const ChartData(value: 26, label: 'Thu'),
        const ChartData(value: 24, label: 'Fri'),
        const ChartData(value: 23, label: 'Sat'),
        const ChartData(value: 21, label: 'Sun'),
      ],
      'color': Colors.orange,
    },
    {
      'title': 'User Engagement',
      'description': 'Weekly active users',
      'data': [
        const ChartData(value: 1200, label: 'W1'),
        const ChartData(value: 1350, label: 'W2'),
        const ChartData(value: 1180, label: 'W3'),
        const ChartData(value: 1420, label: 'W4'),
        const ChartData(value: 1680, label: 'W5'),
        const ChartData(value: 1550, label: 'W6'),
      ],
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDocumentationHeader(),
          const SizedBox(height: 32),
          _buildInteractiveDemo(),
          const SizedBox(height: 32),
          _buildPropertiesSection(),
          const SizedBox(height: 32),
          _buildCodeExamples(),
          const SizedBox(height: 32),
          _buildApiReference(),
        ],
      ),
    );
  }

  Widget _buildDocumentationHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.accent.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MaterialChartLine',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Beautiful animated line charts for Flutter',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'A highly customizable line chart widget that brings your data to life with smooth animations, '
            'elegant styling, and intuitive interactions. Perfect for dashboards, analytics, and data visualization.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveDemo() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Interactive Demo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              _buildExampleSelector(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _examples[_selectedExample]['description'],
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border.withOpacity(0.5)),
            ),
            child: Center(
              child: MaterialChartLine(
                key: _chartKey, // Use dynamic key for forcing rebuild
                data: _examples[_selectedExample]['data'],
                width: 600,
                height: 250,
                style: LineChartStyle(
                  lineColor: _examples[_selectedExample]['color'],
                  pointColor: _examples[_selectedExample]['color'],
                  backgroundColor: Colors.transparent,
                  gridColor: AppColors.border,
                  strokeWidth: 3,
                  pointRadius: 6,
                  labelStyle: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  animationDuration: const Duration(milliseconds: 2000),
                  animationCurve: Curves.easeOutCubic,
                ),
                showPoints: true,
                showGrid: true,
                padding: const EdgeInsets.all(20),
                onAnimationComplete: () {
                  // Animation completed callback
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildDemoControls(),
          if (_showCode) ...[
            const SizedBox(height: 16),
            _buildCurrentExampleCode(),
          ],
        ],
      ),
    );
  }

  Widget _buildExampleSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_examples.length, (index) {
          final isSelected = index == _selectedExample;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedExample = index;
                _chartKey = UniqueKey(); // Generate new key for animation
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                _examples[index]['title'].split(' ')[0],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDemoControls() {
    return Row(
      children: [
        _buildControlButton('Replay Animation', Icons.replay, () {
          setState(() {
            _chartKey = UniqueKey(); // Generate new key to force rebuild
          });
        }),
        const SizedBox(width: 12),
        _buildControlButton(
          'View Code',
          Icons.code,
          () => setState(() => _showCode = !_showCode),
          isActive: _showCode,
        ),
      ],
    );
  }

  Widget _buildControlButton(
    String label,
    IconData icon,
    VoidCallback onTap, {
    bool isActive = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color:
                isActive
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: isActive ? AppColors.primary : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isActive ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertiesSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Properties & Customization',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildPropertiesGrid(),
        ],
      ),
    );
  }

  Widget _buildPropertiesGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Widget Properties
        _buildPropertySection('Widget Properties', [
          {
            'name': 'data',
            'type': 'List<ChartData>',
            'description': 'Chart data points with values and labels',
            'required': true,
          },
          {
            'name': 'width',
            'type': 'double',
            'description': 'Chart width in pixels',
            'required': true,
          },
          {
            'name': 'height',
            'type': 'double',
            'description': 'Chart height in pixels',
            'required': true,
          },
          {
            'name': 'style',
            'type': 'LineChartStyle',
            'description': 'Visual styling configuration',
            'required': false,
          },
          {
            'name': 'showPoints',
            'type': 'bool',
            'description': 'Display points on line (default: true)',
            'required': false,
          },
          {
            'name': 'showGrid',
            'type': 'bool',
            'description': 'Display grid lines (default: true)',
            'required': false,
          },
          {
            'name': 'padding',
            'type': 'EdgeInsets',
            'description': 'Space around chart (default: 24px all)',
            'required': false,
          },
          {
            'name': 'onAnimationComplete',
            'type': 'VoidCallback?',
            'description': 'Called when animation finishes',
            'required': false,
          },
        ]),

        const SizedBox(height: 20),

        // LineChartStyle Properties
        _buildPropertySection('Style Properties', [
          {
            'name': 'lineColor',
            'type': 'Color',
            'description': 'Line color (default: Colors.blue)',
            'required': false,
          },
          {
            'name': 'pointColor',
            'type': 'Color',
            'description': 'Point color (default: Colors.blue)',
            'required': false,
          },
          {
            'name': 'gridColor',
            'type': 'Color',
            'description': 'Grid lines color (default: Colors.grey)',
            'required': false,
          },
          {
            'name': 'backgroundColor',
            'type': 'Color',
            'description': 'Chart background (default: Colors.white)',
            'required': false,
          },
          {
            'name': 'strokeWidth',
            'type': 'double',
            'description': 'Line thickness (default: 2.0)',
            'required': false,
          },
          {
            'name': 'pointRadius',
            'type': 'double',
            'description': 'Point size (default: 4.0)',
            'required': false,
          },
          {
            'name': 'animationDuration',
            'type': 'Duration',
            'description': 'Animation length (default: 1500ms)',
            'required': false,
          },
          {
            'name': 'animationCurve',
            'type': 'Curve',
            'description': 'Animation style (default: easeInOut)',
            'required': false,
          },
        ]),

        const SizedBox(height: 20),

        // ChartData Properties
        _buildPropertySection('Data Model', [
          {
            'name': 'value',
            'type': 'double',
            'description': 'Numeric value for Y-axis',
            'required': true,
          },
          {
            'name': 'label',
            'type': 'String',
            'description': 'Text label for X-axis',
            'required': true,
          },
        ]),
      ],
    );
  }

  Widget _buildPropertySection(
    String title,
    List<Map<String, dynamic>> properties,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border.withOpacity(0.5)),
          ),
          child: Column(
            children:
                properties.asMap().entries.map((entry) {
                  final index = entry.key;
                  final prop = entry.value;
                  final isLast = index == properties.length - 1;
                  return _buildCleanPropertyRow(prop, isLast);
                }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCleanPropertyRow(Map<String, dynamic> prop, bool isLast) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            isLast
                ? null
                : Border(
                  bottom: BorderSide(color: AppColors.border.withOpacity(0.3)),
                ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property name and type
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      prop['name'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    if (prop['required'] == true) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text(
                          '*',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  prop['type'],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Description
          Expanded(
            flex: 3,
            child: Text(
              prop['description'],
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeExamples() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Implementation Examples',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => _copyToClipboard(_getCurrentExampleCode()),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.copy, size: 16, color: AppColors.primary),
                        const SizedBox(width: 6),
                        Text(
                          'Copy Code',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCodeBlock('Basic Usage', _getBasicExample()),
          const SizedBox(height: 16),
          _buildCodeBlock('Advanced Styling', _getAdvancedExample()),
          const SizedBox(height: 16),
          _buildCodeBlock('With Callbacks', _getCallbackExample()),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border.withOpacity(0.3)),
          ),
          child: SelectableText(
            code,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'monospace',
              color: Color(0xFFD4D4D4),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildApiReference() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'API Reference',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'ChartData',
            'Model class for chart data points',
            [
              'double value - The numeric value',
              'String label - The display label',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'LineChartStyle',
            'Configuration for chart styling',
            [
              'Color lineColor - Line color (default: Colors.blue)',
              'Color pointColor - Point color (default: Colors.blue)',
              'Color gridColor - Grid color (default: Colors.grey)',
              'Color backgroundColor - Background color (default: Colors.white)',
              'TextStyle? labelStyle - Custom label styling',
              'double strokeWidth - Line thickness (default: 2.0)',
              'double pointRadius - Point size (default: 4.0)',
              'Duration animationDuration - Animation length (default: 1500ms)',
              'Curve animationCurve - Animation curve (default: Curves.easeInOut)',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClassReference(
    String className,
    String description,
    List<String> properties,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            className,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          ...properties.map(
            (prop) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '• $prop',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentExampleCode() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.code, size: 16, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                'Current Example Code',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () => _copyToClipboard(_getCurrentExampleCode()),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.copy, size: 14, color: AppColors.primary),
                        const SizedBox(width: 4),
                        Text(
                          'Copy',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border.withOpacity(0.3)),
            ),
            child: SelectableText(
              _getCurrentExampleCode(),
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: Color(0xFFD4D4D4),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentExampleCode() {
    final currentExample = _examples[_selectedExample];
    final dataString = (currentExample['data'] as List<ChartData>)
        .map(
          (data) =>
              '    ChartData(value: ${data.value}, label: \'${data.label}\')',
        )
        .join(',\n');

    final colorName = _getColorName(currentExample['color']);

    return '''// ${currentExample['title']} Example
final data = [
$dataString,
];

MaterialChartLine(
  data: data,
  width: 600,
  height: 250,
  style: LineChartStyle(
    lineColor: $colorName,
    pointColor: $colorName,
    backgroundColor: Colors.transparent,
    gridColor: AppColors.border,
    strokeWidth: 3,
    pointRadius: 6,
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
  ),
  showPoints: true,
  showGrid: true,
  padding: EdgeInsets.all(20),
  onAnimationComplete: () {
    print('${currentExample['title']} animation completed!');
  },
)''';
  }

  String _getColorName(Color color) {
    if (color == AppColors.primary) return 'AppColors.primary';
    if (color == Colors.orange) return 'Colors.orange';
    if (color == Colors.green) return 'Colors.green';
    if (color == Colors.blue) return 'Colors.blue';
    if (color == Colors.red) return 'Colors.red';
    return 'Colors.blue';
  }

  String _getBasicExample() {
    return '''MaterialChartLine(
  data: [
    ChartData(value: 15, label: 'Jan'),
    ChartData(value: 32, label: 'Feb'),
    ChartData(value: 28, label: 'Mar'),
    ChartData(value: 45, label: 'Apr'),
  ],
  width: 400,
  height: 300,
)''';
  }

  String _getAdvancedExample() {
    return '''MaterialChartLine(
  data: chartData,
  width: 600,
  height: 400,
  style: LineChartStyle(
    lineColor: Colors.blue,
    pointColor: Colors.red,
    backgroundColor: Colors.white,
    gridColor: Colors.grey.withOpacity(0.3),
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
  horizontalGridLines: 5,
)''';
  }

  String _getCallbackExample() {
    return '''MaterialChartLine(
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
)''';
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Code copied to clipboard!'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
