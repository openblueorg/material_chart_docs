// gantt_chart_widget.dart
// import 'package:chat_test_01/material_charts/material_charts.dart';
import '../../material_charts/material_charts.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'models.dart';
import 'provider.dart';
import 'widget.dart';

/// # MaterialGanttChart Widget Documentation
///
/// A comprehensive Gantt chart widget for project timeline visualization
/// with interactive features, task management, and extensive customization options.
/// Perfect for project management, scheduling, and timeline visualization.
///
/// ## Features
/// - ✨ Animated timeline rendering with smooth transitions
/// - 🎨 Fully customizable styling (colors, spacing, typography)
/// - 📊 Interactive hover and tap functionality
/// - 📱 Responsive design with configurable dimensions
/// - 🎯 Task relationship visualization with connection lines
/// - 🔧 Comprehensive layout and positioning controls
/// - 📅 Flexible date formatting options
/// - 💡 Real-time data updates and interactions
///
/// ## Use Cases
/// - Project management timelines
/// - Development sprint planning
/// - Event scheduling and coordination
/// - Construction project phases
/// - Research project milestones
/// - Marketing campaign timelines
class GanttChartWidget extends StatefulWidget {
  const GanttChartWidget({super.key});

  @override
  State<GanttChartWidget> createState() => _GanttChartWidgetState();
}

class _GanttChartWidgetState extends State<GanttChartWidget> {
  // UI State
  int _selectedExample = 0;
  bool _showRightPanel = false;
  bool _showCode = false;
  Key _chartKey = UniqueKey();
  int _selectedDateFormatIndex = 0;

  // Chart Configuration
  GanttConfig _chartConfig = const GanttConfig();

  // Data Sources
  List<GanttExample> _examples = [];
  List<GanttPropertySection> _propertySections = [];
  List<GanttCodeExample> _codeExamples = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _examples = GanttDataProvider.getGanttExamples();
    _propertySections = GanttDataProvider.getPropertySections();
    _codeExamples = GanttDataProvider.getCodeExamples();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width >= 1200;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1200;
    final isMobile = screenSize.width < 768;

