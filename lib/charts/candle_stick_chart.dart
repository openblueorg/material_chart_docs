import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import '../material_charts/material_charts.dart';

class CandlestickChartWidget extends StatelessWidget {
  const CandlestickChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = List.generate(28, (index) {
      final date = DateTime.now().subtract(Duration(days: 27 - index));
      final open = 100 + (index * 1.8) + (index % 5 - 2) * 4;
      final close = open + (index % 3 == 0 ? 6 : -3) + (index % 2 * 3);
      final high =
          [open, close].reduce((a, b) => a > b ? a : b) + 3 + (index % 4);
      final low =
          [open, close].reduce((a, b) => a < b ? a : b) - 2 - (index % 3);

      return CandlestickData(
        date: date,
        open: open.toDouble(),
        high: high.toDouble(),
        low: low.toDouble(),
        close: close.toDouble(),
      );
    });

    return MaterialCandlestickChart(
      data: data,
      width: 700,
      height: 400,
      style: CandlestickStyle(
        bullishColor: AppColors.primary,
        bearishColor: AppColors.accent,
        candleWidth: 12,
        wickWidth: 3,
        spacing: 0.2,
        tooltipStyle: TooltipStyle(
          backgroundColor: AppColors.darkTeal,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          borderRadius: 12,
        ),
      ),
      backgroundColor: Colors.transparent,
      axisConfig: ChartAxisConfig(
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
