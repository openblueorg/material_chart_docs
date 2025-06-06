// multiline_chart_widget.dart
import 'package:chat_test_01/material_charts/material_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'models.dart';
import 'provider.dart';
import 'widget.dart';

/// # MaterialMultiLineChart Widget Documentation
///
/// A highly customizable animated multi-line chart widget that displays multiple
/// data series with smooth animations and rich styling options. Perfect for
/// visualizing comparative data, trends, and complex analytics.
///
/// ## Features
/// - ✨ Multiple data series with independent styling
/// - 🎨 Fully customizable styling (colors, stroke width, point size)
/// - 📊 Interactive crosshair and tooltips
/// - 🏷️ Configurable legend positioning
/// - 📱 Responsive design with zoom and pan support
/// - 🎯 Callback support for interactions
/// - 🎞️ Smooth animations with customizable curves
class MultiLineChartWidget extends StatefulWidget {
  const MultiLineChartWidget({super.key});

  @override
  State<MultiLineChartWidget> createState() => _MultiLineChartWidgetState();
}

class _MultiLineChartWidgetState extends State<MultiLineChartWidget> {
  // UI State
  int _selectedExample = 0;
  bool _showRightPanel = false;
  bool _showCode = false;
  Key _chartKey = UniqueKey();

  // Chart Configuration
  MultiLineChartConfig _chartConfig = const MultiLineChartConfig();

  // Data Sources
  List<MultiLineChartExample> _examples = [];
  List<MultiLinePropertySection> _propertySections = [];
  List<MultiLineCodeExample> _codeExamples = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _examples = MultiLineChartDataProvider.getChartExamples();
    _propertySections = MultiLineChartDataProvider.getPropertySections();
    _codeExamples = MultiLineChartDataProvider.getCodeExamples();
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
                  MultiLineChartWidgets.buildDocumentationHeader(),
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
              child: MultiLineChart(
                key: _chartKey,
                series: _applyConfigToSeries(
                  _examples[_selectedExample].series,
                ),
                width: _showRightPanel ? 500 : 700,
                height: 350,
                style: MultiLineChartStyle(
                  colors: _chartConfig.colors,
                  backgroundColor: _chartConfig.backgroundColor,
                  gridColor: _chartConfig.gridColor,
                  defaultLineWidth: _chartConfig.defaultLineWidth,
                  defaultPointSize: _chartConfig.defaultPointSize,
                  showPoints: _chartConfig.showPoints,
                  showGrid: _chartConfig.showGrid,
                  showLegend: _chartConfig.showLegend,
                  smoothLines: _chartConfig.smoothLines,
                  legendPosition: _chartConfig.legendPosition,
                  forceYAxisFromZero: _chartConfig.forceYAxisFromZero,
                  gridLineWidth: _chartConfig.gridLineWidth,
                  horizontalGridLines: _chartConfig.horizontalGridLines,
                  labelStyle: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  legendStyle: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  animation: ChartAnimation(
                    duration:
                        _chartConfig.enableAnimation
                            ? _chartConfig.animationDuration
                            : Duration.zero,
                    curve: _chartConfig.animationCurve,
                    enabled: _chartConfig.enableAnimation,
                  ),
                  crosshair:
                      _chartConfig.enableCrosshair
                          ? CrosshairConfig(
                            enabled: true,
                            lineColor: _chartConfig.crosshairColor,
                            lineWidth: _chartConfig.crosshairWidth,
                            showLabel: _chartConfig.showCrosshairLabels,
                          )
                          : null,
                  tooltipStyle: MultiLineTooltipStyle(
                    backgroundColor: _chartConfig.tooltipBackgroundColor,
                    textStyle: TextStyle(
                      color: _chartConfig.tooltipTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: _chartConfig.tooltipPadding,
                    borderRadius: _chartConfig.tooltipBorderRadius,
                  ),
                ),
                enableZoom: _chartConfig.enableZoom,
                enablePan: _chartConfig.enablePan,
                onChartTap: (offset) {
                  if (_chartConfig.enableAnimation) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Chart tapped at position: ${offset.dx.toStringAsFixed(1)}, ${offset.dy.toStringAsFixed(1)}',
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
        MultiLineChartWidgets.buildControlButton('Live Editor', Icons.tune, () {
          setState(() {
            _showRightPanel = true;
            _showCode = false;
          });
        }, isActive: _showRightPanel && !_showCode),
        const SizedBox(width: 8),
        MultiLineChartWidgets.buildControlButton('Live Code', Icons.code, () {
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
          MultiLineChartWidgets.buildPanelSection('Chart Example', [
            MultiLineChartWidgets.buildExampleSelector(
              _examples,
              _selectedExample,
              (index) {
                setState(() {
                  _selectedExample = index;
                  _chartKey = UniqueKey();
                });
              },
            ),
          ]),
          const SizedBox(height: 20),

          // Animation Controls
          MultiLineChartWidgets.buildPanelSection('Animation Effects', [
            MultiLineChartWidgets.buildToggle(
              'Enable Animation',
              _chartConfig.enableAnimation,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                if (value) _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            MultiLineChartWidgets.buildAnimationDurationSlider(
              _chartConfig.animationDuration,
              (duration) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  animationDuration: duration,
                );
              }),
            ),
            const SizedBox(height: 16),
            MultiLineChartWidgets.buildAnimationCurveDropdown(
              MultiLineChartDataProvider.getAnimationCurves(),
              _chartConfig.animationCurve,
              (curve) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationCurve: curve);
              }),
            ),
            const SizedBox(height: 12),
            MultiLineChartWidgets.buildAnimationPreviewButton(() {
              setState(() => _chartKey = UniqueKey());
            }),
          ]),
          const SizedBox(height: 20),