    // Auto-hide panel on mobile
    if (isMobile && _showRightPanel) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _showRightPanel = false);
      });
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isMobile) {
            return _buildMobileLayout(constraints);
          } else if (isTablet) {
            return _buildTabletLayout(constraints);
          } else {
            return _buildDesktopLayout(constraints);
          }
        },
      ),
      // Mobile floating action button for controls
      floatingActionButton: isMobile ? _buildMobileControls() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Row(
      children: [
        // Main Content Area
        Expanded(
          flex: _showRightPanel ? 7 : 10,
          child: _buildMainContent(constraints),
        ),

        // Right Side Panel
        if (_showRightPanel) ...[
          Container(width: 1, color: AppColors.border),
          Expanded(flex: 3, child: _buildRightSidePanel()),
        ],
      ],
    );
  }

  Widget _buildTabletLayout(BoxConstraints constraints) {
    return Row(
      children: [
        // Main Content Area
        Expanded(
          flex: _showRightPanel ? 6 : 10,
          child: _buildMainContent(constraints),
        ),

        // Right Side Panel
        if (_showRightPanel) ...[
          Container(width: 1, color: AppColors.border),
          Expanded(flex: 4, child: _buildRightSidePanel()),
        ],
      ],
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    if (_showRightPanel) {
      // Full-screen panel on mobile
      return _buildRightSidePanel();
    }

    return _buildMainContent(constraints);
  }

  Widget _buildMainContent(BoxConstraints constraints) {
    final screenWidth = constraints.maxWidth;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1200;

    final padding =
        isMobile
            ? 16.0
            : isTablet
            ? 20.0
            : 24.0;
    final spacing =
        isMobile
            ? 20.0
            : isTablet
            ? 28.0
            : 32.0;

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GanttWidgets.buildDocumentationHeader(),
          SizedBox(height: spacing),
          _buildInteractiveDemo(constraints),
          SizedBox(height: spacing),
          _buildPropertiesSection(),
          SizedBox(height: spacing),
          _buildCodeExamples(),
          SizedBox(height: spacing),
          _buildApiReference(),
          // Extra bottom padding on mobile for FAB
          if (isMobile) const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildMobileControls() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_showRightPanel)
          FloatingActionButton(
            heroTag: "close",
            mini: true,
            onPressed: () => setState(() => _showRightPanel = false),
            backgroundColor: Colors.red.shade400,
            child: const Icon(Icons.close, color: Colors.white),
          ),
        if (_showRightPanel) const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: "editor",
          onPressed:
              () => setState(() {
                _showRightPanel = !_showRightPanel;
                _showCode = false;
              }),
          backgroundColor: AppColors.primary,
          child: Icon(
            _showRightPanel ? Icons.close : Icons.tune,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: "code",
          mini: true,
          onPressed:
              () => setState(() {
                _showRightPanel = true;
                _showCode = true;
              }),
          backgroundColor: AppColors.accent,
          child: const Icon(Icons.code, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildInteractiveDemo(BoxConstraints constraints) {
    final screenWidth = constraints.maxWidth;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1200;

    // Responsive chart dimensions
    double chartWidth;
    double chartHeight;

    if (isMobile) {
      chartWidth = screenWidth - 32; // Account for padding
      chartHeight = 300;
    } else if (isTablet) {
      chartWidth = _showRightPanel ? screenWidth * 0.6 - 40 : screenWidth - 40;
      chartHeight = 350;
    } else {
      chartWidth = _showRightPanel ? 600 : _chartConfig.width;
      chartHeight = _showRightPanel ? 350 : _chartConfig.height;
    }

    final padding =
        isMobile
            ? 16.0
            : isTablet
            ? 20.0
            : 24.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with responsive controls
          _buildDemoHeader(isMobile),
          const SizedBox(height: 8),
          Text(
            _examples[_selectedExample].description,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),

          // Chart container
          Container(
            width: double.infinity,
            height: chartHeight,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: chartWidth < 400 ? 400 : chartWidth, // Minimum width
                  height: chartHeight,
                  child: MaterialGanttChart(
                    key: _chartKey,
                    data: _getStyledData(),
                    width: chartWidth < 400 ? 400 : chartWidth,
                    height: chartHeight,
                    interactive: _chartConfig.interactive,
                    style: _buildResponsiveChartStyle(isMobile, isTablet),
                    onPointTap: (data) => _showTaskDetails(context, data),
                    onAnimationComplete: () => _showAnimationComplete(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Project info
          _buildProjectInfo(isMobile),
        ],
      ),
    );
  }

  Widget _buildDemoHeader(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Interactive Demo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          _buildDemoControls(),
        ],
      );
    }

    return Row(
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
    );
  }

  Widget _buildDemoControls() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    if (isMobile) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          GanttWidgets.buildControlButton('Live Editor', Icons.tune, () {
            setState(() {
              _showRightPanel = true;
              _showCode = false;
            });
          }, isActive: _showRightPanel && !_showCode),
          GanttWidgets.buildControlButton('Live Code', Icons.code, () {
            setState(() {
              _showRightPanel = true;
              _showCode = true;
            });
          }, isActive: _showRightPanel && _showCode),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GanttWidgets.buildControlButton('Live Editor', Icons.tune, () {
          setState(() {
            _showRightPanel = true;
            _showCode = false;
          });
        }, isActive: _showRightPanel && !_showCode),
        const SizedBox(width: 8),
        GanttWidgets.buildControlButton('Live Code', Icons.code, () {
          setState(() {
            _showRightPanel = true;
            _showCode = true;
          });
        }, isActive: _showRightPanel && _showCode),
      ],
    );
  }

  GanttChartStyle _buildResponsiveChartStyle(bool isMobile, bool isTablet) {
    // Adjust styling based on screen size
    double verticalSpacing = _chartConfig.verticalSpacing;
    double horizontalPadding = _chartConfig.horizontalPadding;
    double labelOffset = _chartConfig.labelOffset;
    double timelineYOffset = _chartConfig.timelineYOffset;

    if (isMobile) {
      verticalSpacing *= 0.8;
      horizontalPadding *= 0.7;
      labelOffset *= 0.8;
      timelineYOffset *= 0.8;
    } else if (isTablet) {
      verticalSpacing *= 0.9;
      horizontalPadding *= 0.85;
      labelOffset *= 0.9;
      timelineYOffset *= 0.9;
    }

    return GanttChartStyle(
      lineColor: _chartConfig.lineColor,
      pointColor: _chartConfig.pointColor,
      connectionLineColor: _chartConfig.connectionLineColor,
      backgroundColor: _chartConfig.backgroundColor,
      lineWidth: _chartConfig.lineWidth,
      pointRadius: _chartConfig.pointRadius,
      connectionLineWidth: _chartConfig.connectionLineWidth,
      verticalSpacing: verticalSpacing,
      horizontalPadding: horizontalPadding,
      labelOffset: labelOffset,
      timelineYOffset: timelineYOffset,
      showConnections: _chartConfig.showConnections,
      animationDuration:
          _chartConfig.enableAnimation
              ? _chartConfig.animationDuration
              : Duration.zero,
      animationCurve: _chartConfig.animationCurve,
      dateFormat: _chartConfig.dateFormat,
      labelStyle:
          _chartConfig.labelStyle ??
          TextStyle(
            color: AppColors.textPrimary,
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
      dateStyle:
          _chartConfig.dateStyle ??
          TextStyle(
            color: AppColors.textSecondary,
            fontSize: isMobile ? 10 : 11,
            fontWeight: FontWeight.w600,
          ),
      descriptionStyle:
          _chartConfig.descriptionStyle ??
          TextStyle(
            color: AppColors.textSecondary,
            fontSize: isMobile ? 11 : 12,
          ),
    );
  }

  Widget _buildProjectInfo(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: _examples[_selectedExample].primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _examples[_selectedExample].primaryColor.withValues(
            alpha: 0.3,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: isMobile ? 16 : 18,
                color: _examples[_selectedExample].primaryColor,
              ),
              SizedBox(width: isMobile ? 8 : 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project: ${_examples[_selectedExample].title}',
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        fontWeight: FontWeight.w600,
                        color: _examples[_selectedExample].primaryColor,
                      ),
                    ),
                    if (_examples[_selectedExample].metadata != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        _examples[_selectedExample].metadata!.entries
                            .map((e) => '${e.key}: ${e.value}')
                            .join(' • '),
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 11,
                          color: _examples[_selectedExample].primaryColor
                              .withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (!isMobile) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${_examples[_selectedExample].data.length} Tasks',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _examples[_selectedExample].primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRightSidePanel() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          // Panel Header
          Container(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: _buildPanelHeader(isMobile),
          ),

          // Panel Content
          Expanded(
            child: _showCode ? _buildCodePanel() : _buildCustomizationPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildPanelHeader(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          Row(
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
              IconButton(
                onPressed: () => setState(() => _showRightPanel = false),
                icon: const Icon(Icons.close, size: 18),
                color: AppColors.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildPanelToggle(),
        ],
      );
    }

    return Row(
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
        _buildPanelToggle(),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () => setState(() => _showRightPanel = false),
          icon: const Icon(Icons.close, size: 18),
          color: AppColors.textSecondary,
          splashRadius: 16,
        ),
      ],
    );
  }

  Widget _buildPanelToggle() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPanelToggleButton(
            'Customize',
            Icons.tune,
            !_showCode,
            () => setState(() => _showCode = false),
          ),
          _buildPanelToggleButton(
            'Code',
            Icons.code,
            _showCode,
            () => setState(() => _showCode = true),
          ),
        ],
      ),
    );
  }

  Widget _buildPanelToggleButton(
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final padding = isMobile ? 12.0 : 16.0;

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Actions
          _buildQuickActions(),
          const SizedBox(height: 20),

          // Example Selector
          GanttWidgets.buildPanelSection('Project Example', [
            GanttWidgets.buildExampleSelector(_examples, _selectedExample, (
              index,
            ) {
              setState(() {
                _selectedExample = index;
                _chartKey = UniqueKey();
                _selectedDateFormatIndex = 0;
                _chartConfig = _chartConfig.copyWith(
                  lineColor: _examples[_selectedExample].primaryColor,
                  pointColor: _examples[_selectedExample].primaryColor,
                  dateFormat: null,
                );
              });
            }),
          ]),
          const SizedBox(height: 20),

          // Animation Controls
          GanttWidgets.buildPanelSection('Animation Effects', [
            GanttWidgets.buildToggle(
              'Enable Animation',
              _chartConfig.enableAnimation,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(enableAnimation: value);
                if (value) _chartKey = UniqueKey();
              }),
            ),
            const SizedBox(height: 16),
            GanttWidgets.buildAnimationDurationSlider(
              _chartConfig.animationDuration,
              (duration) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  animationDuration: duration,
                );
              }),
            ),
            const SizedBox(height: 16),
            GanttWidgets.buildAnimationCurveDropdown(
              GanttDataProvider.getAnimationCurves(),
              _chartConfig.animationCurve,
              (curve) => setState(() {
                _chartConfig = _chartConfig.copyWith(animationCurve: curve);
              }),
            ),
            const SizedBox(height: 12),
            GanttWidgets.buildAnimationPreviewButton(() {
              setState(() => _chartKey = UniqueKey());
            }),
          ]),
          const SizedBox(height: 20),

          // Line Properties
          GanttWidgets.buildPanelSection('Line Properties', [
            GanttWidgets.buildSlider(
              'Task Line Width',
              _chartConfig.lineWidth,
              2.0,
              12.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(lineWidth: value);
              }),
            ),
            const SizedBox(height: 16),
            GanttWidgets.buildSlider(
              'Point Radius',
              _chartConfig.pointRadius,
              4.0,
              16.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(pointRadius: value);
              }),
            ),
            const SizedBox(height: 16),
            GanttWidgets.buildSlider(
              'Connection Line Width',
              _chartConfig.connectionLineWidth,
              1.0,
              6.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(
                  connectionLineWidth: value,
                );
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Layout Controls
          GanttWidgets.buildPanelSection('Layout Spacing', [
            GanttWidgets.buildSlider(
              'Vertical Spacing',
              _chartConfig.verticalSpacing,
              60.0,
              150.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(verticalSpacing: value);
              }),
            ),
            const SizedBox(height: 16),
            GanttWidgets.buildSlider(
              'Horizontal Padding',
              _chartConfig.horizontalPadding,
              16.0,
              80.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(horizontalPadding: value);
              }),
            ),
            const SizedBox(height: 16),
            GanttWidgets.buildSlider(
              'Label Offset',
              _chartConfig.labelOffset,
              15.0,
              50.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(labelOffset: value);
              }),
            ),
            const SizedBox(height: 16),
            GanttWidgets.buildSlider(
              'Timeline Y Offset',
              _chartConfig.timelineYOffset,
              40.0,
              100.0,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(timelineYOffset: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Display Options
          GanttWidgets.buildPanelSection('Display Options', [
            GanttWidgets.buildToggle(
              'Show Connections',
              _chartConfig.showConnections,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(showConnections: value);
              }),
            ),
            const SizedBox(height: 8),
            GanttWidgets.buildToggle(
              'Interactive Mode',
              _chartConfig.interactive,
              (value) => setState(() {
                _chartConfig = _chartConfig.copyWith(interactive: value);
              }),
            ),
          ]),
          const SizedBox(height: 20),

          // Colors Section
          GanttWidgets.buildPanelSection('Chart Colors', [
            _buildColorControls(),
          ]),
          const SizedBox(height: 20),

          // Date Formatting
          GanttWidgets.buildPanelSection('Date Format', [
            _buildDateFormatControls(),
          ]),
        ],
      ),
    );
  }

  Widget _buildCodePanel() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      children: [
        // Code Controls
        Container(
          padding: EdgeInsets.all(isMobile ? 8 : 12),
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
    final colors = GanttDataProvider.getColorPalette();
    final backgroundColors = GanttDataProvider.getBackgroundColors();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Task Line Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children:
              colors
                  .map(
                    (color) => GanttWidgets.buildColorButton(
                      color,
                      _chartConfig.lineColor,
                      (selectedColor) => setState(() {
                        _chartConfig = _chartConfig.copyWith(
                          lineColor: selectedColor,
                        );
                        _chartKey = UniqueKey();
                      }),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          'Point Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children:
              colors
                  .map(
                    (color) => GanttWidgets.buildColorButton(
                      color,
                      _chartConfig.pointColor,
                      (selectedColor) => setState(() {
                        _chartConfig = _chartConfig.copyWith(
                          pointColor: selectedColor,
                        );
                        _chartKey = UniqueKey();
                      }),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          'Connection Line Color',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children:
              [
                    AppColors.border,
                    Colors.grey[300]!,
                    Colors.grey[400]!,
                    Colors.blue[300]!,
                    Colors.green[300]!,
                    Colors.orange[300]!,
                  ]
                  .map(
                    (color) => GanttWidgets.buildColorButton(
                      color,
                      _chartConfig.connectionLineColor,
                      (selectedColor) => setState(() {
                        _chartConfig = _chartConfig.copyWith(
                          connectionLineColor: selectedColor,
                        );
                        _chartKey = UniqueKey();
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
          runSpacing: 6,
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
            _chartKey = UniqueKey();
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
                  color: _getContrastingColor(color),
                )
                : null,
      ),
    );
  }

  Color _getContrastingColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  Widget _buildDateFormatControls() {
    final formatOptions = GanttDataProvider.getDateFormatOptions();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Timeline Date Format',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        ...formatOptions.asMap().entries.map((entry) {
          final index = entry.key;
          final formatOption = entry.value;
          final isSelected = _selectedDateFormatIndex == index;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap:
                  () => setState(() {
                    _selectedDateFormatIndex = index;
                    _chartConfig = _chartConfig.copyWith(
                      dateFormat: formatOption.format,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatOption.name,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Example: ${formatOption.example}',
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

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
                  'Configure your Gantt chart components',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
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

  Widget _buildPropertySection(GanttPropertySection section) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
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
                    return GanttWidgets.buildPropertyRow(property, isLast);
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeExamples() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final padding = isMobile ? 16.0 : 24.0;

    return Container(
      padding: EdgeInsets.all(padding),
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
              Expanded(
                child: Text(
                  'Implementation Examples',
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
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
          const SizedBox(height: 16),
          ..._codeExamples.map(
            (example) => Column(
              children: [
                GanttWidgets.buildCodeBlock(example.title, example.code),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApiReference() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final padding = isMobile ? 16.0 : 24.0;

    return Container(
      padding: EdgeInsets.all(padding),
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
          const SizedBox(height: 16),
          _buildClassReference(
            'MaterialGanttChart',
            'Main widget for displaying Gantt charts',
            [
              'List<GanttData> data - Task data with dates and details [required]',
              'double width - Chart width in pixels [required]',
              'double height - Chart height in pixels [required]',
              'GanttChartStyle style - Visual styling configuration',
              'bool interactive - Enable hover and tap interactions [default: true]',
              'Function(GanttData)? onPointTap - Task tap callback',
              'Function(GanttData)? onPointHover - Task hover callback',
              'VoidCallback? onAnimationComplete - Animation completion callback',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'GanttChartStyle',
            'Configuration for chart styling and behavior',
            [
              'Color lineColor - Color for task timeline bars [default: Colors.blue]',
              'Color pointColor - Color for milestone points [default: Colors.blue]',
              'Color connectionLineColor - Color for connection lines [default: Colors.grey]',
              'Color backgroundColor - Chart background color [default: Colors.white]',
              'double lineWidth - Thickness of task bars [default: 2.0]',
              'double pointRadius - Size of milestone points [default: 4.0]',
              'double connectionLineWidth - Thickness of connections [default: 1.0]',
              'double verticalSpacing - Space between task rows [default: 120.0]',
              'double horizontalPadding - Left/right padding [default: 32.0]',
              'bool showConnections - Show task connections [default: true]',
              'DateFormat? dateFormat - Custom date formatting',
              'TextStyle? labelStyle - Task label text styling',
              'TextStyle? dateStyle - Timeline date text styling',
            ],
          ),
          const SizedBox(height: 16),
          _buildClassReference(
            'GanttData',
            'Model for individual project tasks',
            [
              'DateTime startDate - Task start date [required]',
              'DateTime endDate - Task end date [required]',
              'String label - Task name or title [required]',
              'String? description - Optional task description',
              'Color? color - Custom color for this task',
              'IconData? icon - Icon to represent the task',
              'String? tapContent - Additional content for tap dialog',
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

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
          const SizedBox(height: 12),
          ...properties.map(
            (prop) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '• $prop',
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
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
      _selectedDateFormatIndex = 0;
      _chartConfig = GanttConfig(
        lineColor: _examples[_selectedExample].primaryColor,
        pointColor: _examples[_selectedExample].primaryColor,
      );
      _chartKey = UniqueKey();
    });
  }

  List<GanttData> _getStyledData() {
    return _examples[_selectedExample].data.map((task) {
      return GanttData(
        startDate: task.startDate,
        endDate: task.endDate,
        label: task.label,
        description: task.description,
        color: _chartConfig.pointColor,
        icon: task.icon,
        tapContent: task.tapContent,
      );
    }).toList();
  }

  String _getCurrentExampleCode() {
    return GanttDataProvider.generateLiveCode(
      _examples[_selectedExample],
      _chartConfig,
      _showRightPanel,
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    _showSnackBar('Code copied to clipboard!');
  }

  void _showTaskDetails(BuildContext context, GanttData data) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder:
            (context) => Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(data.icon ?? Icons.task, color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          data.label,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (data.description != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      data.description!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${data.startDate.day}/${data.startDate.month} - ${data.endDate.day}/${data.endDate.month}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Close'),
                    ),
                  ),
                ],
              ),
            ),
      );
    } else {
      _showSnackBar('Tapped: ${data.label}');
    }
  }

  void _showAnimationComplete() {
    if (_chartConfig.enableAnimation) {
      _showSnackBar('${_examples[_selectedExample].title} timeline rendered!');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
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
