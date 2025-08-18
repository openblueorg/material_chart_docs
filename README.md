# Material Charts for Flutter

A lightweight, performant Flutter library for creating beautiful, interactive charts with Material Design principles. Built with clean architecture and developer-friendly APIs.

## Features

- 🎨 **Material Design**: Beautiful, modern UI components
- 📊 **Multiple Chart Types**: Bar charts, line charts, pie charts, area charts, and more
- 🔄 **Smooth Animations**: Built-in animations with customizable curves
- 🎯 **Interactive**: Hover effects and touch interactions
- 🎨 **Customizable**: Extensive styling options
- 📱 **Responsive**: Works across all Flutter platforms
- ⚡ **Lightweight**: Minimal bundle size, no unnecessary dependencies
- 🔧 **Flexible**: Multiple ways to create charts based on your needs

## Quick Start

### Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  material_charts: ^latest_version
```

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:material_charts/material_charts.dart';

class MyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialBarChart(
      data: [
        BarChartData(value: 45, label: 'Jan'),
        BarChartData(value: 78, label: 'Feb'),
        BarChartData(value: 32, label: 'Mar'),
      ],
      width: 400,
      height: 300,
    );
  }
}
```

## Chart Creation Methods

### 1. Traditional API (Recommended)

The most straightforward approach with full type safety:

```dart
MaterialBarChart(
  data: [
    BarChartData(value: 45, label: 'Jan', color: Colors.blue),
    BarChartData(value: 78, label: 'Feb', color: Colors.green),
    BarChartData(value: 32, label: 'Mar', color: Colors.orange),
  ],
  width: 800,
  height: 400,
  style: BarChartStyle(
    barColor: Colors.blue,
    gridColor: Colors.grey.shade300,
    backgroundColor: Colors.white,
    barSpacing: 0.3,
    cornerRadius: 8.0,
    animationDuration: const Duration(milliseconds: 2000),
    animationCurve: Curves.easeInOut,
    gradientEffect: true,
    gradientColors: [Colors.blue.shade300, Colors.blue.shade600],
  ),
  showGrid: true,
  showValues: true,
  padding: const EdgeInsets.all(32),
  horizontalGridLines: 6,
  interactive: true,
  onAnimationComplete: () {
    print('Animation completed!');
  },
)
```

### 2. Simple Data Arrays (Recommended for Dynamic Data)

Perfect for creating charts from external data sources:

```dart
MaterialBarChart.fromData(
  labels: ['Jan', 'Feb', 'Mar', 'Apr'],
  values: [45, 78, 32, 89],
  colors: ['#1f77b4', '#2ca02c', '#ff7f0e', '#d62728'],
  width: 800,
  height: 400,
  showGrid: true,
  showValues: true,
  padding: const EdgeInsets.all(32),
  horizontalGridLines: 6,
  interactive: true,
  style: {
    'barSpacing': 0.3,
    'cornerRadius': 8.0,
    'animationDuration': 2000,
    'animationCurve': 'easeInOut',
    'gradientEffect': true,
    'gradientColors': ['#1f77b4', '#ff7f0e'],
  },
  onAnimationComplete: () {
    print('Chart animation completed!');
  },
)
```

### 3. JSON Configuration (For External Data Sources)

Useful when loading configurations from APIs or files:

```dart
final jsonConfig = {
  'data': [
    {'x': 'Jan', 'y': 45, 'color': '#1f77b4'},
    {'x': 'Feb', 'y': 78, 'color': '#2ca02c'},
    {'x': 'Mar', 'y': 32, 'color': '#ff7f0e'},
  ],
  'style': {
    'width': 800,
    'height': 400,
    'showGrid': true,
    'showValues': true,
    'padding': {'left': 32, 'top': 32, 'right': 32, 'bottom': 32},
    'horizontalGridLines': 6,
    'interactive': true,
    'barColor': '#1f77b4',
    'gridColor': '#f0f0f0',
    'backgroundColor': '#ffffff',
    'barSpacing': 0.3,
    'cornerRadius': 8.0,
    'animationDuration': 2000,
    'animationCurve': 'easeInOut',
    'gradientEffect': true,
    'gradientColors': ['#1f77b4', '#ff7f0e'],
  },
};

MaterialBarChart.fromJson(jsonConfig)
```

## Color Support

The library supports multiple color formats:

```dart
// Hex colors (recommended)
colors: ['#1f77b4', '#2ca02c', '#ff7f0e']

// RGB format
colors: ['rgb(31, 119, 180)', 'rgb(44, 160, 44)', 'rgb(255, 127, 14)']

// RGBA format
colors: ['rgba(31, 119, 180, 0.8)', 'rgba(44, 160, 44, 0.8)']

// Flutter Colors
colors: [Colors.blue, Colors.green, Colors.orange]
```

