import 'package:chat_test_01/charts/constants.dart';
import 'package:flutter/material.dart';
import '../material_charts/material_charts.dart';

class SemicircleChartWidget extends StatelessWidget {
  const SemicircleChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [AppColors.primary.withOpacity(0.1), Colors.transparent],
              radius: 1.5,
            ),
            borderRadius: BorderRadius.circular(200),
          ),
          child: MaterialChartHollowSemiCircle(
            percentage: 84,
            size: 280,
            hollowRadius: 0.65,
            style: ChartStyle(
              activeColor: AppColors.primary,
              inactiveColor: AppColors.border,
              showPercentageText: true,
              showLegend: true,
              percentageStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
                letterSpacing: -1,
              ),
              legendStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.trending_up, size: 18, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Project completion is ahead of schedule',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
