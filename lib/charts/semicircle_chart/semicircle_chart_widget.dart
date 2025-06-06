// semicircle_chart_widget.dart
import 'package:chat_test_01/material_charts/material_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'models.dart';
import 'provider.dart';
import 'widget.dart';

/// # MaterialChartHollowSemiCircle Widget Documentation
///
/// A beautiful hollow semicircle chart widget for displaying percentage data
/// with elegant animations, customizable styling, and interactive features.
/// Perfect for progress indicators, completion tracking, and data visualization.
///
/// ## Features
/// - ✨ Smooth animations with customizable duration and curves
/// - 🎨 Fully customizable styling (colors, text, hollow radius)
/// - 📊 Optional legend and percentage text display
/// - 📱 Responsive design with configurable size
/// - 🎯 Callback support for animation completion
/// - 🔧 Custom formatters for text display
/// - 💡 Optimized for accessibility and performance
///
/// ## Use Cases
/// - Project completion tracking
/// - Goal achievement displays
/// - Storage usage indicators
/// - Performance metrics
/// - Educational progress
/// - Budget utilization
class SemicircleChartWidget extends StatefulWidget {
  const SemicircleChartWidget({super.key});

  @override
  State<SemicircleChartWidget> createState() => _SemicircleChartWidgetState();
}

class _SemicircleChartWidgetState extends State<SemicircleChartWidget> {
  // UI State
  int _selectedExample = 0;
  bool _showRightPanel = false;
  bool _showCode = false;
  Key _chartKey = UniqueKey();
  int _selectedFormatterIndex = 0; // Track selected formatter by index

  // Chart Configuration
  SemicircleConfig _chartConfig = const SemicircleConfig();

