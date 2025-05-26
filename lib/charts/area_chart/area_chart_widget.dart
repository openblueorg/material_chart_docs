// lib/charts/area_chart/area_chart_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';
import 'provider.dart';
import 'widget.dart';

/// # MaterialAreaChart Widget Documentation
///
/// A highly customizable animated area chart widget that displays data as filled areas
/// under smooth curves. Perfect for visualizing cumulative data, comparisons between
/// multiple series, and showing trends with visual emphasis on magnitude.
///
/// ## Features
/// - ✨ Smooth animations with customizable duration and curves
/// - 🎨 Multiple series support with individual styling
/// - 📊 Gradient fills and transparency effects
/// - 🏷️ Automatic label positioning and legend support
/// - 📱 Responsive design with configurable padding
/// - 🎯 Interactive hover effects and callbacks
/// - 🌈 Custom gradient colors and opacity control
///
/// ## Use Cases
/// - Revenue vs expenses over time
/// - Multiple product line comparisons
/// - Cumulative progress tracking
/// - Population demographics
/// - Financial portfolio visualization
class AreaChartWidget extends StatefulWidget {
  const AreaChartWidget({super.key});

  @override
  State<AreaChartWidget> createState() => _AreaChartWidgetState();
}

class _AreaChartWidgetState extends State<AreaChartWidget> {
  // UI State
  int _selectedExample = 0;
  bool _showRightPanel = false;
  bool _showCode = false;
  Key _chartKey = UniqueKey();

  // Chart Configuration
  AreaChartConfig _chartConfig = const AreaChartConfig();

