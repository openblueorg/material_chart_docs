// pie_chart/pie_chart_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';
import 'provider.dart';
import 'widget.dart';

/// # MaterialPieChart Widget Documentation
///
/// A highly customizable animated pie chart widget that displays data as colorful
/// slices with interactive hover effects, legends, and smooth animations.
///
/// ## Features
/// - 🎨 Fully customizable styling (colors, labels, legend position)
/// - ✨ Smooth animations with customizable duration and curves
/// - 🖱️ Interactive hover effects with segment highlighting
/// - 📊 Support for doughnut charts with configurable hole radius
/// - 🏷️ Flexible label positioning (inside/outside) with connector lines
/// - 📱 Responsive legend with multiple positioning options
/// - 🎯 Tap callbacks for individual segments
///
/// ## Use Cases
/// - Market share analysis
/// - Budget breakdowns
/// - Survey results visualization
/// - Performance metrics distribution
/// - Category-based analytics
class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  // UI State
  int _selectedExample = 0;
  bool _showRightPanel = false;
  bool _showCode = false;
  Key _chartKey = UniqueKey();

  // Chart Configuration
  PieChartConfig _chartConfig = const PieChartConfig();

  // Data Sources
  List<PieChartExample> _examples = [];
  List<PropertySection> _propertySections = [];
  List<CodeExample> _codeExamples = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _examples = PieChartDataProvider.getChartExamples();
    _propertySections = PieChartDataProvider.getPropertySections();
    _codeExamples = PieChartDataProvider.getCodeExamples();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Main Content Area
          Expanded(
            flex: _showRightPanel ? 7 : 10,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PieChartWidgets.buildDocumentationHeader(),
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
            ),
          ),

          // Right Side Panel
          if (_showRightPanel) ...[
            Container(width: 1, color: AppColors.border),
            Expanded(flex: 3, child: _buildRightSidePanel()),
          ],
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
              _buildDemoControls(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _examples[_selectedExample].description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 400,
            decoration: BoxDecoration(
              color:
                  _chartConfig.backgroundColor == Colors.transparent
                      ? Colors.white
                      : _chartConfig.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: Center(
              child: MaterialPieChart(
                key: _chartKey,
                data: _examples[_selectedExample].data,
                width: _showRightPanel ? 500 : 700,
                height: 350,
                minSizePercent: _chartConfig.minSizePercent,
                chartRadius:
                    _chartConfig.chartRadius == double.maxFinite
                        ? double.maxFinite
                        : _chartConfig.chartRadius,
                style: PieChartStyle(
                  defaultColors: _chartConfig.colorPalette,
                  backgroundColor: _chartConfig.backgroundColor,
                  startAngle: _chartConfig.startAngle,
                  holeRadius: _chartConfig.holeRadius,
                  animationDuration:
                      _chartConfig.enableAnimation
                          ? _chartConfig.animationDuration
                          : Duration.zero,
                  animationCurve: _chartConfig.animationCurve,
                  showLabels: _chartConfig.showLabels,
                  showValues: _chartConfig.showValues,
                  labelOffset: _chartConfig.labelOffset,
                  showLegend: _chartConfig.showLegend,
                  legendPosition: _chartConfig.legendPosition,
                  labelPosition: _chartConfig.labelPosition,
                  showConnectorLines: _chartConfig.showConnectorLines,
                  connectorLineColor: _chartConfig.connectorLineColor,
                  connectorLineStrokeWidth:
                      _chartConfig.connectorLineStrokeWidth,
                  chartAlignment: _chartConfig.chartAlignment,
                  labelStyle: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: _chartConfig.labelFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  valueStyle: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: _chartConfig.valueFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                interactive: _chartConfig.interactive,
                showLabelOnlyOnHover: _chartConfig.showLabelOnlyOnHover,
                padding: EdgeInsets.all(_chartConfig.padding),
                onAnimationComplete: () {
                  if (_chartConfig.enableAnimation) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${_examples[_selectedExample].title} animation completed!',
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: AppColors.accent,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height - 100,
                          left: 20,
                          right: 20,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoControls() {
    return Row(
      children: [
        PieChartWidgets.buildControlButton('Live Editor', Icons.tune, () {
          setState(() {
            _showRightPanel = true;
            _showCode = false;
          });
        }, isActive: _showRightPanel && !_showCode),
        const SizedBox(width: 8),
        PieChartWidgets.buildControlButton('Live Code', Icons.code, () {
          setState(() {
            _showRightPanel = true;
            _showCode = true;
          });
        }, isActive: _showRightPanel && _showCode),
      ],
    );
  }

  Widget _buildRightSidePanel() {
    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          // Panel Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                Icon(
                  _showCode ? Icons.code : Icons.tune,
                  size: 20,
                  color: AppColors.accent,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _showCode ? 'Live Code Editor' : 'Live Customization',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PieChartWidgets.buildPanelToggle(
                        'Customize',
                        Icons.tune,
                        !_showCode,
                        () => setState(() => _showCode = false),
                      ),
                      PieChartWidgets.buildPanelToggle(
                        'Code',
                        Icons.code,
                        _showCode,
                        () => setState(() => _showCode = true),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => setState(() => _showRightPanel = false),
                  icon: const Icon(Icons.close, size: 18),
                  color: AppColors.textSecondary,
                  splashRadius: 16,
                ),
              ],
            ),
          ),

          // Panel Content
          Expanded(
            child: _showCode ? _buildCodePanel() : _buildCustomizationPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomizationPanel() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Actions
          _buildQuickActions(),
          const SizedBox(height: 20),

          // Example Selector
          PieChartWidgets.buildPanelSection('Chart Example', [
            PieChartWidgets.buildExampleSelector(_examples, _selectedExample, (
              index,
            ) {
              setState(() {
                _selectedExample = index;
                _chartKey = UniqueKey();
              });
            }),
          ]),
          const SizedBox(height: 20),

          // Animation Controls
          PieChartWidgets.buildPanelSection('Animation Effects', [
            PieChartWidgets.buildToggle(
              'Enable Animation',
              _chartConfig.enableAnimation,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                if (value) _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildAnimationDurationSlider(
              _chartConfig.animationDuration,
              (duration) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  animationDuration: duration,
                );
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildAnimationCurveDropdown(
              PieChartDataProvider.getAnimationCurves(),
              _chartConfig.animationCurve,
              (curve) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationCurve: curve);
              }),
            ),
            const SizedBox(height: 12),
            PieChartWidgets.buildAnimationPreviewButton(() {
              setState(() => _chartKey = UniqueKey());
            }),
          ]),
          const SizedBox(height: 20),

          // Chart Structure
          PieChartWidgets.buildPanelSection('Chart Structure', [
            PieChartWidgets.buildSlider(
              'Start Angle',
              _chartConfig.startAngle,
              -180.0,
              180.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(startAngle: value);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildSlider(
              'Hole Radius (Doughnut)',
              _chartConfig.holeRadius,
              0.0,
              0.8,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(holeRadius: value);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildSlider(
              'Min Size Percent',
              _chartConfig.minSizePercent,
              0.0,
              15.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(minSizePercent: value);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildChartRadiusSlider(
              _chartConfig.chartRadius,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(chartRadius: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Labels & Values
          PieChartWidgets.buildPanelSection('Labels & Values', [
            PieChartWidgets.buildToggle(
              'Show Labels',
              _chartConfig.showLabels,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showLabels: value);
              }),
            ),
            const SizedBox(height: 8),
            PieChartWidgets.buildToggle(
              'Show Values',
              _chartConfig.showValues,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showValues: value);
              }),
            ),
            const SizedBox(height: 8),
            PieChartWidgets.buildToggle(
              'Labels Only on Hover',
              _chartConfig.showLabelOnlyOnHover,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  showLabelOnlyOnHover: value,
                );
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildLabelPositionDropdown(
              _chartConfig.labelPosition,
              (position) => setState(() {
                _chartConfig = _chartConfig.copyWith(labelPosition: position);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildSlider(
              'Label Offset',
              _chartConfig.labelOffset,
              10.0,
              50.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(labelOffset: value);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildSlider(
              'Label Font Size',
              _chartConfig.labelFontSize,
              8.0,
              20.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(labelFontSize: value);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildSlider(
              'Value Font Size',
              _chartConfig.valueFontSize,
              6.0,
              16.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(valueFontSize: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Legend Settings
          PieChartWidgets.buildPanelSection('Legend', [
            PieChartWidgets.buildToggle(
              'Show Legend',
              _chartConfig.showLegend,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showLegend: value);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildLegendPositionDropdown(
              _chartConfig.legendPosition,
              (position) => setState(() {
                _chartConfig = _chartConfig.copyWith(legendPosition: position);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Connector Lines
          PieChartWidgets.buildPanelSection('Connector Lines', [
            PieChartWidgets.buildToggle(
              'Show Connector Lines',
              _chartConfig.showConnectorLines,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showConnectorLines: value);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildSlider(
              'Line Width',
              _chartConfig.connectorLineStrokeWidth,
              0.5,
              5.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  connectorLineStrokeWidth: value,
                );
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildConnectorLineColorPicker(
              _chartConfig.connectorLineColor,
              (color) => setState(() {
                _chartConfig = _chartConfig.copyWith(connectorLineColor: color);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Interactivity
          PieChartWidgets.buildPanelSection('Interactivity', [
            PieChartWidgets.buildToggle(
              'Interactive',
              _chartConfig.interactive,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(interactive: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Chart Alignment
          PieChartWidgets.buildPanelSection('Position', [
            PieChartWidgets.buildChartAlignmentDropdown(
              _chartConfig.chartAlignment,
              (alignment) => setState(() {
                _chartConfig = _chartConfig.copyWith(chartAlignment: alignment);
              }),
            ),
            const SizedBox(height: 16),
            PieChartWidgets.buildSlider(
              'Padding',
              _chartConfig.padding,
              8.0,
              40.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(padding: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // // Colors
          // PieChartWidgets.buildPanelSection('Colors', [
          //   PieChartWidgets.buildColorPaletteSelector(
          //     _chartConfig.colorPalette,
          //     (palette) => setState(() {
          //       _chartConfig = _chartConfig.copyWith(colorPalette: palette);
          //     }),
          //   ),
          //   const SizedBox(height: 16),
          //   PieChartWidgets.buildBackgroundColorPicker(
          //     _chartConfig.backgroundColor,
          //     (color) => setState(() {
          //       _chartConfig = _chartConfig.copyWith(backgroundColor: color);
          //     }),
          //   ),
          // ]),
        ],
      ),
    );
  }

  Widget _buildCodePanel() {
    return Column(
      children: [
        // Code Controls
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            border: Border(
              bottom: BorderSide(
                color: AppColors.border.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Row(
            children: [
              PieChartWidgets.buildCodeButton('Copy', Icons.copy, () {
                _copyToClipboard(_getCurrentExampleCode());
              }),
              const SizedBox(width: 8),
              PieChartWidgets.buildCodeButton('Reset', Icons.refresh, () {
                _resetToDefaults();
              }),
              const Spacer(),
              Text(
                'Live Preview',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Code Content
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF1E1E1E),
            child: SingleChildScrollView(
              child: SelectableText(
                _getCurrentExampleCode(),
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: 'monospace',
                  color: Color(0xFFD4D4D4),
                  height: 1.4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: PieChartWidgets.buildQuickActionButton(
            'Replay',
            Icons.replay,
            () => setState(() => _chartKey = UniqueKey()),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: PieChartWidgets.buildQuickActionButton(
            'Reset',
            Icons.refresh,
            _resetToDefaults,
          ),
        ),
      ],
    );
  }

  Widget _buildPropertiesSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Properties',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Configure your pie chart components',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ..._propertySections.map((section) => _buildPropertySection(section)),
        ],
      ),
    );
  }

  Widget _buildPropertySection(PropertySection section) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
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
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: Column(
              children:
                  section.properties.asMap().entries.map((entry) {
                    final index = entry.key;
                    final property = entry.value;
                    final isLast = index == section.properties.length - 1;
                    return PieChartWidgets.buildPropertyRow(property, isLast);
                  }).toList(),
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
                  onTap: () => _copyToClipboard(_codeExamples[0].code),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.copy, size: 16, color: AppColors.accent),
                        const SizedBox(width: 6),
                        Text(
                          'Copy Code',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.accent,
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
          ..._codeExamples.map(
            (example) => Column(
              children: [
                PieChartWidgets.buildCodeBlock(example.title, example.code),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
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
            'PieChartData',
            'Model class for pie chart data slices',
            [
              'double value - The numeric value for slice size',
              'String label - The display label for the slice',
              'Color? color - Optional color for the slice',
              'VoidCallback? onTap - Optional tap callback',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'PieChartStyle',
            'Configuration for pie chart styling',
            [
              'List<Color> defaultColors - Default color palette',
              'Color backgroundColor - Background color (default: Colors.white)',
              'TextStyle? labelStyle - Custom label styling',
              'TextStyle? valueStyle - Custom value styling',
              'double startAngle - Starting angle in degrees (default: -90)',
              'double holeRadius - Hole radius for doughnut charts (default: 0)',
              'Duration animationDuration - Animation length (default: 1500ms)',
              'Curve animationCurve - Animation curve (default: Curves.easeInOut)',
              'bool showLabels - Display labels (default: true)',
              'bool showValues - Display values (default: true)',
              'double labelOffset - Label distance from edge (default: 20)',
              'bool showLegend - Display legend (default: true)',
              'LabelPosition labelPosition - Label positioning (default: outside)',
              'bool showConnectorLines - Show connector lines (default: true)',
              'Color connectorLineColor - Connector line color',
              'double connectorLineStrokeWidth - Connector line thickness',
              'ChartAlignment chartAlignment - Chart position (default: center)',
              'PieChartLegendPosition legendPosition - Legend position',
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
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
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

  void _resetToDefaults() {
    setState(() {
      _chartConfig = const PieChartConfig();
      _chartKey = UniqueKey();
    });
  }

  String _getCurrentExampleCode() {
    return PieChartDataProvider.generateLiveCode(
      _examples[_selectedExample],
      _chartConfig,
      _showRightPanel,
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Code copied to clipboard!'),
        backgroundColor: AppColors.accent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 20,
          right: 20,
        ),
      ),
    );
  }
}
