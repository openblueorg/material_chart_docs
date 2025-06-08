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

  // Responsive helper methods
  bool _isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool _isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;
  bool _isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  double _getResponsivePadding(BuildContext context) {
    if (_isMobile(context)) return 16;
    if (_isTablet(context)) return 20;
    return 24;
  }

  double _getChartSize(BuildContext context) {
    if (_isMobile(context)) return 200;
    if (_isTablet(context)) return _showRightPanel ? 220 : 260;
    return _showRightPanel ? 240 : 300;
  }

  double _getContainerSize(BuildContext context) {
    if (_isMobile(context)) return 240;
    if (_isTablet(context)) return _showRightPanel ? 260 : 300;
    return _showRightPanel ? 300 : 360;
  }

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
    final isMobile = _isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: isMobile ? _buildMobileAppBar() : null,
      body: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      bottomSheet:
          isMobile && _showRightPanel ? _buildMobileBottomSheet() : null,
    );
  }

  PreferredSizeWidget _buildMobileAppBar() {
    return AppBar(
      title: const Text(
        'Semicircle Chart',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
      backgroundColor: AppColors.surface,
      elevation: 0,
      actions: [
        // Toggle customization panel
        IconButton(
          onPressed: () {
            setState(() {
              _showRightPanel = !_showRightPanel;
              _showCode = false;
            });
          },
          icon: Icon(
            _showRightPanel ? Icons.close : Icons.tune,
            color: AppColors.primary,
          ),
        ),
        // Show code
        IconButton(
          onPressed: () {
            setState(() {
              _showRightPanel = true;
              _showCode = true;
            });
          },
          icon: const Icon(Icons.code, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(_getResponsivePadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!_isMobile(context)) ...[
            SemicircleWidgets.buildDocumentationHeader(),
            const SizedBox(height: 32),
          ],
          _buildInteractiveDemo(),
          const SizedBox(height: 24),
          if (!_showRightPanel) ...[
            _buildMobileQuickControls(),
            const SizedBox(height: 24),
          ],
          _buildPropertiesSection(),
          const SizedBox(height: 24),
          _buildCodeExamples(),
          const SizedBox(height: 24),
          _buildApiReference(),
          // Add bottom padding for mobile bottom sheet
          if (_showRightPanel) const SizedBox(height: 300),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Main Content Area
        Expanded(
          flex: _showRightPanel ? 7 : 10,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(_getResponsivePadding(context)),
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
    );
  }

  Widget _buildMobileBottomSheet() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
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
                    _showCode ? 'Live Code' : 'Customize',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                // Toggle
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(6),
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
              ],
            ),
          ),
          // Content
          Expanded(
            child:
                _showCode
                    ? _buildCodePanel()
                    : _buildMobileCustomizationPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileQuickControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMobileActionButton('Customize', Icons.tune, () {
                  setState(() {
                    _showRightPanel = true;
                    _showCode = false;
                  });
                }),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMobileActionButton('View Code', Icons.code, () {
                  setState(() {
                    _showRightPanel = true;
                    _showCode = true;
                  });
                }),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMobileActionButton(
                  'Reset',
                  Icons.refresh,
                  _resetToDefaults,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileActionButton(
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
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              Icon(icon, size: 20, color: AppColors.primary),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
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

  // Interactive Demo with animation support
  Widget _buildInteractiveDemo() {
    final isMobile = _isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
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
              Text(
                'Interactive Demo',
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              if (!isMobile) _buildDemoControls(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _examples[_selectedExample].description,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Center(
            child: Container(
              width: _getContainerSize(context),
              height: _getContainerSize(context),
              padding: EdgeInsets.all(isMobile ? 20 : 32),
              decoration: BoxDecoration(
                color: _chartConfig.backgroundColor,
                gradient:
                    _chartConfig.backgroundColor == Colors.transparent
                        ? RadialGradient(
                          colors: [
                            _chartConfig.activeColor.withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                          radius: 1.5,
                        )
                        : null,
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
                size: _getChartSize(context),
                hollowRadius: _chartConfig.hollowRadius.clamp(0.1, 0.85),
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
                        fontSize: _getChartSize(context) / (isMobile ? 10 : 8),
                        fontWeight: FontWeight.w900,
                        color: _chartConfig.textColor ?? AppColors.textPrimary,
                        letterSpacing: -1,
                      ),
                  legendStyle:
                      _chartConfig.legendStyle ??
                      TextStyle(
                        fontSize: isMobile ? 11 : 13,
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
          SizedBox(height: isMobile ? 16 : 24),
          // Status indicator based on percentage
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 6 : 8,
              ),
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
                    size: isMobile ? 14 : 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getStatusText(_chartConfig.percentage),
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Mobile example selector
          if (isMobile) ...[
            const SizedBox(height: 16),
            _buildMobileExampleSelector(),
          ],
        ],
      ),
    );
  }

  Widget _buildMobileExampleSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chart Examples',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _examples.length,
            itemBuilder: (context, index) {
              final example = _examples[index];
              final isSelected = index == _selectedExample;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedExample = index;
                    _chartKey = UniqueKey();
                    _selectedFormatterIndex = 0;
                    _chartConfig = _chartConfig.copyWith(
                      percentage: _examples[_selectedExample].percentage,
                      activeColor: _examples[_selectedExample].activeColor,
                      inactiveColor: _examples[_selectedExample].inactiveColor,
                      hollowRadius: 0.6,
                      percentageFormatter: null,
                    );
                  });
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? AppColors.primary.withValues(alpha: 0.1)
                            : AppColors.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Semicircle preview icon
                      Container(
                        width: 16,
                        height: 8,
                        decoration: BoxDecoration(
                          color: example.activeColor.withValues(alpha: 0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        example.title,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${example.percentage.toInt()}%',
                        style: TextStyle(
                          fontSize: 9,
                          color:
                              isSelected
                                  ? AppColors.primary.withValues(alpha: 0.8)
                                  : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
                  _selectedFormatterIndex = 0;
                  _chartConfig = _chartConfig.copyWith(
                    percentage: _examples[_selectedExample].percentage,
                    activeColor: _examples[_selectedExample].activeColor,
                    inactiveColor: _examples[_selectedExample].inactiveColor,
                    hollowRadius: 0.6,
                    percentageFormatter: null,
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
              _chartConfig.hollowRadius.clamp(0.3, 0.85),
              0.3,
              0.85,
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

  Widget _buildMobileCustomizationPanel() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Example Selector
          _buildMobileExampleSection(),
          const SizedBox(height: 16),

          // Quick Controls
          _buildMobileQuickControlsSection(),
          const SizedBox(height: 16),

          // Style Options
          _buildMobileStyleSection(),
        ],
      ),
    );
  }

  Widget _buildMobileExampleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chart Examples',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _examples.length,
            itemBuilder: (context, index) {
              final example = _examples[index];
              final isSelected = index == _selectedExample;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedExample = index;
                    _chartKey = UniqueKey();
                    _selectedFormatterIndex = 0;
                    _chartConfig = _chartConfig.copyWith(
                      percentage: _examples[_selectedExample].percentage,
                      activeColor: _examples[_selectedExample].activeColor,
                      inactiveColor: _examples[_selectedExample].inactiveColor,
                      hollowRadius: 0.6,
                      percentageFormatter: null,
                    );
                  });
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? AppColors.primary.withValues(alpha: 0.1)
                            : AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        example.title,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Container(
                        width: 12,
                        height: 6,
                        decoration: BoxDecoration(
                          color: example.activeColor.withValues(alpha: 0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMobileQuickControlsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Value Settings',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildMobileSlider(
                'Percentage',
                _chartConfig.percentage,
                0.0,
                100.0,
                (value) => setState(() {
                  _chartConfig = _chartConfig.copyWith(percentage: value);
                }),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMobileSlider(
                'Hollow Radius',
                _chartConfig.hollowRadius.clamp(0.3, 0.85),
                0.3,
                0.85,
                (value) => setState(() {
                  _chartConfig = _chartConfig.copyWith(
                    hollowRadius: value.clamp(0.3, 0.85),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileStyleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Display Options',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildMobileToggle(
                'Show Percentage',
                _chartConfig.showPercentageText,
                (value) => setState(() {
                  _chartConfig = _chartConfig.copyWith(
                    showPercentageText: value,
                  );
                }),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMobileToggle(
                'Show Legend',
                _chartConfig.showLegend,
                (value) => setState(() {
                  _chartConfig = _chartConfig.copyWith(showLegend: value);
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildMobileToggle(
                'Animation',
                _chartConfig.enableAnimation,
                (value) => setState(() {
                  _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                  if (value) _chartKey = UniqueKey();
                }),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(), // Empty container for spacing
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toStringAsFixed(value == value.toInt() ? 0 : 1)}',
          style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
        ),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 2,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: Slider(value: value, min: min, max: max, onChanged: onChanged),
        ),
      ],
    );
  }

  Widget _buildMobileToggle(
    String label,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildCodePanel() {
    final isMobile = _isMobile(context);

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
                  fontSize: isMobile ? 10 : 11,
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
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            color: const Color(0xFF1E1E1E),
            child: SingleChildScrollView(
              child: SelectableText(
                _getCurrentExampleCode(),
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11,
                  fontFamily: 'monospace',
                  color: const Color(0xFFD4D4D4),
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
    final isMobile = _isMobile(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Clean header
          Container(
            padding: EdgeInsets.only(bottom: isMobile ? 16 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Properties',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Configure your semicircle chart components',
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    color: AppColors.textSecondary.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Properties content
          if (isMobile)
            // Mobile: Show properties in expandable cards
            ..._propertySections.map(
              (section) => _buildMobilePropertySection(section),
            )
          else
            // Desktop: Show all properties
            ..._propertySections.map(
              (section) => _buildPropertySection(section),
            ),
        ],
      ),
    );
  }

  Widget _buildMobilePropertySection(SemicirclePropertySection section) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(
          section.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        leading: Icon(section.icon, size: 20, color: section.color),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children:
                  section.properties.asMap().entries.map((entry) {
                    final index = entry.key;
                    final property = entry.value;
                    final isLast = index == section.properties.length - 1;
                    return _buildMobilePropertyRow(property, isLast);
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobilePropertyRow(SemicirclePropertyInfo property, bool isLast) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border:
            isLast
                ? null
                : Border(
                  bottom: BorderSide(
                    color: AppColors.border.withValues(alpha: 0.3),
                  ),
                ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                property.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'monospace',
                ),
              ),
              if (property.required) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Text(
                    '*',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              Text(
                property.type,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            property.description,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
              height: 1.3,
            ),
          ),
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
    final isMobile = _isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
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
              Text(
                'Implementation Examples',
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              if (!isMobile)
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
          SizedBox(height: isMobile ? 12 : 16),
          if (isMobile)
            // Mobile: Show code examples in tabs
            _buildMobileCodeExamples()
          else
            // Desktop: Show all code examples
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

  Widget _buildMobileCodeExamples() {
    return DefaultTabController(
      length: _codeExamples.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            labelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            tabs:
                _codeExamples
                    .map((example) => Tab(text: example.title))
                    .toList(),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: TabBarView(
              children:
                  _codeExamples.map((example) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        child: SelectableText(
                          example.code,
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'monospace',
                            color: Color(0xFFD4D4D4),
                            height: 1.4,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApiReference() {
    final isMobile = _isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'API Reference',
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
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
            isMobile,
          ),
          SizedBox(height: isMobile ? 12 : 16),
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
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildClassReference(
    String className,
    String description,
    List<String> properties,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
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
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 12 : 13,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          ...properties.map(
            (prop) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '• $prop',
                style: TextStyle(
                  fontSize: isMobile ? 10 : 12,
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
