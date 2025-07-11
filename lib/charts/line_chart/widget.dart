// widgets/chart_widgets.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_test_01/material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';

/// Reusable UI components for chart documentation
class ChartWidgets {
  // Documentation Header Widget
  static Widget buildDocumentationHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.accent.withValues(alpha: 0.05),
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
                      'Beautiful animated line charts with tooltips & curved lines',
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
            'A highly customizable line chart widget featuring smooth curved lines, interactive tooltips, '
            'elegant animations, and responsive hover effects. Perfect for dashboards, analytics, and data visualization.',
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

  // Control Button for Demo
  static Widget buildControlButton(
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
                    ? AppColors.primary.withValues(alpha: 0.1)
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

  // Example Selector Widget
  static Widget buildExampleSelector(
    List<ChartExample> examples,
    int selectedIndex,
    Function(int) onSelect,
  ) {
    return Column(
      children:
          examples.asMap().entries.map((entry) {
            final index = entry.key;
            final example = entry.value;
            final isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => onSelect(index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
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
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: example.color,
                        shape: BoxShape.circle,
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
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            example.description,
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
            );
          }).toList(),
    );
  }

  // Slider Control Widget
  static Widget buildSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            Text(
              value.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 2,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.border,
            thumbColor: AppColors.primary,
          ),
          child: Slider(value: value, min: min, max: max, onChanged: onChanged),
        ),
      ],
    );
  }

  // Toggle Switch Widget
  static Widget buildToggle(
    String label,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }

  // Color Button Widget
  static Widget buildColorButton(
    Color color,
    Color selectedColor,
    ValueChanged<Color> onTap,
  ) {
    final isSelected = color == selectedColor;
    return GestureDetector(
      onTap: () => onTap(color),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.textPrimary : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: color.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child:
            isSelected
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
      ),
    );
  }

  // Animation Curve Dropdown
  static Widget buildAnimationCurveDropdown(
    List<CurveOption> curves,
    Curve selectedCurve,
    ValueChanged<Curve> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Animation Curve',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.border),
          ),
          child: DropdownButton<Curve>(
            value: selectedCurve,
            isExpanded: true,
            underline: const SizedBox(),
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            items:
                curves.map((curveOption) {
                  return DropdownMenuItem<Curve>(
                    value: curveOption.curve,
                    child: Text(curveOption.name),
                  );
                }).toList(),
            onChanged: (curve) {
              if (curve != null) onChanged(curve);
            },
          ),
        ),
      ],
    );
  }

  // NEW: Line Style Dropdown
  static Widget buildLineStyleDropdown(
    List<LineStyleOption> styles,
    LineStyle selectedStyle,
    ValueChanged<LineStyle> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hover Line Style',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.border),
          ),
          child: DropdownButton<LineStyle>(
            value: selectedStyle,
            isExpanded: true,
            underline: const SizedBox(),
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            items:
                styles.map((styleOption) {
                  return DropdownMenuItem<LineStyle>(
                    value: styleOption.style,
                    child: Text(styleOption.name),
                  );
                }).toList(),
            onChanged: (style) {
              if (style != null) onChanged(style);
            },
          ),
        ),
      ],
    );
  }

  // Animation Duration Slider
  static Widget buildAnimationDurationSlider(
    Duration duration,
    ValueChanged<Duration> onChanged,
  ) {
    final milliseconds = duration.inMilliseconds.toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Animation Duration',
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
            const Spacer(),
            Text(
              '${milliseconds.round()}ms',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 2,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.border,
            thumbColor: AppColors.primary,
          ),
          child: Slider(
            value: milliseconds,
            min: 500,
            max: 5000,
            divisions: 18,
            onChanged: (value) {
              onChanged(Duration(milliseconds: value.round()));
            },
          ),
        ),
      ],
    );
  }

  // Animation Preview Button
  static Widget buildAnimationPreviewButton(VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.play_arrow, size: 16, color: Colors.white),
              SizedBox(width: 6),
              Text(
                'Preview Animation',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Background Color Picker
  static Widget buildBackgroundColorPicker(
    Color selectedColor,
    ValueChanged<Color> onChanged,
  ) {
    final backgroundColors = [
      Colors.transparent,
      Colors.white,
      const Color(0xFFF8F9FA),
      const Color(0xFFF1F3F4),
      const Color(0xFFE8F0FE),
      const Color(0xFFFFF3E0),
      const Color(0xFFE8F5E8),
      const Color(0xFFFCE4EC),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Background',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          children:
              backgroundColors.map((color) {
                final isSelected = color == selectedColor;
                return GestureDetector(
                  onTap: () => onChanged(color),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: color == Colors.transparent ? Colors.white : color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            isSelected
                                ? AppColors.textPrimary
                                : AppColors.border,
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
                            ? const Icon(
                              Icons.block,
                              size: 12,
                              color: Colors.red,
                            )
                            : isSelected
                            ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                            : null,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  // NEW: Curved Lines Controls Section
  static Widget buildCurvedLinesSection(
    bool useCurvedLines,
    double curveIntensity,
    bool roundedPoints,
    Function(bool) onUseCurvedLinesChanged,
    Function(double) onCurveIntensityChanged,
    Function(bool) onRoundedPointsChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildToggle('Curved Lines', useCurvedLines, onUseCurvedLinesChanged),
        if (useCurvedLines) ...[
          const SizedBox(height: 16),
          buildSlider(
            'Curve Intensity',
            curveIntensity,
            0.0,
            1.0,
            onCurveIntensityChanged,
          ),
        ],
        const SizedBox(height: 16),
        buildToggle('Rounded Points', roundedPoints, onRoundedPointsChanged),
      ],
    );
  }

  // NEW: Tooltips Controls Section
  static Widget buildTooltipsSection(
    bool showTooltips,
    Color tooltipBackgroundColor,
    Color tooltipBorderColor,
    double tooltipBorderRadius,
    Color verticalLineColor,
    double verticalLineWidth,
    LineStyle verticalLineStyle,
    double verticalLineOpacity,
    Function(bool) onShowTooltipsChanged,
    Function(Color) onTooltipBackgroundColorChanged,
    Function(Color) onTooltipBorderColorChanged,
    Function(double) onTooltipBorderRadiusChanged,
    Function(Color) onVerticalLineColorChanged,
    Function(double) onVerticalLineWidthChanged,
    Function(LineStyle) onVerticalLineStyleChanged,
    Function(double) onVerticalLineOpacityChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildToggle('Show Tooltips', showTooltips, onShowTooltipsChanged),
        if (showTooltips) ...[
          const SizedBox(height: 16),
          const Text(
            'Tooltip Colors',
            style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Background:', style: TextStyle(fontSize: 10)),
              const SizedBox(width: 8),
              buildColorButton(
                tooltipBackgroundColor,
                tooltipBackgroundColor,
                onTooltipBackgroundColorChanged,
              ),
              const SizedBox(width: 16),
              const Text('Border:', style: TextStyle(fontSize: 10)),
              const SizedBox(width: 8),
              buildColorButton(
                tooltipBorderColor,
                tooltipBorderColor,
                onTooltipBorderColorChanged,
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSlider(
            'Border Radius',
            tooltipBorderRadius,
            0.0,
            20.0,
            onTooltipBorderRadiusChanged,
          ),
          const SizedBox(height: 16),
          const Text(
            'Hover Line',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          buildLineStyleDropdown(
            [
              LineStyleOption(name: 'Solid', style: LineStyle.solid),
              LineStyleOption(name: 'Dashed', style: LineStyle.dashed),
              LineStyleOption(name: 'Dotted', style: LineStyle.dotted),
            ],
            verticalLineStyle,
            onVerticalLineStyleChanged,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: buildSlider(
                  'Line Width',
                  verticalLineWidth,
                  0.5,
                  5.0,
                  onVerticalLineWidthChanged,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: buildSlider(
                  'Opacity',
                  verticalLineOpacity,
                  0.1,
                  1.0,
                  onVerticalLineOpacityChanged,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  // Panel Section Widget
  static Widget buildPanelSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }

  // Code Block Widget
  static Widget buildCodeBlock(String title, String code) {
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
            border: Border.all(color: AppColors.border.withValues(alpha: 0.3)),
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

  // Property Row Widget
  static Widget buildPropertyRow(PropertyInfo property, bool isLast) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      property.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    if (property.required) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
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
                  property.type,
                  style: const TextStyle(
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
          Expanded(
            flex: 3,
            child: Text(
              property.description,
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
}
