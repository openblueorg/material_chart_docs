import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import '../material_charts/material_charts.dart';

class StackedBarChartWidget extends StatelessWidget {
  const StackedBarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      StackedBarData(
        label: 'Q1',
        segments: [
          StackedBarSegment(
            value: 42,
            color: AppColors.chartPalette[0],
            label: 'Product A',
          ),
          StackedBarSegment(
            value: 32,
            color: AppColors.chartPalette[1],
            label: 'Product B',
          ),
          StackedBarSegment(
            value: 25,
            color: AppColors.chartPalette[2],
            label: 'Product C',
          ),
        ],
      ),
      StackedBarData(
        label: 'Q2',
        segments: [
          StackedBarSegment(
            value: 48,
            color: AppColors.chartPalette[0],
            label: 'Product A',
          ),
          StackedBarSegment(
            value: 38,
            color: AppColors.chartPalette[1],
            label: 'Product B',
          ),
          StackedBarSegment(
            value: 28,
            color: AppColors.chartPalette[2],
            label: 'Product C',
          ),
        ],
      ),
      StackedBarData(
        label: 'Q3',
        segments: [
          StackedBarSegment(
            value: 45,
            color: AppColors.chartPalette[0],
            label: 'Product A',
          ),
          StackedBarSegment(
            value: 35,
            color: AppColors.chartPalette[1],
            label: 'Product B',
          ),
          StackedBarSegment(
            value: 32,
            color: AppColors.chartPalette[2],
            label: 'Product C',
          ),
        ],
      ),
      StackedBarData(
        label: 'Q4',
        segments: [
          StackedBarSegment(
            value: 52,
            color: AppColors.chartPalette[0],
            label: 'Product A',
          ),
          StackedBarSegment(
            value: 42,
            color: AppColors.chartPalette[1],
            label: 'Product B',
          ),
          StackedBarSegment(
            value: 35,
            color: AppColors.chartPalette[2],
            label: 'Product C',
          ),
        ],
      ),
    ];

    return MaterialStackedBarChart(
      data: data,
      width: 700,
      height: 400,
      style: StackedBarChartStyle(
        backgroundColor: Colors.transparent,
        gridColor: AppColors.border,
        cornerRadius: 16,
        barSpacing: 0.35,
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        valueStyle: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
