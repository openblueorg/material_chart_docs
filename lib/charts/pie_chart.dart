import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import '../material_charts/material_charts.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PieChartData(
        value: 32,
        label: 'Desktop',
        color: AppColors.chartPalette[0],
      ),
      PieChartData(
        value: 28,
        label: 'Mobile',
        color: AppColors.chartPalette[1],
      ),
      PieChartData(
        value: 22,
        label: 'Tablet',
        color: AppColors.chartPalette[2],
      ),
      PieChartData(
        value: 12,
        label: 'Smart TV',
        color: AppColors.chartPalette[3],
      ),
      PieChartData(value: 6, label: 'Other', color: AppColors.chartPalette[4]),
    ];

    return MaterialPieChart(
      data: data,
      width: 550,
      height: 400,
      style: PieChartStyle(
        backgroundColor: Colors.transparent,
        showLegend: true,
        legendPosition: PieChartLegendPosition.right,
        labelPosition: LabelPosition.outside,
        labelStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        valueStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
        connectorLineColor: AppColors.border,
        connectorLineStrokeWidth: 2,
      ),
    );
  }
}