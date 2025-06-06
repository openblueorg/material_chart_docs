// data/candlestick_data_provider.dart
import 'package:flutter/material.dart';
import 'package:chat_test_01/material_charts/material_charts.dart';
import '../constants.dart';
import 'models.dart';

/// Provides all candlestick chart examples, property definitions, and code samples
class CandlestickDataProvider {
  // Candlestick Chart Examples for Demo
  static List<CandlestickExample> getCandlestickExamples() {
    return [
      CandlestickExample(
        title: 'Stock Price Movement',
        description: 'Daily stock price candlesticks with volume',
        bullishColor: AppColors.primary,
        bearishColor: AppColors.accent,
        category: 'stocks',
        data: _generateStockData(),
        metadata: {'symbol': 'AAPL', 'period': 'daily'},
      ),

      CandlestickExample(
        title: 'Cryptocurrency Trading',
        description: 'Crypto price action with high volatility',
        bullishColor: Colors.green,
        bearishColor: Colors.red,
        category: 'crypto',
        data: _generateCryptoData(),
        metadata: {'symbol': 'BTC/USD', 'exchange': 'Coinbase'},
      ),

      CandlestickExample(
        title: 'Forex Market Data',
        description: 'Currency pair exchange rates',
        bullishColor: AppColors.primaryLight,
        bearishColor: AppColors.accentLight,
        category: 'forex',
        data: _generateForexData(),
        metadata: {'pair': 'EUR/USD', 'timeframe': '4H'},
      ),

      CandlestickExample(
        title: 'Commodity Futures',
        description: 'Gold futures price movements',
        bullishColor: Colors.amber,
        bearishColor: Colors.brown,
        category: 'commodities',
        data: _generateCommodityData(),
        metadata: {'commodity': 'GOLD', 'contract': 'DEC23'},
      ),
    ];
  }

  // Generate sample stock data
  static List<CandlestickData> _generateStockData() {
    final data = <CandlestickData>[];
    double basePrice = 150.0;

    for (int i = 0; i < 30; i++) {
      final date = DateTime.now().subtract(Duration(days: 29 - i));
      final volatility = 0.02 + (i % 7) * 0.005; // Varying volatility

      final open = basePrice + (i % 3 - 1) * 2;
      final trend = (i % 10 > 5) ? 1 : -1; // Trend changes
      final close = open + trend * (1 + i % 4) + (i % 2 == 0 ? 1 : -1);

      final high =
          [open, close].reduce((a, b) => a > b ? a : b) +
          (1 + i % 3) * volatility * 100;
      final low =
          [open, close].reduce((a, b) => a < b ? a : b) -
          (1 + i % 2) * volatility * 80;

      final volume = 1000000 + (i % 5) * 500000;

      data.add(
        CandlestickData(
          date: date,
          open: open,
          high: high,
          low: low,
          close: close,
          volume: volume.toDouble(),
        ),
      );

      basePrice = close; // Price continues from previous close
    }

    return data;
  }

  // Generate crypto data with higher volatility
  static List<CandlestickData> _generateCryptoData() {
    final data = <CandlestickData>[];
    double basePrice = 45000.0;

    for (int i = 0; i < 25; i++) {
      final date = DateTime.now().subtract(Duration(days: 24 - i));

      final open = basePrice + (i % 5 - 2) * 500;
      final volatilityFactor =
          (i % 8 == 0) ? 3 : 1; // Occasional high volatility
      final trend = (i % 6 > 3) ? 1 : -1;
      final close = open + trend * (100 + i % 7 * 200) * volatilityFactor;

      final high =
          [open, close].reduce((a, b) => a > b ? a : b) +
          (200 + i % 4 * 150) * volatilityFactor;
      final low =
          [open, close].reduce((a, b) => a < b ? a : b) -
          (150 + i % 3 * 100) * volatilityFactor;

      data.add(
        CandlestickData(
          date: date,
          open: open,
          high: high,
          low: low,
          close: close,
          volume: (50 + i % 10 * 20).toDouble(),
        ),
      );

      basePrice = close;
    }

    return data;
  }

