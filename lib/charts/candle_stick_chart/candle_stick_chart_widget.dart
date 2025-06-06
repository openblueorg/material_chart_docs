// candlestick_chart_widget.dart
import 'package:chat_test_01/material_charts/material_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'models.dart';
import 'provider.dart';
import 'widget.dart';

/// # MaterialCandlestickChart Widget Documentation
///
/// A comprehensive candlestick chart widget for displaying financial OHLC data
/// with beautiful animations, interactive tooltips, and extensive customization options.
/// Perfect for trading platforms, financial dashboards, and market analysis tools.
///
/// ## Features
/// - ✨ Smooth animations with customizable duration and curves
/// - 🎨 Fully customizable styling (colors, sizes, spacing)
/// - 📊 Interactive hover tooltips with OHLC data
/// - 📱 Responsive design with scrolling support
/// - 🎯 Callback support for animation completion
/// - 📈 Optimized rendering for large datasets
/// - 🔧 Comprehensive axis configuration
///
/// ## Use Cases
/// - Stock price charts
/// - Cryptocurrency trading data
/// - Forex market analysis
/// - Commodity futures tracking
/// - Financial trading platforms
class CandlestickChartWidget extends StatefulWidget {
  const CandlestickChartWidget({super.key});

  @override
  State<CandlestickChartWidget> createState() => _CandlestickChartWidgetState();
}

class _CandlestickChartWidgetState extends State<CandlestickChartWidget> {
  // UI State
  int _selectedExample = 0;
  bool _showRightPanel = false;
  bool _showCode = false;
  Key _chartKey = UniqueKey();

  // Chart Configuration
  CandlestickConfig _chartConfig = const CandlestickConfig();

  // Data Sources
  List<CandlestickExample> _examples = [];
  List<CandlestickPropertySection> _propertySections = [];
  List<CandlestickCodeExample> _codeExamples = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _examples = CandlestickDataProvider.getCandlestickExamples();
    _propertySections = CandlestickDataProvider.getPropertySections();
    _codeExamples = CandlestickDataProvider.getCodeExamples();
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
                  CandlestickWidgets.buildDocumentationHeader(),
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

