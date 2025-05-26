import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import '../material_charts/material_charts.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      BarChartData(value: 95, label: 'Q1', color: AppColors.chartPalette[0]),
      BarChartData(value: 128, label: 'Q2', color: AppColors.chartPalette[1]),
      BarChartData(value: 115, label: 'Q3', color: AppColors.chartPalette[2]),
      BarChartData(value: 152, label: 'Q4', color: AppColors.chartPalette[3]),
      BarChartData(value: 135, label: 'Q5', color: AppColors.chartPalette[4]),
    ];

    return MaterialBarChart(
      data: data,
      width: 700,
      height: 400,
      style: BarChartStyle(
        backgroundColor: Colors.transparent,
        gridColor: AppColors.border,
        cornerRadius: 16,
        barSpacing: 0.3,
        gradientEffect: true,
        gradientColors: [AppColors.primary, AppColors.lightTeal],
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        valueStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
