import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import '../material_charts/material_charts.dart';

class MultiLineChartWidget extends StatelessWidget {
  const MultiLineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final series = [
      ChartSeries(
        name: 'Revenue',
        dataPoints: [
          const ChartDataPoint(value: 32, label: 'Jan'),
          const ChartDataPoint(value: 48, label: 'Feb'),
          const ChartDataPoint(value: 42, label: 'Mar'),
          const ChartDataPoint(value: 65, label: 'Apr'),
          const ChartDataPoint(value: 58, label: 'May'),
          const ChartDataPoint(value: 78, label: 'Jun'),
        ],
        color: AppColors.chartPalette[0],
        lineWidth: 4,
        pointSize: 8,
      ),
      ChartSeries(
        name: 'Profit',
        dataPoints: [
          const ChartDataPoint(value: 22, label: 'Jan'),
          const ChartDataPoint(value: 35, label: 'Feb'),
          const ChartDataPoint(value: 28, label: 'Mar'),
          const ChartDataPoint(value: 48, label: 'Apr'),
          const ChartDataPoint(value: 38, label: 'May'),
          const ChartDataPoint(value: 58, label: 'Jun'),
        ],
        color: AppColors.chartPalette[1],
        lineWidth: 4,
        pointSize: 8,
      ),
      ChartSeries(
        name: 'Growth',
        dataPoints: [
          const ChartDataPoint(value: 18, label: 'Jan'),
          const ChartDataPoint(value: 28, label: 'Feb'),
          const ChartDataPoint(value: 25, label: 'Mar'),
          const ChartDataPoint(value: 38, label: 'Apr'),
          const ChartDataPoint(value: 32, label: 'May'),
          const ChartDataPoint(value: 45, label: 'Jun'),
        ],
        color: AppColors.chartPalette[2],
        lineWidth: 4,
        pointSize: 8,
      ),
    ];

    return MultiLineChart(
      series: series,
      width: 700,
      height: 400,
      style: MultiLineChartStyle(
        colors: AppColors.chartPalette,
        backgroundColor: Colors.transparent,
        gridColor: AppColors.border,
        showPoints: true,
        showLegend: true,
        defaultLineWidth: 4,
        defaultPointSize: 8,
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        legendStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