  // Generate forex data with smaller price movements
  static List<CandlestickData> _generateForexData() {
    final data = <CandlestickData>[];
    double basePrice = 1.0850;

    for (int i = 0; i < 20; i++) {
      final date = DateTime.now().subtract(Duration(hours: (19 - i) * 4));

      final open = basePrice + (i % 3 - 1) * 0.001;
      final trend = (i % 5 > 2) ? 1 : -1;
      final close = open + trend * (0.0005 + i % 3 * 0.0003);

      final high =
          [open, close].reduce((a, b) => a > b ? a : b) +
          (0.0002 + i % 2 * 0.0001);
      final low =
          [open, close].reduce((a, b) => a < b ? a : b) -
          (0.0002 + i % 2 * 0.0001);

      data.add(
        CandlestickData(
          date: date,
          open: open,
          high: high,
          low: low,
          close: close,
        ),
      );

      basePrice = close;
    }

    return data;
  }

  // Generate commodity data
  static List<CandlestickData> _generateCommodityData() {
    final data = <CandlestickData>[];
    double basePrice = 1950.0;

    for (int i = 0; i < 35; i++) {
      final date = DateTime.now().subtract(Duration(days: 34 - i));

      final open = basePrice + (i % 4 - 1.5) * 5;
      final trend = (i % 7 > 3) ? 1 : -1;
      final close = open + trend * (3 + i % 5 * 2);

      final high =
          [open, close].reduce((a, b) => a > b ? a : b) + (2 + i % 3 * 1.5);
      final low =
          [open, close].reduce((a, b) => a < b ? a : b) - (2 + i % 3 * 1.5);

      data.add(
        CandlestickData(
          date: date,
          open: open,
          high: high,
          low: low,
          close: close,
        ),
      );

      basePrice = close;
    }

    return data;
  }