  // Data Sources
  List<AreaChartExample> _examples = [];
  List<PropertySection> _propertySections = [];
  List<CodeExample> _codeExamples = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _examples = AreaChartDataProvider.getChartExamples();
    _propertySections = AreaChartDataProvider.getPropertySections();
    _codeExamples = AreaChartDataProvider.getCodeExamples();
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
                  ChartWidgets.buildAreaChartDocumentationHeader(),
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
              color: _chartConfig.backgroundColor == Colors.transparent
                  ? Colors.white
                  : _chartConfig.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: Center(
              child: MaterialAreaChart(
                key: _chartKey,
                series: _buildCurrentSeries(),
                width: _showRightPanel ? 450 : 650,
                height: 350,
                style: AreaChartStyle(
                  colors: AppColors.chartPalette,
                  backgroundColor: _chartConfig.backgroundColor,
                  gridColor: _chartConfig.gridColor,
                  showPoints: _chartConfig.showPoints,
                  defaultPointSize: _chartConfig.pointSize,
                  defaultLineWidth: _chartConfig.lineWidth,
                  labelStyle: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  animationDuration: Duration(
                    milliseconds: (2000 / _chartConfig.animationSpeed).round(),
                  ),
                  animationCurve: _chartConfig.animationCurve,
                ),
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

  List<AreaChartSeries> _buildCurrentSeries() {
    final example = _examples[_selectedExample];
    return example.series.map((series) {
      return AreaChartSeries(
        name: series.name,
        dataPoints: series.dataPoints,
        color: _chartConfig.useCustomColors ? _chartConfig.primaryColor : series.color,
        gradientColor: _chartConfig.useCustomColors 
            ? _chartConfig.primaryColor.withValues(alpha: _chartConfig.fillOpacity)
            : series.gradientColor,
        lineWidth: _chartConfig.lineWidth,
        pointSize: _chartConfig.pointSize,
      );
    }).toList();
  }

  Widget _buildDemoControls() {
    return Row(
      children: [
        ChartWidgets.buildControlButton('Live Editor', Icons.tune, () {
          setState(() {
            _showRightPanel = true;
            _showCode = false;
          });
        }, isActive: _showRightPanel && !_showCode),
        const SizedBox(width: 8),
        ChartWidgets.buildControlButton('Live Code', Icons.code, () {
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
                // Toggle between customize and code
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
          ChartWidgets.buildPanelSection('Chart Example', [
            _buildAreaExampleSelector(_examples, _selectedExample, (index) {
              setState(() {
                _selectedExample = index;
                _chartKey = UniqueKey();
                _chartConfig = _chartConfig.copyWith(
                  primaryColor: _examples[_selectedExample].series.first.color,
                );
              });
            }),
          ]),
          const SizedBox(height: 20),

          // Animation Controls
          ChartWidgets.buildPanelSection('Animation Effects', [
            ChartWidgets.buildToggle(
              'Enable Animation',
              _chartConfig.enableAnimation,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                if (value) _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            ChartWidgets.buildSlider(
              'Animation Speed',
              _chartConfig.animationSpeed,
              0.5,
              3.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationSpeed: value);
                _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            ChartWidgets.buildAnimationCurveDropdown(
              AreaChartDataProvider.getAnimationCurves(),
              _chartConfig.animationCurve,
              (curve) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationCurve: curve);
              }),
            ),
            const SizedBox(height: 12),
            ChartWidgets.buildAnimationPreviewButton(() {
              setState(() => _chartKey = UniqueKey());
            }),
          ]),
          const SizedBox(height: 20),

          // Area Appearance Controls
          ChartWidgets.buildPanelSection('Area Appearance', [
            ChartWidgets.buildSlider(
              'Line Width',
              _chartConfig.lineWidth,
              1.0,
              8.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(lineWidth: value);
              }),
            ),
            const SizedBox(height: 16),
            ChartWidgets.buildSlider(
              'Point Size',
              _chartConfig.pointSize,
              2.0,
              12.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(pointSize: value);
              }),
            ),
            const SizedBox(height: 16),
            ChartWidgets.buildSlider(
              'Fill Opacity',
              _chartConfig.fillOpacity,
              0.1,
              1.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(fillOpacity: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Display Options
          ChartWidgets.buildPanelSection('Display Options', [
            ChartWidgets.buildToggle(
              'Show Points',
              _chartConfig.showPoints,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showPoints: value);
              }),
            ),
            const SizedBox(height: 8),
            ChartWidgets.buildToggle(
              'Show Grid',
              _chartConfig.showGrid,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showGrid: value);
              }),
            ),
            const SizedBox(height: 8),
            ChartWidgets.buildToggle(
              'Show Legend',
              _chartConfig.showLegend,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showLegend: value);
              }),
            ),
            const SizedBox(height: 8),
            ChartWidgets.buildToggle(
              'Custom Colors',
              _chartConfig.useCustomColors,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(useCustomColors: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Colors
          ChartWidgets.buildPanelSection('Colors', [
            _buildColorControls(),
            const SizedBox(height: 16),
            _buildBackgroundControls(),
          ]),
          const SizedBox(height: 20),

          // Presets
          ChartWidgets.buildPanelSection('Style Presets', [
            _buildPresetButtons(),
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
    final colors = AreaChartDataProvider.getColorPalette();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Primary Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children: colors
              .map(
                (color) => ChartWidgets.buildColorButton(
                  color,
                  _chartConfig.primaryColor,
                  (selectedColor) {
                    setState(() {
                      _chartConfig = _chartConfig.copyWith(
                        primaryColor: selectedColor,
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

  Widget _buildBackgroundControls() {
    return ChartWidgets.buildBackgroundColorPicker(
      _chartConfig.backgroundColor,
      (color) => setState(() {
        _chartConfig = _chartConfig.copyWith(backgroundColor: color);
      }),
    );
  }

  Widget _buildPresetButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildPresetButton('Minimal', () => _applyPreset('minimal')),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPresetButton('Modern', () => _applyPreset('modern')),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildPresetButton('Vibrant', () => _applyPreset('vibrant')),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildPresetButton('Classic', () => _applyPreset('classic')),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPresetButton(String label, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  void _applyPreset(String preset) {
    setState(() {
      switch (preset) {
        case 'minimal':
          _chartConfig = _chartConfig.copyWith(
            lineWidth: 2.0,
            pointSize: 4.0,
            fillOpacity: 0.2,
            showPoints: false,
            showGrid: false,
            showLegend: false,
            primaryColor: AppColors.textPrimary,
            backgroundColor: Colors.transparent,
          );
          break;
        case 'modern':
          _chartConfig = _chartConfig.copyWith(
            lineWidth: 3.0,
            pointSize: 6.0,
            fillOpacity: 0.4,
            showPoints: true,
            showGrid: true,
            showLegend: true,
            primaryColor: AppColors.primary,
            backgroundColor: Colors.white,
          );
          break;
        case 'vibrant':
          _chartConfig = _chartConfig.copyWith(
            lineWidth: 4.0,
            pointSize: 8.0,
            fillOpacity: 0.6,
            showPoints: true,
            showGrid: true,
            showLegend: true,
            primaryColor: AppColors.accent,
            backgroundColor: AppColors.surface,
          );
          break;
        case 'classic':
          _chartConfig = _chartConfig.copyWith(
            lineWidth: 2.0,
            pointSize: 5.0,
            fillOpacity: 0.3,
            showPoints: true,
            showGrid: true,
            showLegend: true,
            primaryColor: Colors.blue,
            backgroundColor: Colors.white,
          );
          break;
      }
      _chartKey = UniqueKey();
    });
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
                  'Configure your area chart components',
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
              children: section.properties.asMap().entries.map((entry) {
                final index = entry.key;
                final property = entry.value;
                final isLast = index == section.properties.length - 1;
                return ChartWidgets.buildPropertyRow(property, isLast);
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
                ChartWidgets.buildCodeBlock(example.title, example.code),
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
            'AreaChartSeries',
            'Model class for area chart data series',
            [
              'String name - Series name for legend',
              'List<AreaChartData> dataPoints - Data points',
              'Color color - Line and border color',
              'Color gradientColor - Fill gradient color',
              'double lineWidth - Line thickness',
              'double pointSize - Point size',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'AreaChartStyle',
            'Configuration for area chart styling',
            [
              'List<Color> colors - Color palette for series',
              'Color backgroundColor - Chart background',
              'Color gridColor - Grid line color',
              'bool showPoints - Display data points',
              'double defaultPointSize - Default point size',
              'double defaultLineWidth - Default line width',
              'TextStyle? labelStyle - Label styling',
              'Duration animationDuration - Animation length',
              'Curve animationCurve - Animation curve',
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

  Widget _buildAreaExampleSelector(
    List<AreaChartExample> examples,
    int selectedIndex,
    Function(int) onSelect,
  ) {
    return Column(
      children: examples.asMap().entries.map((entry) {
        final index = entry.key;
        final example = entry.value;
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () => onSelect(index),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.border.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        example.series.first.color!,
                        example.series.first.color!.withOpacity(0.3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        example.title,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        example.description,
                        style: TextStyle(
                          fontSize: 9,
                          color: isSelected
                              ? AppColors.primary.withValues(alpha: 0.8)
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                // Series count badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: example.series.first.color!.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${example.series.length} Series',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: example.series.first.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  void _resetToDefaults() {
    setState(() {
      _chartConfig = AreaChartConfig(
        primaryColor: _examples[_selectedExample].series.first.color!,
      );
      _chartKey = UniqueKey();
    });
  }

  String _getCurrentExampleCode() {
    return AreaChartDataProvider.generateLiveCode(
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