## Configuration Options

### Bar Chart Style Properties

| Property            | Type           | Default            | Description                      |
| ------------------- | -------------- | ------------------ | -------------------------------- |
| `barColor`          | `Color`        | `Colors.blue`      | Color of the bars                |
| `gridColor`         | `Color`        | `Colors.grey`      | Color of grid lines              |
| `backgroundColor`   | `Color`        | `Colors.white`     | Background color                 |
| `barSpacing`        | `double`       | `0.2`              | Spacing between bars (0.0 - 1.0) |
| `cornerRadius`      | `double`       | `4.0`              | Radius for rounded corners       |
| `animationDuration` | `Duration`     | `1500ms`           | Animation duration               |
| `animationCurve`    | `Curve`        | `Curves.easeInOut` | Animation curve                  |
| `gradientEffect`    | `bool`         | `false`            | Enable gradient effect           |
| `gradientColors`    | `List<Color>?` | `null`             | List of gradient colors          |
| `labelStyle`        | `TextStyle?`   | `null`             | Style for bar labels             |
| `valueStyle`        | `TextStyle?`   | `null`             | Style for bar values             |

### Display Options

| Property              | Type         | Default              | Description                     |
| --------------------- | ------------ | -------------------- | ------------------------------- |
| `showGrid`            | `bool`       | `true`               | Show/hide grid lines            |
| `showValues`          | `bool`       | `true`               | Show/hide value labels          |
| `padding`             | `EdgeInsets` | `EdgeInsets.all(24)` | Chart padding                   |
| `horizontalGridLines` | `int`        | `5`                  | Number of horizontal grid lines |
| `interactive`         | `bool`       | `true`               | Enable hover interactions       |

## Available Chart Types

- **Bar Charts**: `MaterialBarChart` (with multiple creation methods)
- **Line Charts**: `MaterialLineChart`
- **Pie Charts**: `MaterialPieChart`
- **Area Charts**: `MaterialAreaChart`
- **Stacked Bar Charts**: `MaterialStackedBarChart`
- **Candlestick Charts**: `MaterialCandlestickChart`
- **Multi-line Charts**: `MaterialMultiLineChart`
- **Gantt Charts**: `MaterialGanttChart`
- **Hollow Semicircle Charts**: `MaterialHollowSemicircleChart`

## Best Practices

### 1. Choose the Right Method

- **Traditional API**: For static charts with known data
- **Simple Data Arrays**: For dynamic data from APIs or databases
- **JSON Configuration**: For external configuration files or APIs

### 2. Color Management

- Use hex colors (`#1f77b4`) for consistency across platforms
- Provide fallback colors for better user experience
- Consider accessibility with color contrast

### 3. Performance

- Use `const` constructors when possible
- Avoid rebuilding charts unnecessarily
- Use appropriate animation durations

### 4. Responsive Design

- Use flexible dimensions with `MediaQuery`
- Test on different screen sizes
- Consider mobile vs desktop layouts

## Examples

### Dynamic Data from API

```dart
class DynamicChart extends StatelessWidget {
  final List<ChartData> apiData;

  const DynamicChart({super.key, required this.apiData});

  @override
  Widget build(BuildContext context) {
    return MaterialBarChart.fromData(
      labels: apiData.map((d) => d.label).toList(),
      values: apiData.map((d) => d.value).toList(),
      colors: apiData.map((d) => d.color).toList(),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 300,
    );
  }
}
```

### Styled Chart with Custom Theme

```dart
MaterialBarChart.fromData(
  labels: ['Q1', 'Q2', 'Q3', 'Q4'],
  values: [120, 180, 150, 200],
  colors: ['#2196F3', '#4CAF50', '#FF9800', '#F44336'],
  width: 600,
  height: 400,
  style: {
    'barSpacing': 0.4,
    'cornerRadius': 12.0,
    'animationDuration': 3000,
    'animationCurve': 'bounceOut',
    'gradientEffect': true,
    'gradientColors': ['#2196F3', '#1976D2'],
  },
  showGrid: true,
  showValues: true,
  horizontalGridLines: 8,
  interactive: true,
)
```

## Migration Guide

### From Other Chart Libraries

```dart
// Old library
OldBarChart(
  data: oldData,
  config: oldConfig,
)

// Material Charts
MaterialBarChart.fromData(
  labels: oldData.map((d) => d.label).toList(),
  values: oldData.map((d) => d.value).toList(),
  colors: oldData.map((d) => d.color).toList(),
  width: oldConfig.width,
  height: oldConfig.height,
)
```

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Vishnudas V**

- GitHub: [vishnudas-bluefox](https://github.com/vishnudas-bluefox/material_charts)
- Email: [vishnudas956783@gmail.com](mailto:vishnudas956783@gmail.com)
