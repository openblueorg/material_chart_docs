import 'package:flutter/material.dart';

import 'main copy.dart';
import 'material_charts/material_charts.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(const MaterialChartsDemo());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const LineChartDemo(),
    );
  }
}

class LineChartDemo extends StatelessWidget {
  const LineChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const SizedBox(
          width: 1000,
          height: 400,
          child: MaterialChartLine(
            showPoints: false,

            data: [
              ChartData(value: 10, label: '1'),
              ChartData(value: 50, label: '2'),
              ChartData(value: 70, label: '3'),
              ChartData(value: 20, label: '4'),
              ChartData(value: 30, label: '5'),
              ChartData(value: 40, label: '6'),
              ChartData(value: 70, label: '7'),
              ChartData(value: 120, label: '8'),
              ChartData(value: 90, label: '9'),
              ChartData(value: 100, label: '10'),
            ],
            width: 300,
            height: 300,
            style: LineChartStyle(
              verticalLineOpacity: 0.2,
              showTooltips: true,
              useCurvedLines: true, // Enable curved lines
              curveIntensity: 0.1, // Moderate curve intensity
              roundedPoints: true, // Rounded line caps
              tooltipStyle: TooltipStyle(
                backgroundColor: Color.fromARGB(255, 161, 66, 66),
                borderColor: Colors.blue,
                borderRadius: 8.0,
                textStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