  // Animation curve options for customization
  static List<CandlestickCurveOption> getAnimationCurves() {
    return [
      CandlestickCurveOption(
        name: 'Ease Out Cubic',
        curve: Curves.easeOutCubic,
      ),
      CandlestickCurveOption(name: 'Ease In Out', curve: Curves.easeInOut),
      CandlestickCurveOption(name: 'Ease In', curve: Curves.easeIn),
      CandlestickCurveOption(name: 'Ease Out', curve: Curves.easeOut),
      CandlestickCurveOption(name: 'Bounce In', curve: Curves.bounceIn),
      CandlestickCurveOption(name: 'Bounce Out', curve: Curves.bounceOut),
      CandlestickCurveOption(name: 'Elastic In', curve: Curves.elasticIn),
      CandlestickCurveOption(name: 'Elastic Out', curve: Curves.elasticOut),
      CandlestickCurveOption(
        name: 'Fast Linear',
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      CandlestickCurveOption(name: 'Decelerate', curve: Curves.decelerate),
      CandlestickCurveOption(name: 'Linear', curve: Curves.linear),
    ];
  }

  // Property Documentation Sections
  static List<CandlestickPropertySection> getPropertySections() {
    return [
      CandlestickPropertySection(
        title: 'Widget Properties',
        description: 'Core widget configuration',
        icon: Icons.widgets,
        color: AppColors.primary,
        properties: [
          CandlestickPropertyInfo(
            name: 'data',
            type: 'List<CandlestickData>',
            description: 'Candlestick data points with OHLC values',
            required: true,
            example:
                '[CandlestickData(date: date, open: 100, high: 110, low: 95, close: 105)]',
          ),
          CandlestickPropertyInfo(
            name: 'width',
            type: 'double',
            description: 'Chart width in pixels',
            required: true,
            example: '700',
          ),
          CandlestickPropertyInfo(
            name: 'height',
            type: 'double',
            description: 'Chart height in pixels',
            required: true,
            example: '400',
          ),
          CandlestickPropertyInfo(
            name: 'showGrid',
            type: 'bool',
            description: 'Display background grid lines',
            required: false,
            defaultValue: 'true',
            example: 'true',
          ),
          CandlestickPropertyInfo(
            name: 'padding',
            type: 'EdgeInsets',
            description: 'Space around the chart content',
            required: false,
            defaultValue: 'EdgeInsets.all(16)',
            example: 'EdgeInsets.all(20)',
          ),
        ],
      ),

      CandlestickPropertySection(
        title: 'Candlestick Style',
        description: 'Visual styling for candlesticks',
        icon: Icons.candlestick_chart,
        color: AppColors.accent,
        properties: [
          CandlestickPropertyInfo(
            name: 'bullishColor',
            type: 'Color',
            description: 'Color for bullish (up) candlesticks',
            required: false,
            defaultValue: 'Colors.green',
            example: 'Colors.green',
          ),
          CandlestickPropertyInfo(
            name: 'bearishColor',
            type: 'Color',
            description: 'Color for bearish (down) candlesticks',
            required: false,
            defaultValue: 'Colors.red',
            example: 'Colors.red',
          ),
          CandlestickPropertyInfo(
            name: 'candleWidth',
            type: 'double',
            description: 'Width of candlestick bodies',
            required: false,
            defaultValue: '12.0',
            example: '15.0',
          ),
          CandlestickPropertyInfo(
            name: 'wickWidth',
            type: 'double',
            description: 'Thickness of candlestick wicks',
            required: false,
            defaultValue: '2.0',
            example: '3.0',
          ),
          CandlestickPropertyInfo(
            name: 'spacing',
            type: 'double',
            description: 'Space between candlesticks (as ratio)',
            required: false,
            defaultValue: '0.2',
            example: '0.3',
          ),
        ],
      ),

      CandlestickPropertySection(
        title: 'Interactive Features',
        description: 'Hover and interaction settings',
        icon: Icons.touch_app,
        color: AppColors.primaryLight,
        properties: [
          CandlestickPropertyInfo(
            name: 'verticalLineColor',
            type: 'Color',
            description: 'Color of hover vertical line',
            required: false,
            defaultValue: 'Colors.blue',
            example: 'Colors.blue',
          ),
          CandlestickPropertyInfo(
            name: 'verticalLineWidth',
            type: 'double',
            description: 'Width of hover vertical line',
            required: false,
            defaultValue: '1.0',
            example: '2.0',
          ),
        ],
      ),

      CandlestickPropertySection(
        title: 'Tooltip Style',
        description: 'Hover tooltip configuration',
        icon: Icons.info_outline,
        color: AppColors.accentLight,
        properties: [
          CandlestickPropertyInfo(
            name: 'backgroundColor',
            type: 'Color',
            description: 'Background color of tooltip',
            required: false,
            defaultValue: 'Colors.white',
            example: 'Colors.black87',
          ),
          CandlestickPropertyInfo(
            name: 'borderColor',
            type: 'Color',
            description: 'Border color of tooltip',
            required: false,
            defaultValue: 'Colors.grey',
            example: 'Colors.grey',
          ),
          CandlestickPropertyInfo(
            name: 'borderRadius',
            type: 'double',
            description: 'Radius of tooltip corners',
            required: false,
            defaultValue: '5.0',
            example: '12.0',
          ),
          CandlestickPropertyInfo(
            name: 'textStyle',
            type: 'TextStyle',
            description: 'Styling for tooltip text',
            required: false,
            example: 'TextStyle(color: Colors.white, fontSize: 12)',
          ),
          CandlestickPropertyInfo(
            name: 'padding',
            type: 'EdgeInsets',
            description: 'Internal padding of tooltip',
            required: false,
            defaultValue: 'EdgeInsets.all(8)',
            example: 'EdgeInsets.all(12)',
          ),
        ],
      ),

      CandlestickPropertySection(
        title: 'Axis Configuration',
        description: 'Chart axes and labels',
        icon: Icons.grid_on,
        color: Colors.indigo,
        properties: [
          CandlestickPropertyInfo(
            name: 'priceDivisions',
            type: 'int',
            description: 'Number of price divisions on Y-axis',
            required: false,
            defaultValue: '5',
            example: '8',
          ),
          CandlestickPropertyInfo(
            name: 'dateDivisions',
            type: 'int',
            description: 'Number of date divisions on X-axis',
            required: false,
            defaultValue: '5',
            example: '7',
          ),
          CandlestickPropertyInfo(
            name: 'yAxisWidth',
            type: 'double',
            description: 'Width reserved for Y-axis labels',
            required: false,
            defaultValue: '60.0',
            example: '80.0',
          ),
          CandlestickPropertyInfo(
            name: 'xAxisHeight',
            type: 'double',
            description: 'Height reserved for X-axis labels',
            required: false,
            defaultValue: '30.0',
            example: '40.0',
          ),
          CandlestickPropertyInfo(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Styling for axis labels',
            required: false,
            example: 'TextStyle(fontSize: 11, color: Colors.grey)',
          ),
        ],
      ),

      CandlestickPropertySection(
        title: 'Animation Config',
        description: 'Animation settings',
        icon: Icons.animation,
        color: Colors.purple,
        properties: [
          CandlestickPropertyInfo(
            name: 'animationDuration',
            type: 'Duration',
            description: 'Length of the chart animation',
            required: false,
            defaultValue: 'Duration(milliseconds: 1500)',
            example: 'Duration(milliseconds: 2000)',
          ),
          CandlestickPropertyInfo(
            name: 'animationCurve',
            type: 'Curve',
            description: 'Animation easing curve style',
            required: false,
            defaultValue: 'Curves.easeInOut',
            example: 'Curves.easeOutCubic',
          ),
          CandlestickPropertyInfo(
            name: 'onAnimationComplete',
            type: 'VoidCallback?',
            description: 'Callback when animation finishes',
            required: false,
            example: '() => print("Animation done!")',
          ),
        ],
      ),

      CandlestickPropertySection(
        title: 'Data Model',
        description: 'CandlestickData structure',
        icon: Icons.data_object,
        color: Colors.teal,
        properties: [
          CandlestickPropertyInfo(
            name: 'date',
            type: 'DateTime',
            description: 'Date and time of the candlestick',
            required: true,
            example: 'DateTime.now()',
          ),
          CandlestickPropertyInfo(
            name: 'open',
            type: 'double',
            description: 'Opening price',
            required: true,
            example: '100.0',
          ),
          CandlestickPropertyInfo(
            name: 'high',
            type: 'double',
            description: 'Highest price during period',
            required: true,
            example: '110.0',
          ),
          CandlestickPropertyInfo(
            name: 'low',
            type: 'double',
            description: 'Lowest price during period',
            required: true,
            example: '95.0',
          ),
          CandlestickPropertyInfo(
            name: 'close',
            type: 'double',
            description: 'Closing price',
            required: true,
            example: '105.0',
          ),
          CandlestickPropertyInfo(
            name: 'volume',
            type: 'double?',
            description: 'Optional trading volume',
            required: false,
            example: '1000000.0',
          ),
        ],
      ),
    ];
  }

  // Code Examples
  static List<CandlestickCodeExample> getCodeExamples() {
    return [
      CandlestickCodeExample(
        title: 'Basic Usage',
        description: 'Simple candlestick chart with minimal configuration',
        category: 'basic',
        code: '''MaterialCandlestickChart(
  data: [
    CandlestickData(
      date: DateTime.now().subtract(Duration(days: 2)),
      open: 100,
      high: 110,
      low: 95,
      close: 105,
    ),
    CandlestickData(
      date: DateTime.now().subtract(Duration(days: 1)),
      open: 105,
      high: 115,
      low: 102,
      close: 108,
    ),
    CandlestickData(
      date: DateTime.now(),
      open: 108,
      high: 112,
      low: 104,
      close: 106,
    ),
  ],
  width: 700,
  height: 400,
)''',
      ),

      CandlestickCodeExample(
        title: 'Advanced Styling',
        description: 'Customized appearance with tooltips and animations',
        category: 'advanced',
        code: '''MaterialCandlestickChart(
  data: candlestickData,
  width: 800,
  height: 500,
  style: CandlestickStyle(
    bullishColor: Colors.green,
    bearishColor: Colors.red,
    candleWidth: 15,
    wickWidth: 3,
    spacing: 0.3,
    verticalLineColor: Colors.blue,
    verticalLineWidth: 2,
    animationDuration: Duration(milliseconds: 2000),
    animationCurve: Curves.easeOutCubic,
    tooltipStyle: TooltipStyle(
      backgroundColor: Colors.black87,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      borderRadius: 8,
      padding: EdgeInsets.all(12),
    ),
  ),
  backgroundColor: Colors.white,
  showGrid: true,
  padding: EdgeInsets.all(20),
)''',
      ),

      CandlestickCodeExample(
        title: 'Custom Axis Configuration',
        description: 'Detailed axis customization with formatters',
        category: 'advanced',
        code: '''MaterialCandlestickChart(
  data: stockData,
  width: 900,
  height: 600,
  axisConfig: ChartAxisConfig(
    priceDivisions: 8,
    dateDivisions: 6,
    yAxisWidth: 80,
    xAxisHeight: 40,
    labelStyle: TextStyle(
      color: Colors.grey[700],
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
    priceFormatter: (price) => '\\\$\${price.toStringAsFixed(2)}',
    dateFormatter: (date) => DateFormat('MMM dd').format(date),
  ),
  style: CandlestickStyle(
    bullishColor: Color(0xFF4CAF50),
    bearishColor: Color(0xFFF44336),
    candleWidth: 12,
    wickWidth: 2,
  ),
)''',
      ),

      CandlestickCodeExample(
        title: 'With Callbacks',
        description: 'Handling animation completion events',
        category: 'callbacks',
        code: '''MaterialCandlestickChart(
  data: tradingData,
  width: 750,
  height: 450,
  onAnimationComplete: () {
    print('Candlestick chart animation completed!');
    // Show additional UI elements
    _showTradingControls();
    // Analytics tracking
    _trackChartView();
  },
  style: CandlestickStyle(
    animationDuration: Duration(milliseconds: 1800),
    animationCurve: Curves.easeOutQuart,
  ),
)''',
      ),
    ];
  }

  // Available color palette for customization
  static List<Color> getColorPalette() {
    return [
      AppColors.primary,
      AppColors.accent,
      AppColors.primaryLight,
      AppColors.accentLight,
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.amber,
      Colors.brown,
    ];
  }

  // Background colors for chart
  static List<Color> getBackgroundColors() {
    return [
      Colors.transparent,
      Colors.white,
      const Color(0xFFF8F9FA),
      const Color(0xFFF1F3F4),
      const Color(0xFFE8F0FE),
      const Color(0xFFFFF3E0),
      const Color(0xFFE8F5E8),
      const Color(0xFFFCE4EC),
      const Color(0xFF263238),
      const Color(0xFF1E1E1E),
    ];
  }

  // Generate dynamic live code with current configuration
  static String generateLiveCode(
    CandlestickExample example,
    CandlestickConfig config,
    bool showRightPanel,
  ) {
    final dataString = example.data
        .take(5)
        .map(
          (data) =>
              '    CandlestickData(\n'
              '      date: DateTime.parse(\'${data.date.toIso8601String().split('T')[0]}\'),\n'
              '      open: ${data.open.toStringAsFixed(2)},\n'
              '      high: ${data.high.toStringAsFixed(2)},\n'
              '      low: ${data.low.toStringAsFixed(2)},\n'
              '      close: ${data.close.toStringAsFixed(2)},\n'
              '    )',
        )
        .join(',\n');

    final bullishColorName = _getColorName(config.bullishColor);
    final bearishColorName = _getColorName(config.bearishColor);
    final backgroundColorName =
        config.backgroundColor == Colors.transparent
            ? 'Colors.transparent'
            : _getColorName(config.backgroundColor);
    final verticalLineColorName = _getColorName(config.verticalLineColor);
    final tooltipBgColorName = _getColorName(config.tooltipBackgroundColor);
    final animationCurveName = _getCurveName(config.animationCurve);

    return '''// ${example.title} Example - Live Customization
final data = [
$dataString,
  // ... more data points
];

MaterialCandlestickChart(
  data: data,
  width: ${showRightPanel ? 500 : 700},
  height: 400,
  style: CandlestickStyle(
    bullishColor: $bullishColorName,
    bearishColor: $bearishColorName,
    candleWidth: ${config.candleWidth.toStringAsFixed(1)},
    wickWidth: ${config.wickWidth.toStringAsFixed(1)},
    spacing: ${config.spacing.toStringAsFixed(1)},
    verticalLineColor: $verticalLineColorName,
    verticalLineWidth: ${config.verticalLineWidth.toStringAsFixed(1)},
    animationDuration: Duration(milliseconds: ${config.animationDuration.inMilliseconds}),
    animationCurve: $animationCurveName,
    tooltipStyle: TooltipStyle(
      backgroundColor: $tooltipBgColorName,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      borderRadius: ${config.tooltipBorderRadius.toStringAsFixed(1)},
    ),
  ),
  backgroundColor: $backgroundColorName,
  axisConfig: ChartAxisConfig(
    priceDivisions: ${config.priceDivisions},
    dateDivisions: ${config.dateDivisions},
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 11,
      fontWeight: FontWeight.w600,
    ),
  ),
  showGrid: ${config.showGrid},
  padding: EdgeInsets.all(20),
  onAnimationComplete: () {
    print('${example.title} animation completed!');
  },
)''';
  }

  // Get curve name for code generation
  static String _getCurveName(Curve curve) {
    if (curve == Curves.easeOutCubic) return 'Curves.easeOutCubic';
    if (curve == Curves.easeInOut) return 'Curves.easeInOut';
    if (curve == Curves.easeIn) return 'Curves.easeIn';
    if (curve == Curves.easeOut) return 'Curves.easeOut';
    if (curve == Curves.bounceIn) return 'Curves.bounceIn';
    if (curve == Curves.bounceOut) return 'Curves.bounceOut';
    if (curve == Curves.elasticIn) return 'Curves.elasticIn';
    if (curve == Curves.elasticOut) return 'Curves.elasticOut';
    if (curve == Curves.fastLinearToSlowEaseIn)
      return 'Curves.fastLinearToSlowEaseIn';
    if (curve == Curves.decelerate) return 'Curves.decelerate';
    if (curve == Curves.linear) return 'Curves.linear';
    return 'Curves.easeOutCubic';
  }

  static String _getColorName(Color color) {
    if (color == AppColors.primary) return 'AppColors.primary';
    if (color == AppColors.accent) return 'AppColors.accent';
    if (color == AppColors.primaryLight) return 'AppColors.primaryLight';
    if (color == AppColors.accentLight) return 'AppColors.accentLight';
    if (color == AppColors.darkTeal) return 'AppColors.darkTeal';
    if (color == AppColors.border) return 'AppColors.border';
    if (color == Colors.green) return 'Colors.green';
    if (color == Colors.red) return 'Colors.red';
    if (color == Colors.blue) return 'Colors.blue';
    if (color == Colors.orange) return 'Colors.orange';
    if (color == Colors.purple) return 'Colors.purple';
    if (color == Colors.teal) return 'Colors.teal';
    if (color == Colors.indigo) return 'Colors.indigo';
    if (color == Colors.pink) return 'Colors.pink';
    if (color == Colors.amber) return 'Colors.amber';
    if (color == Colors.brown) return 'Colors.brown';
    if (color == Colors.white) return 'Colors.white';
    if (color == Colors.black87) return 'Colors.black87';
    return 'Colors.blue';
  }
}