  // Interactive Demo with animation support
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
              child: MaterialCandlestickChart(
                key: _chartKey,
                data: _examples[_selectedExample].data,
                width: _showRightPanel ? 500 : 700,
                height: 370,
                style: CandlestickStyle(
                  bullishColor: _chartConfig.bullishColor,
                  bearishColor: _chartConfig.bearishColor,
                  candleWidth: _chartConfig.candleWidth,
                  wickWidth: _chartConfig.wickWidth,
                  spacing: _chartConfig.spacing,
                  verticalLineColor: _chartConfig.verticalLineColor,
                  verticalLineWidth: _chartConfig.verticalLineWidth,
                  animationDuration: _chartConfig.enableAnimation
                      ? _chartConfig.animationDuration
                      : Duration.zero,
                  animationCurve: _chartConfig.animationCurve,
                  tooltipStyle: TooltipStyle(
                    backgroundColor: _chartConfig.tooltipBackgroundColor,
                    borderColor: _chartConfig.tooltipBorderColor,
                    borderRadius: _chartConfig.tooltipBorderRadius,
                    textStyle: _chartConfig.tooltipTextStyle,
                    padding: _chartConfig.tooltipPadding,
                  ),
                ),
                backgroundColor: _chartConfig.backgroundColor,
                axisConfig: ChartAxisConfig(
                  priceDivisions: _chartConfig.priceDivisions,
                  dateDivisions: _chartConfig.dateDivisions,
                  yAxisWidth: _chartConfig.yAxisWidth,
                  xAxisHeight: _chartConfig.xAxisHeight,
                  labelStyle: _chartConfig.labelStyle ??
                      const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                showGrid: _chartConfig.showGrid,
                padding: const EdgeInsets.all(20),
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
        CandlestickWidgets.buildControlButton('Live Editor', Icons.tune, () {
          setState(() {
            _showRightPanel = true;
            _showCode = false;
          });
        }, isActive: _showRightPanel && !_showCode),
        const SizedBox(width: 8),
        CandlestickWidgets.buildControlButton('Live Code', Icons.code, () {
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

  // Customization Panel with all candlestick options
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
          CandlestickWidgets.buildPanelSection('Chart Example', [
            CandlestickWidgets.buildExampleSelector(_examples, _selectedExample, (index) {
              setState(() {
                _selectedExample = index;
                _chartKey = UniqueKey();
                _chartConfig = _chartConfig.copyWith(
                  bullishColor: _examples[_selectedExample].bullishColor,
                  bearishColor: _examples[_selectedExample].bearishColor,
                );
              });
            }),
          ]),
          const SizedBox(height: 20),

          // Animation Controls Section
          CandlestickWidgets.buildPanelSection('Animation Effects', [
            CandlestickWidgets.buildToggle(
              'Enable Animation',
              _chartConfig.enableAnimation,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                if (value) _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            CandlestickWidgets.buildAnimationDurationSlider(
              _chartConfig.animationDuration,
              (duration) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationDuration: duration);
              }),
            ),
            const SizedBox(height: 16),
            CandlestickWidgets.buildAnimationCurveDropdown(
              CandlestickDataProvider.getAnimationCurves(),
              _chartConfig.animationCurve,
              (curve) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationCurve: curve);
              }),
            ),
            const SizedBox(height: 12),
            CandlestickWidgets.buildAnimationPreviewButton(() {
              setState(() => _chartKey = UniqueKey());
            }),
          ]),
          const SizedBox(height: 20),

          // Candlestick Styling
          CandlestickWidgets.buildPanelSection('Candlestick Style', [
            CandlestickWidgets.buildSlider(
              'Candle Width',
              _chartConfig.candleWidth,
              6.0,
              20.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(candleWidth: value);
              }),
            ),
            const SizedBox(height: 16),
            CandlestickWidgets.buildSlider(
              'Wick Width',
              _chartConfig.wickWidth,
              1.0,
              5.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(wickWidth: value);
              }),
            ),
            const SizedBox(height: 16),
            CandlestickWidgets.buildSlider(
              'Spacing',
              _chartConfig.spacing,
              0.0,
              1.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(spacing: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Display Options
          CandlestickWidgets.buildPanelSection('Display Options', [
            CandlestickWidgets.buildToggle(
              'Show Grid',
              _chartConfig.showGrid,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showGrid: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Colors Section
          CandlestickWidgets.buildPanelSection('Candlestick Colors', [
            _buildCandlestickColorControls(),
            const SizedBox(height: 16),
            CandlestickWidgets.buildBackgroundColorPicker(
              _chartConfig.backgroundColor,
              (color) => setState(() {
                _chartConfig = _chartConfig.copyWith(backgroundColor: color);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Interactive Features
          CandlestickWidgets.buildPanelSection('Interactive Features', [
            const Text(
              'Vertical Line',
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: CandlestickDataProvider.getColorPalette()
                  .map((color) => CandlestickWidgets.buildColorButton(
                        color,
                        _chartConfig.verticalLineColor,
                        (selectedColor) => setState(() {
                          _chartConfig = _chartConfig.copyWith(
                            verticalLineColor: selectedColor,
                          );
                        }),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            CandlestickWidgets.buildSlider(
              'Line Width',
              _chartConfig.verticalLineWidth,
              0.5,
              4.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(verticalLineWidth: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Tooltip Styling
          CandlestickWidgets.buildPanelSection('Tooltip Style', [
            const Text(
              'Background Color',
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: [
                AppColors.darkTeal,
                Colors.black87,
                Colors.white,
                Colors.blue[800]!,
                Colors.grey[800]!,
              ]
                  .map((color) => CandlestickWidgets.buildColorButton(
                        color,
                        _chartConfig.tooltipBackgroundColor,
                        (selectedColor) => setState(() {
                          _chartConfig = _chartConfig.copyWith(
                            tooltipBackgroundColor: selectedColor,
                          );
                        }),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            CandlestickWidgets.buildSlider(
              'Border Radius',
              _chartConfig.tooltipBorderRadius,
              0.0,
              20.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(tooltipBorderRadius: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Axis Configuration
          CandlestickWidgets.buildPanelSection('Axis Configuration', [
            CandlestickWidgets.buildSlider(
              'Price Divisions',
              _chartConfig.priceDivisions.toDouble(),
              3.0,
              10.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(priceDivisions: value.round());
              }),
            ),
            const SizedBox(height: 16),
            CandlestickWidgets.buildSlider(
              'Date Divisions',
              _chartConfig.dateDivisions.toDouble(),
              3.0,
              10.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(dateDivisions: value.round());
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

  Widget _buildQuickActionButton(String label, IconData icon, VoidCallback onTap) {
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

  Widget _buildCandlestickColorControls() {
    final colors = CandlestickDataProvider.getColorPalette();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bullish (Up) Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children: colors
              .map((color) => CandlestickWidgets.buildColorButton(
                    color,
                    _chartConfig.bullishColor,
                    (selectedColor) => setState(() {
                      _chartConfig = _chartConfig.copyWith(bullishColor: selectedColor);
                    }),
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          'Bearish (Down) Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children: colors
              .map((color) => CandlestickWidgets.buildColorButton(
                    color,
                    _chartConfig.bearishColor,
                    (selectedColor) => setState(() {
                      _chartConfig = _chartConfig.copyWith(bearishColor: selectedColor);
                    }),
                  ))
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
          // Clean header
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
                  'Configure your candlestick chart components',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Properties content
          ..._propertySections.map((section) => _buildPropertySection(section)),
        ],
      ),
    );
  }

  Widget _buildPropertySection(CandlestickPropertySection section) {
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
                return CandlestickWidgets.buildPropertyRow(property, isLast);
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
                CandlestickWidgets.buildCodeBlock(example.title, example.code),
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
            'CandlestickData',
            'Model class for candlestick OHLC data points',
            [
              'DateTime date - The date/time of the candlestick',
              'double open - Opening price',
              'double high - Highest price during period',
              'double low - Lowest price during period',
              'double close - Closing price',
              'double? volume - Optional trading volume',
              'bool isBullish - Whether close >= open',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'CandlestickStyle',
            'Configuration for candlestick styling',
            [
              'Color bullishColor - Color for bullish candlesticks (default: Colors.green)',
              'Color bearishColor - Color for bearish candlesticks (default: Colors.red)',
              'double candleWidth - Width of candlestick bodies (default: 12.0)',
              'double wickWidth - Thickness of candlestick wicks (default: 2.0)',
              'double spacing - Space between candlesticks (default: 0.2)',
              'Color verticalLineColor - Color of hover line (default: Colors.blue)',
              'double verticalLineWidth - Width of hover line (default: 1.0)',
              'Duration animationDuration - Animation length (default: 1500ms)',
              'Curve animationCurve - Animation curve (default: Curves.easeInOut)',
              'TooltipStyle tooltipStyle - Tooltip configuration',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'TooltipStyle',
            'Configuration for interactive tooltips',
            [
              'Color backgroundColor - Tooltip background (default: Colors.white)',
              'Color borderColor - Tooltip border (default: Colors.grey)',
              'double borderRadius - Corner radius (default: 5.0)',
              'TextStyle textStyle - Text styling',
              'EdgeInsets padding - Internal padding (default: EdgeInsets.all(8))',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'ChartAxisConfig',
            'Configuration for chart axes and labels',
            [
              'int priceDivisions - Y-axis divisions (default: 5)',
              'int dateDivisions - X-axis divisions (default: 5)',
              'TextStyle? labelStyle - Label text styling',
              'double yAxisWidth - Y-axis width (default: 60.0)',
              'double xAxisHeight - X-axis height (default: 30.0)',
              'String Function(double)? priceFormatter - Custom price formatting',
              'String Function(DateTime)? dateFormatter - Custom date formatting',
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
      _chartConfig = CandlestickConfig(
        bullishColor: _examples[_selectedExample].bullishColor,
        bearishColor: _examples[_selectedExample].bearishColor,
      );
      _chartKey = UniqueKey();
    });
  }

  String _getCurrentExampleCode() {
    return CandlestickDataProvider.generateLiveCode(
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