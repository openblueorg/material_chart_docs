// widgets/semicircle_widgets.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import 'models.dart';

/// Reusable UI components for semicircle chart documentation
class SemicircleWidgets {
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
                  Icons.donut_large,
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
                      'MaterialChartHollowSemiCircle',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Beautiful semicircle charts for progress tracking',
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
            'A powerful semicircle chart widget perfect for displaying progress, completion rates, and percentage data. '
            'Features smooth animations, customizable styling, interactive legends, and flexible formatting options. '
            'Ideal for dashboards, progress indicators, and data visualization applications.',
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

  // Example Selector Widget for Semicircle Examples
  static Widget buildExampleSelector(
    List<SemicircleExample> examples,
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
                    // Percentage badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: example.activeColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${example.percentage.toInt()}%',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: example.activeColor,
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

  // Slider Control Widget
  static Widget buildSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    // Ensure value is always within bounds
    final clampedValue = value.clamp(min, max);

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
              clampedValue == clampedValue.toInt()
                  ? clampedValue.toInt().toString()
                  : clampedValue.toStringAsFixed(2),
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
            value: clampedValue, // Use clamped value
            min: min,
            max: max,
            onChanged:
                (newValue) =>
                    onChanged(newValue.clamp(min, max)), // Clamp output too
          ),
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
    List<SemicircleCurveOption> curves,
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
            max: 4000,
            divisions: 14,
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

  // Code Block Widget with syntax highlighting
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

  // Property Row Widget for semicircle properties
  static Widget buildPropertyRow(SemicirclePropertyInfo property, bool isLast) {
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
                if (property.defaultValue != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Default: ${property.defaultValue}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
                if (property.example != null) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      property.example!,
                      style: const TextStyle(
                        fontSize: 11,
                        fontFamily: 'monospace',
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Special widget for progress-specific features
  static Widget buildProgressFeatures() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.accent.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.donut_large, size: 16, color: AppColors.primary),
              const SizedBox(width: 8),
              const Text(
                'Progress Tracking Features',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '• Animated percentage display with custom formatters\n'
            '• Interactive legend with active/inactive sections\n'
            '• Customizable hollow radius for different styles\n'
            '• Progress completion callbacks\n'
            '• Responsive sizing and accessibility support',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // Progress Status Widget
  static Widget buildProgressStatus(double percentage) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    if (percentage >= 80) {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle;
      statusText = 'Excellent Progress';
    } else if (percentage >= 60) {
      statusColor = Colors.orange;
      statusIcon = Icons.trending_up;
      statusText = 'Good Progress';
    } else if (percentage >= 40) {
      statusColor = Colors.amber;
      statusIcon = Icons.schedule;
      statusText = 'Fair Progress';
    } else {
      statusColor = Colors.red;
      statusIcon = Icons.warning;
      statusText = 'Needs Attention';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusIcon, size: 14, color: statusColor),
          const SizedBox(width: 6),
          Text(
            statusText,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
