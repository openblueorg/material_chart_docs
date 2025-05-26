import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import '../material_charts/material_charts.dart';

class AreaChartWidget extends StatelessWidget {
  const AreaChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final series = [
      AreaChartSeries(
        name: 'Revenue Growth',
        dataPoints: [
          const AreaChartData(value: 28, label: 'Jan'),
          const AreaChartData(value: 45, label: 'Feb'),
          const AreaChartData(value: 38, label: 'Mar'),
          const AreaChartData(value: 62, label: 'Apr'),
          const AreaChartData(value: 55, label: 'May'),
          const AreaChartData(value: 78, label: 'Jun'),
          const AreaChartData(value: 68, label: 'Jul'),
          const AreaChartData(value: 85, label: 'Aug'),
        ],
        color: AppColors.primary,
        gradientColor: AppColors.primary.withOpacity(0.2),
        lineWidth: 4,
        pointSize: 8,
      ),
    ];

    return MaterialAreaChart(
      series: series,
      width: 700,
      height: 400,
      style: AreaChartStyle(
        colors: AppColors.chartPalette,
        backgroundColor: Colors.transparent,
        gridColor: AppColors.border,
        showPoints: true,
        defaultPointSize: 8,
        defaultLineWidth: 4,
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