  // Data Sources
  List<SemicircleExample> _examples = [];
  List<SemicirclePropertySection> _propertySections = [];
  List<SemicircleCodeExample> _codeExamples = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    // Ensure initial config has safe values
    _chartConfig = _chartConfig.copyWith(hollowRadius: 0.6);
  }

  void _loadData() {
    _examples = SemicircleDataProvider.getSemicircleExamples();
    _propertySections = SemicircleDataProvider.getPropertySections();
    _codeExamples = SemicircleDataProvider.getCodeExamples();
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
                  SemicircleWidgets.buildDocumentationHeader(),
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
          Center(
            child: Container(
              width: _showRightPanel ? 300 : 360, // Fixed container size
              height: _showRightPanel ? 300 : 360, // Fixed container size
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color:
                    _chartConfig.backgroundColor, // Use config background color
                gradient:
                    _chartConfig.backgroundColor == Colors.transparent
                        ? RadialGradient(
                          colors: [
                            _chartConfig.activeColor.withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                          radius: 1.5,
                        )
                        : null, // Only show gradient if background is transparent
                borderRadius: BorderRadius.circular(200),
                border:
                    _chartConfig.backgroundColor != Colors.transparent
                        ? Border.all(
                          color: AppColors.border.withValues(alpha: 0.3),
                        )
                        : null,
              ),
              child: MaterialChartHollowSemiCircle(
                key: _chartKey,
                percentage: _chartConfig.percentage,
                size: _showRightPanel ? 240 : _chartConfig.size,
                hollowRadius: _chartConfig.hollowRadius.clamp(
                  0.1,
                  0.85,
                ), // Always clamp for safety
                style: ChartStyle(
                  activeColor: _chartConfig.activeColor,
                  inactiveColor: _chartConfig.inactiveColor,
                  textColor: _chartConfig.textColor,
                  animationDuration:
                      _chartConfig.enableAnimation
                          ? _chartConfig.animationDuration
                          : Duration.zero,
                  animationCurve: _chartConfig.animationCurve,
                  showPercentageText: _chartConfig.showPercentageText,
                  showLegend: _chartConfig.showLegend,
                  percentageStyle:
                      _chartConfig.percentageStyle ??
                      TextStyle(
                        fontSize:
                            (_showRightPanel ? 240 : _chartConfig.size) / 8,
                        fontWeight: FontWeight.w900,
                        color: _chartConfig.textColor ?? AppColors.textPrimary,
                        letterSpacing: -1,
                      ),
                  legendStyle:
                      _chartConfig.legendStyle ??
                      const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                  percentageFormatter: _chartConfig.percentageFormatter,
                  legendFormatter: _chartConfig.legendFormatter,
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
          const SizedBox(height: 24),
          // Status indicator based on percentage
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: _getStatusGradient(_chartConfig.percentage),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: _chartConfig.activeColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getStatusIcon(_chartConfig.percentage),
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getStatusText(_chartConfig.percentage),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient _getStatusGradient(double percentage) {
    if (percentage >= 80) {
      return LinearGradient(colors: [Colors.green, Colors.green[700]!]);
    } else if (percentage >= 50) {
      return LinearGradient(colors: [Colors.orange, Colors.orange[700]!]);
    } else {
      return LinearGradient(colors: [Colors.red, Colors.red[700]!]);
    }
  }

  IconData _getStatusIcon(double percentage) {
    if (percentage >= 80) return Icons.trending_up;
    if (percentage >= 50) return Icons.schedule;
    return Icons.warning;
  }

  String _getStatusText(double percentage) {
    if (percentage >= 80) return 'Excellent progress!';
    if (percentage >= 50) return 'Good progress';
    return 'Needs attention';
  }

  Widget _buildDemoControls() {
    return Row(
      children: [
        SemicircleWidgets.buildControlButton('Live Editor', Icons.tune, () {
          setState(() {
            _showRightPanel = true;
            _showCode = false;
          });
        }, isActive: _showRightPanel && !_showCode),
        const SizedBox(width: 8),
        SemicircleWidgets.buildControlButton('Live Code', Icons.code, () {
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

  // Customization Panel with all semicircle options
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
          SemicircleWidgets.buildPanelSection('Chart Example', [
            SemicircleWidgets.buildExampleSelector(
              _examples,
              _selectedExample,
              (index) {
                setState(() {
                  _selectedExample = index;
                  _chartKey = UniqueKey();
                  _selectedFormatterIndex =
                      0; // Reset formatter when changing examples
                  _chartConfig = _chartConfig.copyWith(
                    percentage: _examples[_selectedExample].percentage,
                    activeColor: _examples[_selectedExample].activeColor,
                    inactiveColor: _examples[_selectedExample].inactiveColor,
                    hollowRadius: 0.6, // Use safe default value
                    percentageFormatter: null, // Reset to default formatter
                  );
                });
              },
            ),
          ]),
          const SizedBox(height: 20),

          // Value Controls
          SemicircleWidgets.buildPanelSection('Value Settings', [
            SemicircleWidgets.buildSlider(
              'Percentage',
              _chartConfig.percentage,
              0.0,
              100.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(percentage: value);
              }),
            ),
            const SizedBox(height: 16),
            SemicircleWidgets.buildSlider(
              'Chart Size',
              _chartConfig.size,
              150.0,
              400.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(size: value);
              }),
            ),
            const SizedBox(height: 16),
            SemicircleWidgets.buildSlider(
              'Hollow Radius',
              _chartConfig.hollowRadius.clamp(
                0.3,
                0.85,
              ), // Always clamp the display value
              0.3,
              0.85, // Reduced max to prevent errors
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  hollowRadius: value.clamp(0.3, 0.85),
                );
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Animation Controls Section
          SemicircleWidgets.buildPanelSection('Animation Effects', [
            SemicircleWidgets.buildToggle(
              'Enable Animation',
              _chartConfig.enableAnimation,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                if (value) _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            SemicircleWidgets.buildAnimationDurationSlider(
              _chartConfig.animationDuration,
              (duration) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  animationDuration: duration,
                );
              }),
            ),
            const SizedBox(height: 16),
            SemicircleWidgets.buildAnimationCurveDropdown(
              SemicircleDataProvider.getAnimationCurves(),
              _chartConfig.animationCurve,
              (curve) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationCurve: curve);
              }),
            ),
            const SizedBox(height: 12),
            SemicircleWidgets.buildAnimationPreviewButton(() {
              setState(() => _chartKey = UniqueKey());
            }),
          ]),
          const SizedBox(height: 20),

          // Display Options
          SemicircleWidgets.buildPanelSection('Display Options', [
            SemicircleWidgets.buildToggle(
              'Show Percentage',
              _chartConfig.showPercentageText,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showPercentageText: value);
              }),
            ),
            const SizedBox(height: 8),
            SemicircleWidgets.buildToggle(
              'Show Legend',
              _chartConfig.showLegend,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showLegend: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Colors Section
          SemicircleWidgets.buildPanelSection('Chart Colors', [
            _buildColorControls(),
          ]),
          const SizedBox(height: 20),

          // Formatting Options
          SemicircleWidgets.buildPanelSection('Text Formatting', [
            _buildFormatterControls(),
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
    final colors = SemicircleDataProvider.getColorPalette();
    final backgroundColors = SemicircleDataProvider.getBackgroundColors();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Active Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children:
              colors
                  .map(
                    (color) => SemicircleWidgets.buildColorButton(
                      color,
                      _chartConfig.activeColor,
                      (selectedColor) => setState(() {
                        _chartConfig = _chartConfig.copyWith(
                          activeColor: selectedColor,
                        );
                      }),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          'Inactive Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children:
              [
                    AppColors.border,
                    Colors.grey[200]!,
                    Colors.grey[300]!,
                    Colors.grey[400]!,
                    Colors.blueGrey[100]!,
                    Colors.blueGrey[200]!,
                  ]
                  .map(
                    (color) => SemicircleWidgets.buildColorButton(
                      color,
                      _chartConfig.inactiveColor,
                      (selectedColor) => setState(() {
                        _chartConfig = _chartConfig.copyWith(
                          inactiveColor: selectedColor,
                        );
                      }),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          'Background Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children:
              backgroundColors
                  .map((color) => _buildBackgroundColorButton(color))
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildBackgroundColorButton(Color color) {
    final isSelected = _chartConfig.backgroundColor == color;
    return GestureDetector(
      onTap:
          () => setState(() {
            _chartConfig = _chartConfig.copyWith(backgroundColor: color);
          }),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color == Colors.transparent ? Colors.white : color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.textPrimary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child:
            color == Colors.transparent
                ? const Icon(Icons.block, size: 12, color: Colors.red)
                : isSelected
                ? Icon(
                  Icons.check,
                  size: 14,
                  color:
                      color == Colors.white ||
                              color == const Color(0xFFF8F9FA) ||
                              color == const Color(0xFFF1F3F4) ||
                              color == const Color(0xFFE8F0FE) ||
                              color == const Color(0xFFFFF3E0) ||
                              color == const Color(0xFFE8F5E8) ||
                              color == const Color(0xFFFCE4EC) ||
                              color == const Color(0xFFE3F2FD) ||
                              color == const Color(0xFFF3E5F5)
                          ? Colors.black
                          : Colors.white,
                )
                : null,
      ),
    );
  }

  Widget _buildFormatterControls() {
    final formatters = SemicircleDataProvider.getPercentageFormatters();
    // Track selected formatter by index since function comparison doesn't work reliably
    int selectedFormatterIndex = _selectedFormatterIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Percentage Format',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        ...formatters.asMap().entries.map((entry) {
          final index = entry.key;
          final formatter = entry.value;
          final isSelected = selectedFormatterIndex == index;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap:
                  () => setState(() {
                    _selectedFormatterIndex = index;
                    _chartConfig = _chartConfig.copyWith(
                      percentageFormatter: formatter.formatter,
                    );
                  }),
              child: Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color:
                        isSelected
                            ? AppColors.primary
                            : AppColors.border.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 16,
                      color:
                          isSelected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        formatter.name,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
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
                  'Configure your semicircle chart components',
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

  Widget _buildPropertySection(SemicirclePropertySection section) {
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
                    return SemicircleWidgets.buildPropertyRow(property, isLast);
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
                SemicircleWidgets.buildCodeBlock(example.title, example.code),
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
            'MaterialChartHollowSemiCircle',
            'Main widget for displaying semicircle charts',
            [
              'double percentage - The percentage value (0-100) [required]',
              'double size - Chart size (width and height) [default: 200]',
              'double hollowRadius - Hollow center ratio (0-1) [default: 0.6]',
              'ChartStyle style - Visual styling configuration',
              'VoidCallback? onAnimationComplete - Animation completion callback',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'ChartStyle',
            'Configuration for chart styling and behavior',
            [
              'Color activeColor - Color for filled portion [default: Colors.blue]',
              'Color inactiveColor - Color for unfilled portion [default: grey]',
              'Color? textColor - Override for text colors',
              'TextStyle? percentageStyle - Custom percentage text styling',
              'TextStyle? legendStyle - Custom legend text styling',
              'Duration animationDuration - Animation length [default: 1500ms]',
              'Curve animationCurve - Animation curve [default: Curves.easeInOut]',
              'bool showPercentageText - Show percentage in center [default: true]',
              'bool showLegend - Show legend above chart [default: true]',
              'String Function(double)? percentageFormatter - Custom percentage format',
              'String Function(String, double)? legendFormatter - Custom legend format',
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
      _selectedFormatterIndex = 0; // Reset formatter index
      _chartConfig = SemicircleConfig(
        percentage: _examples[_selectedExample].percentage,
        activeColor: _examples[_selectedExample].activeColor,
        inactiveColor: _examples[_selectedExample].inactiveColor,
        hollowRadius: 0.6, // Use safe default value
      );
      _chartKey = UniqueKey();
    });
  }

  String _getCurrentExampleCode() {
    return SemicircleDataProvider.generateLiveCode(
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
