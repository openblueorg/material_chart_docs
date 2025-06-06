// gantt_chart_widget.dart
import 'package:chat_test_01/material_charts/material_charts.dart';
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
  int _selectedDateFormatIndex = 0; // Track selected date format

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
                  GanttWidgets.buildDocumentationHeader(),
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
            width: double.infinity,
            height: _showRightPanel ? 350 : 450,
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
              child: MaterialGanttChart(
                key: _chartKey,
                data: _getStyledData(), // Use styled data with custom colors
                width: _showRightPanel ? 600 : _chartConfig.width,
                height: _showRightPanel ? 350 : _chartConfig.height,
                interactive: _chartConfig.interactive,
                style: GanttChartStyle(
                  lineColor: _chartConfig.lineColor,
                  pointColor: _chartConfig.pointColor,
                  connectionLineColor: _chartConfig.connectionLineColor,
                  backgroundColor: _chartConfig.backgroundColor,
                  lineWidth: _chartConfig.lineWidth,
                  pointRadius: _chartConfig.pointRadius,
                  connectionLineWidth: _chartConfig.connectionLineWidth,
                  verticalSpacing: _chartConfig.verticalSpacing,
                  horizontalPadding: _chartConfig.horizontalPadding,
                  labelOffset: _chartConfig.labelOffset,
                  timelineYOffset: _chartConfig.timelineYOffset,
                  showConnections: _chartConfig.showConnections,
                  animationDuration:
                      _chartConfig.enableAnimation
                          ? _chartConfig.animationDuration
                          : Duration.zero,
                  animationCurve: _chartConfig.animationCurve,
                  dateFormat: _chartConfig.dateFormat,
                  labelStyle:
                      _chartConfig.labelStyle ??
                      const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                  dateStyle:
                      _chartConfig.dateStyle ??
                      const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                  descriptionStyle:
                      _chartConfig.descriptionStyle ??
                      const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                ),
                onPointTap: (data) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tapped: ${data.label}'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: AppColors.primary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
                onAnimationComplete: () {
                  if (_chartConfig.enableAnimation) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${_examples[_selectedExample].title} timeline rendered!',
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
          const SizedBox(height: 16),
          // Project info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _examples[_selectedExample].primaryColor.withValues(
                alpha: 0.1,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _examples[_selectedExample].primaryColor.withValues(
                  alpha: 0.3,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 18,
                  color: _examples[_selectedExample].primaryColor,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project: ${_examples[_selectedExample].title}',
                        style: TextStyle(
                          fontSize: 13,
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
                            fontSize: 11,
                            color: _examples[_selectedExample].primaryColor
                                .withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildDemoControls() {
    return Row(
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

  // Comprehensive customization panel for Gantt charts
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
                  pointColor:
                      _examples[_selectedExample]
                          .primaryColor, // Ensure point color is also updated
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
                        _chartKey = UniqueKey(); // Force chart refresh
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
                        _chartKey =
                            UniqueKey(); // Force chart refresh when point color changes
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
                        _chartKey = UniqueKey(); // Force chart refresh
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
            _chartKey =
                UniqueKey(); // Force chart refresh when background changes
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
                  'Configure your Gantt chart components',
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

  Widget _buildPropertySection(GanttPropertySection section) {
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
                    return GanttWidgets.buildPropertyRow(property, isLast);
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
      _selectedDateFormatIndex = 0;
      _chartConfig = GanttConfig(
        lineColor: _examples[_selectedExample].primaryColor,
        pointColor: _examples[_selectedExample].primaryColor,
      );
      _chartKey = UniqueKey();
    });
  }

  // Apply current config colors to the data
  List<GanttData> _getStyledData() {
    return _examples[_selectedExample].data.map((task) {
      return GanttData(
        startDate: task.startDate,
        endDate: task.endDate,
        label: task.label,
        description: task.description,
        color:
            _chartConfig
                .pointColor, // Use config point color instead of task color
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
