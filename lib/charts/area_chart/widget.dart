// lib/charts/area_chart/widget.dart
import 'package:flutter/material.dart';
import '../constants.dart';
import 'models.dart';

/// Extended chart widgets specifically for area chart documentation
extension AreaChartWidgets on ChartWidgets {
  // Area Chart Documentation Header
  static Widget buildAreaChartDocumentationHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
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
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.area_chart,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MaterialAreaChart',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Beautiful animated area charts for Flutter',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.area_chart,
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
                              'MaterialAreaChart',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              'Beautiful animated area charts for Flutter',
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
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'A highly customizable area chart widget that brings your data to life with smooth animations, '
                'gradient fills, and multiple series support. Perfect for comparing datasets, showing cumulative values, '
                'and creating visually striking data presentations.',
                style: TextStyle(
                  fontSize: isMobile ? 13 : 14,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Reusable UI components for chart documentation (shared between all chart types)
class ChartWidgets {
  // Area Chart Documentation Header (moved from extension to main class)
  static Widget buildAreaChartDocumentationHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
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
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.area_chart,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MaterialAreaChart',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Beautiful animated area charts for Flutter',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.area_chart,
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
                              'MaterialAreaChart',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              'Beautiful animated area charts for Flutter',
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
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'A highly customizable area chart widget that brings your data to life with smooth animations, '
                'gradient fills, and multiple series support. Perfect for comparing datasets, showing cumulative values, '
                'and creating visually striking data presentations.',
                style: TextStyle(
                  fontSize: isMobile ? 13 : 14,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Control Button for Demo
  static Widget buildControlButton(
    String label,
    IconData icon,
    VoidCallback onTap, {
    bool isActive = false,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 6 : 8,
              ),
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
                    size: isMobile ? 14 : 16,
                    color:
                        isActive ? AppColors.primary : AppColors.textSecondary,
                  ),
                  SizedBox(width: isMobile ? 4 : 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color:
                          isActive
                              ? AppColors.primary
                              : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
                Text(
                  value.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: isMobile ? 8 : 6,
                ),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: isMobile ? 16 : 12,
                ),
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.border,
                thumbColor: AppColors.primary,
              ),
              child: Slider(
                value: value,
                min: min,
                max: max,
                onChanged: onChanged,
              ),
            ),
          ],
        );
      },
    );
  }

  // Toggle Switch Widget
  static Widget buildToggle(
    String label,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;

        return Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 10 : 11,
                color: AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            Transform.scale(
              scale: isMobile ? 0.7 : 0.8,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        );
      },
    );
  }

  // Color Button Widget
  static Widget buildColorButton(
    Color color,
    Color selectedColor,
    ValueChanged<Color> onTap,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;
        final size = isMobile ? 20.0 : 24.0;

        final isSelected = color == selectedColor;
        return GestureDetector(
          onTap: () => onTap(color),
          child: Container(
            width: size,
            height: size,
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
                    ? Icon(
                      Icons.check,
                      size: isMobile ? 12 : 14,
                      color: Colors.white,
                    )
                    : null,
          ),
        );
      },
    );
  }

  // Animation Curve Dropdown
  static Widget buildAnimationCurveDropdown(
    List<CurveOption> curves,
    Curve selectedCurve,
    ValueChanged<Curve> onChanged,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Animation Curve',
              style: TextStyle(
                fontSize: isMobile ? 10 : 11,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 6 : 8,
                vertical: isMobile ? 3 : 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.border),
              ),
              child: DropdownButton<Curve>(
                value: selectedCurve,
                isExpanded: true,
                underline: const SizedBox(),
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11,
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
      },
    );
  }

  // Animation Preview Button
  static Widget buildAnimationPreviewButton(VoidCallback onTap) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 10 : 12,
                vertical: isMobile ? 6 : 8,
              ),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: isMobile ? 14 : 16,
                    color: Colors.white,
                  ),
                  SizedBox(width: isMobile ? 4 : 6),
                  Text(
                    'Preview Animation',
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Background Color Picker
  static Widget buildBackgroundColorPicker(
    Color selectedColor,
    ValueChanged<Color> onChanged,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;
        final size = isMobile ? 20.0 : 24.0;

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
            Text(
              'Background',
              style: TextStyle(
                fontSize: isMobile ? 10 : 11,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: isMobile ? 4 : 6,
              children:
                  backgroundColors.map((color) {
                    final isSelected = color == selectedColor;
                    return GestureDetector(
                      onTap: () => onChanged(color),
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color:
                              color == Colors.transparent
                                  ? Colors.white
                                  : color,
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
                                ? Icon(
                                  Icons.block,
                                  size: isMobile ? 10 : 12,
                                  color: Colors.red,
                                )
                                : isSelected
                                ? Icon(
                                  Icons.check,
                                  size: isMobile ? 12 : 14,
                                  color: Colors.white,
                                )
                                : null,
                      ),
                    );
                  }).toList(),
            ),
          ],
        );
      },
    );
  }

  // Panel Section Widget
  static Widget buildPanelSection(String title, List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 11 : 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.border.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ],
        );
      },
    );
  }

  // Code Block Widget
  static Widget buildCodeBlock(String title, String code) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 12 : 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.border.withValues(alpha: 0.3),
                ),
              ),
              child: SelectableText(
                code,
                style: TextStyle(
                  fontSize: isMobile ? 10 : 12,
                  fontFamily: 'monospace',
                  color: const Color(0xFFD4D4D4),
                  height: 1.5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Property Row Widget
  static Widget buildPropertyRow(PropertyInfo property, bool isLast) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
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
          child:
              isMobile
                  ? Column(
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
                                borderRadius: BorderRadius.circular(3),
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
                      const SizedBox(height: 6),
                      Text(
                        property.description,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  )
                  : Row(
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
      },
    );
  }
}
