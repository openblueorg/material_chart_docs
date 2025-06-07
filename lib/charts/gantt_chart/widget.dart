// widgets/gantt_widgets.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import 'models.dart';

/// Reusable UI components for Gantt chart documentation with responsive design
class GanttWidgets {
  // Documentation Header Widget with responsive design
  static Widget buildDocumentationHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet =
            constraints.maxWidth >= 768 && constraints.maxWidth < 1200;

        return Container(
          padding: EdgeInsets.all(
            isMobile
                ? 16
                : isTablet
                ? 20
                : 24,
          ),
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
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(isMobile ? 10 : 12),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.timeline,
                      color: Colors.white,
                      size: isMobile ? 20 : 24,
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 16, height: isMobile ? 12 : 0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MaterialGanttChart',
                          style: TextStyle(
                            fontSize:
                                isMobile
                                    ? 24
                                    : isTablet
                                    ? 26
                                    : 28,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'Professional project timeline visualization',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
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
                'A comprehensive Gantt chart widget for project management and timeline visualization. Display tasks with '
                'start/end dates, interactive features, customizable styling, and task relationship connections. Perfect for '
                'project planning, scheduling, milestone tracking, and timeline management applications.',
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

  // Control Button with responsive sizing
  static Widget buildControlButton(
    String label,
    IconData icon,
    VoidCallback onTap, {
    bool isActive = false,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 10 : 8,
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
                    size: isMobile ? 18 : 16,
                    color:
                        isActive ? AppColors.primary : AppColors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 12,
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

  // Example Selector with responsive layout
  static Widget buildExampleSelector(
    List<GanttExample> examples,
    int selectedIndex,
    Function(int) onSelect,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 400;

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
                    padding: EdgeInsets.all(isMobile ? 10 : 12),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? AppColors.primary.withValues(alpha: 0.1)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            isSelected
                                ? AppColors.primary
                                : AppColors.border.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Project timeline preview
                        Container(
                          width: isMobile ? 20 : 24,
                          height: isMobile ? 14 : 16,
                          decoration: BoxDecoration(
                            color: example.primaryColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: example.primaryColor.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: example.primaryColor,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 1),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: example.primaryColor.withValues(
                                      alpha: 0.7,
                                    ),
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: isMobile ? 8 : 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      example.title,
                                      style: TextStyle(
                                        fontSize: isMobile ? 11 : 12,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            isSelected
                                                ? AppColors.primary
                                                : AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 4 : 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: example.primaryColor.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      example.category.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: isMobile ? 7 : 8,
                                        fontWeight: FontWeight.w700,
                                        color: example.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                example.description,
                                style: TextStyle(
                                  fontSize: isMobile ? 9 : 10,
                                  color:
                                      isSelected
                                          ? AppColors.primary.withValues(
                                            alpha: 0.8,
                                          )
                                          : AppColors.textSecondary,
                                ),
                                maxLines: isMobile ? 2 : null,
                                overflow:
                                    isMobile ? TextOverflow.ellipsis : null,
                              ),
                              if (example.metadata != null && !isMobile) ...[
                                const SizedBox(height: 2),
                                Text(
                                  '${example.data.length} tasks • ${example.metadata!.values.first}',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color:
                                        isSelected
                                            ? AppColors.primary.withValues(
                                              alpha: 0.6,
                                            )
                                            : AppColors.textSecondary
                                                .withValues(alpha: 0.8),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }

  // Responsive Slider Control
  static Widget buildSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Text(
                  value == value.toInt()
                      ? value.toInt().toString()
                      : value.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 6 : 4),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: isMobile ? 3 : 2,
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

  // Responsive Toggle Switch
  static Widget buildToggle(
    String label,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;

        return Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            Transform.scale(
              scale: isMobile ? 0.9 : 0.8,
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

  // Responsive Color Button
  static Widget buildColorButton(
    Color color,
    Color selectedColor,
    ValueChanged<Color> onTap,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;
        final size = isMobile ? 28.0 : 24.0;

        final isSelected = color == selectedColor;
        return GestureDetector(
          onTap: () => onTap(color),
          child: Container(
            width: size,
            height: size,
            margin: const EdgeInsets.all(2),
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
                      size: isMobile ? 16 : 14,
                      color: Colors.white,
                    )
                    : null,
          ),
        );
      },
    );
  }

  // Responsive Animation Curve Dropdown
  static Widget buildAnimationCurveDropdown(
    List<GanttCurveOption> curves,
    Curve selectedCurve,
    ValueChanged<Curve> onChanged,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;

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
            SizedBox(height: isMobile ? 6 : 4),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 10 : 8,
                vertical: isMobile ? 6 : 4,
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

  // Responsive Animation Duration Slider
  static Widget buildAnimationDurationSlider(
    Duration duration,
    ValueChanged<Duration> onChanged,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;
        final milliseconds = duration.inMilliseconds.toDouble();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Animation Duration',
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Text(
                  '${milliseconds.round()}ms',
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 6 : 4),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: isMobile ? 3 : 2,
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
      },
    );
  }

  // Responsive Animation Preview Button
  static Widget buildAnimationPreviewButton(VoidCallback onTap) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 12,
                vertical: isMobile ? 12 : 8,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: isMobile ? 18 : 16,
                    color: Colors.white,
                  ),
                  SizedBox(width: isMobile ? 8 : 6),
                  Text(
                    'Preview Animation',
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 11,
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

  // Responsive Panel Section
  static Widget buildPanelSection(String title, List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = MediaQuery.of(context).size.width < 768;

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
            SizedBox(height: isMobile ? 6 : 8),
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

  // Responsive Code Block
  static Widget buildCodeBlock(String title, String code) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                if (isMobile)
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: code));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Code copied!'),
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                    icon: Icon(Icons.copy, size: 18, color: AppColors.primary),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
            ),
          ],
        );
      },
    );
  }

  // Responsive Property Row
  static Widget buildPropertyRow(GanttPropertyInfo property, bool isLast) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isSmallMobile = constraints.maxWidth < 400;

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
              isSmallMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPropertyHeader(property, isMobile),
                      const SizedBox(height: 8),
                      _buildPropertyDescription(property, isMobile),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: isMobile ? 3 : 2,
                        child: _buildPropertyHeader(property, isMobile),
                      ),
                      SizedBox(width: isMobile ? 12 : 16),
                      Expanded(
                        flex: isMobile ? 4 : 3,
                        child: _buildPropertyDescription(property, isMobile),
                      ),
                    ],
                  ),
        );
      },
    );
  }

  static Widget _buildPropertyHeader(
    GanttPropertyInfo property,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                property.name,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            if (property.required) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
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
          style: TextStyle(
            fontSize: isMobile ? 10 : 11,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
            fontFamily: 'monospace',
          ),
        ),
        if (property.defaultValue != null) ...[
          const SizedBox(height: 2),
          Text(
            'Default: ${property.defaultValue}',
            style: TextStyle(
              fontSize: isMobile ? 9 : 10,
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }

  static Widget _buildPropertyDescription(
    GanttPropertyInfo property,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          property.description,
          style: TextStyle(
            fontSize: isMobile ? 12 : 13,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
        if (property.example != null) ...[
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              property.example!,
              style: TextStyle(
                fontSize: isMobile ? 10 : 11,
                fontFamily: 'monospace',
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ],
    );
  }

  // Project management features with responsive design
  static Widget buildProjectFeatures() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
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
                  Icon(
                    Icons.timeline,
                    size: isMobile ? 14 : 16,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: isMobile ? 6 : 8),
                  Expanded(
                    child: Text(
                      'Project Management Features',
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 6 : 8),
              Text(
                '• Interactive task timeline with hover and tap support\n'
                '• Task dependency visualization with connection lines\n'
                '• Customizable project phases and milestones\n'
                '• Flexible date formatting and timeline scaling\n'
                '• Animated rendering with progress tracking\n'
                '• Real-time updates and dynamic task management',
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Responsive Timeline Progress Indicator
  static Widget buildTimelineProgress(double progress) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          padding: EdgeInsets.all(isMobile ? 10 : 12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: isMobile ? 12 : 14,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: isMobile ? 4 : 6),
                  Expanded(
                    child: Text(
                      'Timeline Progress',
                      style: TextStyle(
                        fontSize: isMobile ? 10 : 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 6 : 8),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.border.withValues(alpha: 0.3),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: isMobile ? 3 : 4,
              ),
            ],
          ),
        );
      },
    );
  }

  // Responsive Task Status Badge
  static Widget buildTaskStatusBadge(String status, Color color) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 6 : 8,
            vertical: isMobile ? 3 : 4,
          ),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: isMobile ? 5 : 6,
                height: isMobile ? 5 : 6,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              SizedBox(width: isMobile ? 4 : 6),
              Text(
                status,
                style: TextStyle(
                  fontSize: isMobile ? 9 : 10,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Responsive Category Icon
  static Widget buildCategoryIcon(String category) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        IconData icon;
        Color color;

        switch (category.toLowerCase()) {
          case 'development':
            icon = Icons.code;
            color = Colors.blue;
            break;
          case 'events':
            icon = Icons.event;
            color = Colors.purple;
            break;
          case 'marketing':
            icon = Icons.campaign;
            color = Colors.orange;
            break;
          case 'construction':
            icon = Icons.construction;
            color = Colors.brown;
            break;
          case 'research':
            icon = Icons.science;
            color = Colors.teal;
            break;
          default:
            icon = Icons.work;
            color = Colors.grey;
        }

        return Container(
          padding: EdgeInsets.all(isMobile ? 4 : 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: isMobile ? 12 : 14, color: color),
        );
      },
    );
  }

  // Responsive Gantt Chart Legend
  static Widget buildGanttLegend() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          padding: EdgeInsets.all(isMobile ? 10 : 12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chart Legend',
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: isMobile ? 6 : 8),
              _buildLegendItem(
                Icons.remove,
                'Task Timeline',
                'Duration of project tasks',
                AppColors.primary,
                isMobile,
              ),
              const SizedBox(height: 4),
              _buildLegendItem(
                Icons.circle,
                'Milestones',
                'Key project points',
                AppColors.accent,
                isMobile,
              ),
              const SizedBox(height: 4),
              _buildLegendItem(
                Icons.timeline,
                'Dependencies',
                'Task relationships',
                AppColors.border,
                isMobile,
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildLegendItem(
    IconData icon,
    String title,
    String description,
    Color color,
    bool isMobile,
  ) {
    return Row(
      children: [
        Icon(icon, size: isMobile ? 10 : 12, color: color),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 9 : 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: isMobile ? 8 : 9,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