          // Series Controls
          MultiLineChartWidgets.buildPanelSection('Series & Lines', [
            Text(
              'Line width and point size are applied to all series uniformly.',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary.withValues(alpha: 0.8),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 12),
            MultiLineChartWidgets.buildSlider(
              'Default Line Width',
              _chartConfig.defaultLineWidth,
              1.0,
              8.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(defaultLineWidth: value);
              }),
            ),
            const SizedBox(height: 16),
            MultiLineChartWidgets.buildSlider(
              'Default Point Size',
              _chartConfig.defaultPointSize,
              2.0,
              12.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(defaultPointSize: value);
              }),
            ),
            const SizedBox(height: 16),
            MultiLineChartWidgets.buildToggle(
              'Smooth Lines',
              _chartConfig.smoothLines,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(smoothLines: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Display Options
          MultiLineChartWidgets.buildPanelSection('Display Options', [
            MultiLineChartWidgets.buildToggle(
              'Show Points',
              _chartConfig.showPoints,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showPoints: value);
              }),
            ),
            const SizedBox(height: 8),
            MultiLineChartWidgets.buildToggle(
              'Show Grid',
              _chartConfig.showGrid,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showGrid: value);
              }),
            ),
            const SizedBox(height: 8),
            MultiLineChartWidgets.buildToggle(
              'Show Legend',
              _chartConfig.showLegend,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showLegend: value);
              }),
            ),
            const SizedBox(height: 8),
            MultiLineChartWidgets.buildToggle(
              'Force Y-Axis from Zero',
              _chartConfig.forceYAxisFromZero,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(forceYAxisFromZero: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Legend Position
          MultiLineChartWidgets.buildPanelSection('Legend Position', [
            MultiLineChartWidgets.buildLegendPositionSelector(
              _chartConfig.legendPosition,
              (position) => setState(() {
                _chartConfig = _chartConfig.copyWith(legendPosition: position);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Grid Controls
          MultiLineChartWidgets.buildPanelSection('Grid Settings', [
            MultiLineChartWidgets.buildSlider(
              'Grid Line Width',
              _chartConfig.gridLineWidth,
              0.5,
              3.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(gridLineWidth: value);
              }),
            ),
            const SizedBox(height: 16),
            MultiLineChartWidgets.buildSlider(
              'Horizontal Grid Lines',
              _chartConfig.horizontalGridLines.toDouble(),
              3.0,
              10.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  horizontalGridLines: value.round(),
                );
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Crosshair Controls
          MultiLineChartWidgets.buildPanelSection('Crosshair & Tooltips', [
            MultiLineChartWidgets.buildToggle(
              'Enable Crosshair',
              _chartConfig.enableCrosshair,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableCrosshair: value);
              }),
            ),
            const SizedBox(height: 8),
            MultiLineChartWidgets.buildToggle(
              'Show Crosshair Labels',
              _chartConfig.showCrosshairLabels,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  showCrosshairLabels: value,
                );
              }),
            ),
            const SizedBox(height: 16),
            MultiLineChartWidgets.buildSlider(
              'Crosshair Width',
              _chartConfig.crosshairWidth,
              1.0,
              4.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(crosshairWidth: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Interaction Controls
          MultiLineChartWidgets.buildPanelSection('Interaction', [
            MultiLineChartWidgets.buildToggle(
              'Enable Zoom',
              _chartConfig.enableZoom,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableZoom: value);
              }),
            ),
            const SizedBox(height: 8),
            MultiLineChartWidgets.buildToggle(
              'Enable Pan',
              _chartConfig.enablePan,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enablePan: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Colors Section
          MultiLineChartWidgets.buildPanelSection('Colors', [
            _buildColorControls(),
            const SizedBox(height: 16),
            MultiLineChartWidgets.buildBackgroundColorPicker(
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
    final colors = MultiLineChartDataProvider.getColorPalette();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Series Colors',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        Text(
          'Colors are applied to series in order (series 1, 2, 3, etc.)',
          style: TextStyle(
            fontSize: 9,
            color: AppColors.textSecondary.withValues(alpha: 0.8),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children:
              colors
                  .map(
                    (colorSet) => MultiLineChartWidgets.buildColorSetButton(
                      colorSet,
                      _chartConfig.colors,
                      (selectedColors) {
                        setState(() {
                          _chartConfig = _chartConfig.copyWith(
                            colors: selectedColors,
                          );
                        });
                      },
                    ),
                  )
                  .toList(),
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
                  'Configure your multi-line chart components',
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

  Widget _buildPropertySection(MultiLinePropertySection section) {
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
                    return MultiLineChartWidgets.buildPropertyRow(
                      property,
                      isLast,
                    );
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
                MultiLineChartWidgets.buildCodeBlock(
                  example.title,
                  example.code,
                ),
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
            'ChartSeries',
            'Model class for chart data series',
            [
              'String name - The series name',
              'List<ChartDataPoint> dataPoints - The data points',
              'Color? color - Optional series color',
              'bool? showPoints - Show points on line',
              'bool? smoothLine - Use smooth line curves',
              'double? lineWidth - Line thickness',
              'double? pointSize - Point size',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'MultiLineChartStyle',
            'Configuration for chart styling',
            [
              'List<Color> colors - Colors for different series',
              'double defaultLineWidth - Default line thickness (default: 2.0)',
              'double defaultPointSize - Default point size (default: 4.0)',
              'Color gridColor - Grid color (default: Colors.grey)',
              'Color backgroundColor - Background color (default: Colors.white)',
              'TextStyle? labelStyle - Custom label styling',
              'TextStyle? legendStyle - Custom legend styling',
              'bool smoothLines - Enable smooth lines (default: false)',
              'bool showPoints - Show data points (default: true)',
              'bool showGrid - Show grid lines (default: true)',
              'bool showLegend - Show legend (default: true)',
              'LegendPosition legendPosition - Legend position (default: bottom)',
              'ChartAnimation animation - Animation configuration',
              'CrosshairConfig? crosshair - Crosshair configuration',
              'bool forceYAxisFromZero - Force Y-axis from zero (default: false)',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference('ChartAnimation', 'Animation configuration', [
            'Duration duration - Animation duration (default: 1000ms)',
            'Curve curve - Animation curve (default: Curves.easeInOut)',
            'bool enabled - Enable animations (default: true)',
          ]),
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
      _chartConfig = const MultiLineChartConfig();
      _chartKey = UniqueKey();
    });
  }

  // Apply current configuration to series
  List<ChartSeries> _applyConfigToSeries(List<ChartSeries> originalSeries) {
    return originalSeries.asMap().entries.map((entry) {
      final index = entry.key;
      final series = entry.value;

      // Use config colors cycling through the available colors
      final color = _chartConfig.colors[index % _chartConfig.colors.length];

      return ChartSeries(
        name: series.name,
        dataPoints: series.dataPoints,
        color: color, // Use configuration colors
        lineWidth: _chartConfig.defaultLineWidth, // Always use config value
        pointSize: _chartConfig.defaultPointSize, // Always use config value
        showPoints: _chartConfig.showPoints, // Use global config
        smoothLine: _chartConfig.smoothLines, // Use global config
      );
    }).toList();
  }

  String _getCurrentExampleCode() {
    return MultiLineChartDataProvider.generateLiveCode(
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
