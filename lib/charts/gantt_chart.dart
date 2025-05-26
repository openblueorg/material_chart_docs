import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../material_charts/material_charts.dart';

class GanttChartWidget extends StatelessWidget {
  const GanttChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      GanttData(
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 32)),
        label: 'Project Planning',
        description: 'Initial project setup and planning phase',
        color: AppColors.chartPalette[0],
        icon: Icons.settings_outlined,
      ),
      GanttData(
        startDate: DateTime.now().add(const Duration(days: 24)),
        endDate: DateTime.now().add(const Duration(days: 68)),
        label: 'Development Sprint',
        description: 'Core development and implementation',
        color: AppColors.chartPalette[1],
        icon: Icons.code_outlined,
      ),
      GanttData(
        startDate: DateTime.now().add(const Duration(days: 54)),
        endDate: DateTime.now().add(const Duration(days: 82)),
        label: 'Quality Assurance',
        description: 'Testing and quality assurance phase',
        color: AppColors.chartPalette[2],
        icon: Icons.verified_outlined,
      ),
      GanttData(
        startDate: DateTime.now().add(const Duration(days: 76)),
        endDate: DateTime.now().add(const Duration(days: 96)),
        label: 'Production Launch',
        description: 'Production deployment and launch',
        color: AppColors.chartPalette[3],
        icon: Icons.rocket_launch_outlined,
      ),
    ];

    return MaterialGanttChart(
      data: data,
      width: 800,
      height: 420,
      style: GanttChartStyle(
        lineColor: AppColors.primary,
        pointColor: AppColors.accent,
        connectionLineColor: AppColors.border,
        backgroundColor: Colors.transparent,
        showConnections: true,
        dateFormat: DateFormat('MMM dd'),
        labelStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
        ),
        dateStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        lineWidth: 6,
        pointRadius: 8,
        verticalSpacing: 90,
        connectionLineWidth: 2,
      ),
    );
  }
}
