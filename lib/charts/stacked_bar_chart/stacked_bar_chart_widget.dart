// stackedbar_chart_widget.dart
import 'package:chat_test_01/material_charts/material_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'models.dart';
import 'provider.dart';
import 'widget.dart';

/// # MaterialStackedBarChart Widget Documentation
///
/// A highly customizable animated stacked bar chart widget that displays multiple 
/// data segments within each bar. Perfect for visualizing part-to-whole relationships,
/// comparative data across categories, and multi-dimensional analytics.
///
/// ## Features
/// - ✨ Smooth animations with customizable duration and curves
/// - 🎨 Fully customizable styling (colors, spacing, corner radius)
/// - 📊 Interactive hover effects and segment highlighting
/// - 🏷️ Configurable Y-axis with custom formatting
/// - 📱 Responsive design with flexible layout options
/// - 🎯 Value labels on segments with smart positioning
/// - 📋 Optional grid lines and axis customization
class StackedBarChartWidget extends StatefulWidget {
  const StackedBarChartWidget({super.key});

  @override
  State<StackedBarChartWidget> createState() => _StackedBarChartWidgetState();
}

class _StackedBarChartWidgetState extends State<StackedBarChartWidget> {
  // UI State
  int _selectedExample = 0;
  bool _showRightPanel = false;
  bool _showCode = false;
  Key _chartKey = UniqueKey();

  // Chart Configuration
  StackedBarChartConfig _chartConfig = const StackedBarChartConfig();

  // Data Sources
  List<StackedBarChartExample> _examples = [];
  List<StackedBarPropertySection> _propertySections = [];
  List<StackedBarCodeExample> _codeExamples = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _examples = StackedBarChartDataProvider.getChartExamples();
    _propertySections = StackedBarChartDataProvider.getPropertySections();
    _codeExamples = StackedBarChartDataProvider.getCodeExamples();
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
                  StackedBarChartWidgets.buildDocumentationHeader(),
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
            height: 450,
            decoration: BoxDecoration(
              color: _chartConfig.backgroundColor == Colors.transparent
                  ? Colors.white
                  : _chartConfig.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: Center(
              child: MaterialStackedBarChart(
                key: _chartKey,
                data: _applyConfigToData(_examples[_selectedExample].data),
                width: _showRightPanel ? 500 : 700,
                height: 400,
                style: StackedBarChartStyle(
                  backgroundColor: _chartConfig.backgroundColor,
                  gridColor: _chartConfig.gridColor,
                  barSpacing: _chartConfig.barSpacing,
                  cornerRadius: _chartConfig.cornerRadius,
                  animationDuration: _chartConfig.enableAnimation
                      ? _chartConfig.animationDuration
                      : Duration.zero,
                  animationCurve: _chartConfig.animationCurve,
                  labelStyle: TextStyle(
                    color: _chartConfig.labelTextColor,
                    fontSize: _chartConfig.labelFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  valueStyle: TextStyle(
                    color: _chartConfig.valueTextColor,
                    fontSize: _chartConfig.valueFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  yAxisConfig: _chartConfig.showYAxis ? YAxisConfig(
                    showAxisLine: _chartConfig.showAxisLine,
                    showGridLines: _chartConfig.showYAxisGridLines,
                    divisions: _chartConfig.yAxisDivisions,
                    axisWidth: _chartConfig.yAxisWidth,
                    labelStyle: TextStyle(
                      color: _chartConfig.yAxisTextColor,
                      fontSize: _chartConfig.yAxisFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                    labelFormatter: _chartConfig.yAxisFormatter,
                  ) : null,
                ),
                showGrid: _chartConfig.showGrid,
                showValues: _chartConfig.showValues,
                interactive: _chartConfig.enableInteraction,
                horizontalGridLines: _chartConfig.horizontalGridLines,
                padding: EdgeInsets.all(_chartConfig.chartPadding),
                onAnimationComplete: () {
                  if (_chartConfig.enableAnimation) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${_examples[_selectedExample].title} animation completed!',
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: AppColors.primary,
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
        StackedBarChartWidgets.buildControlButton('Live Editor', Icons.tune, () {
          setState(() {
            _showRightPanel = true;
            _showCode = false;
          });
        }, isActive: _showRightPanel && !_showCode),
        const SizedBox(width: 8),
        StackedBarChartWidgets.buildControlButton('Live Code', Icons.code, () {
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
                  color: AppColors.primary,
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
                      _buildPanelToggle(
                        'Customize',
                        Icons.tune,
                        !_showCode,
                        () => setState(() => _showCode = false),
                      ),
                      _buildPanelToggle(
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

  Widget _buildPanelToggle(
    String label,
    IconData icon,
    bool isActive,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isActive ? Colors.white : AppColors.textSecondary,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ],
        ),
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
          StackedBarChartWidgets.buildPanelSection('Chart Example', [
            StackedBarChartWidgets.buildExampleSelector(_examples, _selectedExample, (index) {
              setState(() {
                _selectedExample = index;
                _chartKey = UniqueKey();
              });
            }),
          ]),
          const SizedBox(height: 20),

          // Animation Controls
          StackedBarChartWidgets.buildPanelSection('Animation Effects', [
            StackedBarChartWidgets.buildToggle(
              'Enable Animation',
              _chartConfig.enableAnimation,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                if (value) _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildAnimationDurationSlider(
              _chartConfig.animationDuration,
              (duration) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationDuration: duration);
              }),
            ),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildAnimationCurveDropdown(
              StackedBarChartDataProvider.getAnimationCurves(),
              _chartConfig.animationCurve,
              (curve) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationCurve: curve);
              }),
            ),
            const SizedBox(height: 12),
            StackedBarChartWidgets.buildAnimationPreviewButton(() {
              setState(() => _chartKey = UniqueKey());
            }),
          ]),
          const SizedBox(height: 20),

          // Bar Styling
          StackedBarChartWidgets.buildPanelSection('Bar Styling', [
            StackedBarChartWidgets.buildSlider(
              'Bar Spacing',
              _chartConfig.barSpacing,
              0.0,
              0.8,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(barSpacing: value);
              }),
            ),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildSlider(
              'Corner Radius',
              _chartConfig.cornerRadius,
              0.0,
              20.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(cornerRadius: value);
              }),
            ),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildSlider(
              'Chart Padding',
              _chartConfig.chartPadding,
              10.0,
              40.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(chartPadding: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Display Options
          StackedBarChartWidgets.buildPanelSection('Display Options', [
            StackedBarChartWidgets.buildToggle(
              'Show Grid',
              _chartConfig.showGrid,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showGrid: value);
              }),
            ),
            const SizedBox(height: 8),
            StackedBarChartWidgets.buildToggle(
              'Show Values',
              _chartConfig.showValues,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showValues: value);
              }),
            ),
            const SizedBox(height: 8),
            StackedBarChartWidgets.buildToggle(
              'Enable Interaction',
              _chartConfig.enableInteraction,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableInteraction: value);
              }),
            ),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildSlider(
              'Horizontal Grid Lines',
              _chartConfig.horizontalGridLines.toDouble(),
              3.0,
              10.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(horizontalGridLines: value.round());
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Y-Axis Configuration
          StackedBarChartWidgets.buildPanelSection('Y-Axis Configuration', [
            StackedBarChartWidgets.buildToggle(
              'Show Y-Axis',
              _chartConfig.showYAxis,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showYAxis: value);
              }),
            ),
            const SizedBox(height: 8),
            StackedBarChartWidgets.buildToggle(
              'Show Axis Line',
              _chartConfig.showAxisLine,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showAxisLine: value);
              }),
            ),
            const SizedBox(height: 8),
            StackedBarChartWidgets.buildToggle(
              'Show Y-Axis Grid Lines',
              _chartConfig.showYAxisGridLines,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showYAxisGridLines: value);
              }),
            ),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildSlider(
              'Y-Axis Divisions',
              _chartConfig.yAxisDivisions.toDouble(),
              3.0,
              10.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(yAxisDivisions: value.round());
              }),
            ),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildSlider(
              'Y-Axis Width',
              _chartConfig.yAxisWidth,
              30.0,
              80.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(yAxisWidth: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Text Styling
          StackedBarChartWidgets.buildPanelSection('Text Styling', [
            Text(
              'Label Text (X-axis)',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            StackedBarChartWidgets.buildSlider(
              'Label Font Size',
              _chartConfig.labelFontSize,
              8.0,
              16.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(labelFontSize: value);
              }),
            ),
            const SizedBox(height: 16),
            Text(
              'Value Text (On segments)',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            StackedBarChartWidgets.buildSlider(
              'Value Font Size',
              _chartConfig.valueFontSize,
              8.0,
              16.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(valueFontSize: value);
              }),
            ),
            const SizedBox(height: 16),
            Text(
              'Y-Axis Text',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            StackedBarChartWidgets.buildSlider(
              'Y-Axis Font Size',
              _chartConfig.yAxisFontSize,
              8.0,
              16.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(yAxisFontSize: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Colors Section
          StackedBarChartWidgets.buildPanelSection('Colors', [
            _buildColorControls(),
            const SizedBox(height: 16),
            StackedBarChartWidgets.buildBackgroundColorPicker(
              _chartConfig.backgroundColor,
              (color) => setState(() {
                _chartConfig = _chartConfig.copyWith(backgroundColor: color);
              }),
            ),
          ]),
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
              _buildCodeButton('Copy', Icons.copy, () {
                _copyToClipboard(_getCurrentExampleCode());
              }),
              const SizedBox(width: 8),
              _buildCodeButton('Reset', Icons.refresh, () {
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

  Widget _buildCodeButton(String label, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 12, color: AppColors.primary),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: _buildQuickActionButton(
            'Replay',
            Icons.replay,
            () => setState(() => _chartKey = UniqueKey()),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildQuickActionButton(
            'Reset',
            Icons.refresh,
            _resetToDefaults,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton(
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              Icon(icon, size: 16, color: AppColors.primary),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorControls() {
    final colors = StackedBarChartDataProvider.getColorPalette();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Segment Colors',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        Text(
          'Colors are applied to segments across all bars.',
          style: TextStyle(
            fontSize: 9,
            color: AppColors.textSecondary.withValues(alpha: 0.8),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children: colors.map((colorSet) => 
            StackedBarChartWidgets.buildColorSetButton(
              colorSet,
              _chartConfig.segmentColors,
              (selectedColors) {
                setState(() {
                  _chartConfig = _chartConfig.copyWith(segmentColors: selectedColors);
                });
              },
            ),
          ).toList(),
        ),
      ],
    );
  }

  // Apply current configuration to data
  List<StackedBarData> _applyConfigToData(List<StackedBarData> originalData) {
    return originalData.map((barData) {
      return StackedBarData(
        label: barData.label,
        segments: barData.segments.asMap().entries.map((entry) {
          final index = entry.key;
          final segment = entry.value;
          
          // Use config colors cycling through the available colors
          final color = _chartConfig.segmentColors[index % _chartConfig.segmentColors.length];
          
          return StackedBarSegment(
            value: segment.value,
            color: color,
            label: segment.label,
          );
        }).toList(),
      );
    }).toList();
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
                  'Configure your stacked bar chart components',
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

  Widget _buildPropertySection(StackedBarPropertySection section) {
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
              children: section.properties.asMap().entries.map((entry) {
                final index = entry.key;
                final property = entry.value;
                final isLast = index == section.properties.length - 1;
                return StackedBarChartWidgets.buildPropertyRow(property, isLast);
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
                      color: AppColors.primary.withValues(alpha: 0.1),
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
          ..._codeExamples.map(
            (example) => Column(
              children: [
                StackedBarChartWidgets.buildCodeBlock(example.title, example.code),
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
            'StackedBarData',
            'Model class for chart bar data',
            [
              'String label - The bar label for X-axis',
              'List<StackedBarSegment> segments - The segments in this bar',
              'double get totalValue - Computed sum of all segments',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'StackedBarSegment',
            'Model class for individual bar segments',
            [
              'double value - The numeric value of this segment',
              'Color color - The color of this segment',
              'String? label - Optional label for tooltips/legends',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'StackedBarChartStyle',
            'Configuration for chart styling',
            [
              'Color gridColor - Grid line color (default: Colors.grey)',
              'Color backgroundColor - Background color (default: Colors.white)',
              'TextStyle? labelStyle - Style for bar labels',
              'TextStyle? valueStyle - Style for segment values',
              'double barSpacing - Spacing between bars (default: 0.2)',
              'double cornerRadius - Corner radius for bars (default: 4.0)',
              'Duration animationDuration - Animation length (default: 1500ms)',
              'Curve animationCurve - Animation curve (default: Curves.easeInOut)',
              'YAxisConfig? yAxisConfig - Y-axis configuration',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'YAxisConfig',
            'Y-axis configuration',
            [
              'double? minValue - Minimum Y-axis value',
              'double? maxValue - Maximum Y-axis value',
              'int divisions - Number of Y-axis divisions (default: 5)',
              'bool showAxisLine - Show vertical axis line (default: true)',
              'bool showGridLines - Show horizontal grid lines (default: true)',
              'TextStyle? labelStyle - Style for Y-axis labels',
              'double axisWidth - Width allocated for Y-axis (default: 50.0)',
              'String Function(double)? labelFormatter - Custom label formatter',
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
      _chartConfig = const StackedBarChartConfig();
      _chartKey = UniqueKey();
    });
  }

  String _getCurrentExampleCode() {
    return StackedBarChartDataProvider.generateLiveCode(
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
        backgroundColor: AppColors.primary,
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