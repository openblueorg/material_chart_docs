import 'package:chat_test_01/charts/candle_stick_chart.dart';
import 'package:chat_test_01/charts/constants.dart';
import 'package:chat_test_01/charts/gantt_chart.dart';
import 'package:chat_test_01/charts/line_chart/line_chart.dart';
import 'package:chat_test_01/charts/multiline_chart.dart';
import 'package:chat_test_01/charts/semicircle_chart.dart';
import 'package:chat_test_01/charts/stacked_bar_chart.dart';
import 'package:flutter/material.dart';

import 'charts/area_chart/area_chart_widget.dart';
import 'charts/bar_charts/bar_chart_widget.dart';
import 'charts/piechart/pie_chart_widget.dart';

void main() {
  runApp(const MaterialChartsDemo());
}

class MaterialChartsDemo extends StatelessWidget {
  const MaterialChartsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Charts Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textPrimary,
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const ChartsDemoScreen(),
    );
  }
}

class ChartsDemoScreen extends StatefulWidget {
  const ChartsDemoScreen({super.key});

  @override
  State<ChartsDemoScreen> createState() => _ChartsDemoScreenState();
}

class _ChartsDemoScreenState extends State<ChartsDemoScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _sidebarController;
  late Animation<double> _sidebarAnimation;
  bool _showEditPanel = false; // Added for edit panel toggle

  final List<ChartType> _chartTypes = [
    ChartType(
      'Line Chart',
      Icons.trending_up,
      'Visualize trends over time',
      Colors.blue,
    ),
    ChartType(
      'Bar Chart',
      Icons.bar_chart,
      'Compare values across categories',
      Colors.green,
    ),
    ChartType(
      'Area Chart',
      Icons.area_chart,
      'Show cumulative values',
      Colors.purple,
    ),
    ChartType(
      'Pie Chart',
      Icons.pie_chart,
      'Display proportional data',
      Colors.orange,
    ),
    ChartType(
      'Multi-Line Chart',
      Icons.show_chart,
      'Compare multiple series',
      Colors.red,
    ),
    ChartType(
      'Stacked Bar Chart',
      Icons.stacked_bar_chart,
      'Show part-to-whole relationships',
      Colors.indigo,
    ),
    ChartType(
      'Candlestick Chart',
      Icons.candlestick_chart,
      'Financial data visualization',
      Colors.teal,
    ),
    ChartType(
      'Semicircle Chart',
      Icons.donut_small,
      'Progress indicators',
      Colors.amber,
    ),
    ChartType(
      'Gantt Chart',
      Icons.timeline,
      'Project timeline management',
      Colors.cyan,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _sidebarController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _sidebarAnimation = CurvedAnimation(
      parent: _sidebarController,
      curve: Curves.easeInOut,
    );
    _sidebarController.forward();
  }

  @override
  void dispose() {
    _sidebarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.surface,
              AppColors.background,
              AppColors.cardBackground,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            _buildStunningAppBar(),
            Expanded(
              child: Row(
                children: [
                  _buildAnimatedSidebar(),
                  Expanded(child: _buildChartArea()),
                  // Add edit panel when needed
                  if (_showEditPanel && _selectedIndex == 0)
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: AppColors.sidebarBackground,
                        border: Border(
                          left: BorderSide(color: AppColors.border, width: 1),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStunningAppBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(
                  _chartTypes[_selectedIndex].icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _chartTypes[_selectedIndex].name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      _chartTypes[_selectedIndex].description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Modified edit button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      _showEditPanel = !_showEditPanel;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          _showEditPanel
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _showEditPanel ? Icons.close : Icons.edit_outlined,
                      color: Colors.white.withOpacity(0.8),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSidebar() {
    return AnimatedBuilder(
      animation: _sidebarAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(-300 * (1 - _sidebarAnimation.value), 0),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.sidebarBackground,
              border: Border(
                right: BorderSide(color: AppColors.border, width: 1),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSidebarHeader(),
                Expanded(child: _buildChartList()),
                _buildSidebarFooter(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSidebarHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cardBackground, AppColors.surface],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.dashboard_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Chart Gallery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Explore ${_chartTypes.length} beautiful chart types',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _chartTypes.length,
      itemBuilder: (context, index) {
        final isSelected = index == _selectedIndex;
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (_selectedIndex != index) {
                  setState(() {
                    _selectedIndex = index;
                    _showEditPanel =
                        false; // Close edit panel when switching charts
                  });
                  Future.delayed(const Duration(milliseconds: 50), () {
                    if (mounted) {
                      setState(() {});
                    }
                  });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: isSelected ? AppColors.primaryGradient : null,
                  color: isSelected ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? Colors.transparent : AppColors.border,
                    width: 1,
                  ),
                  boxShadow:
                      isSelected
                          ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            ),
                          ]
                          : [],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? Colors.white.withOpacity(0.2)
                                : AppColors.accent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              isSelected
                                  ? Colors.white.withOpacity(0.3)
                                  : AppColors.accent.withOpacity(0.2),
                        ),
                      ),
                      child: Icon(
                        _chartTypes[index].icon,
                        size: 18,
                        color: isSelected ? Colors.white : AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _chartTypes[index].name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:
                                  isSelected
                                      ? Colors.white
                                      : AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _chartTypes[index].description,
                            style: TextStyle(
                              fontSize: 11,
                              color:
                                  isSelected
                                      ? Colors.white.withOpacity(0.8)
                                      : AppColors.textLight,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSidebarFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.surface, AppColors.cardBackground],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.auto_graph, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Material Charts',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'v1.0.0',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartArea() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Card(
        elevation: 0,
        color: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: AppColors.border, width: 1),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [AppColors.background, AppColors.cardBackground],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildChartHeader(),
                const SizedBox(height: 32),
                Expanded(child: Center(child: _getChartWidget())),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChartHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                _chartTypes[_selectedIndex].icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _chartTypes[_selectedIndex].name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _chartTypes[_selectedIndex].description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: AppColors.accentGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _showEditPanel ? Icons.edit : Icons.palette,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _showEditPanel ? 'Editing' : 'Stunning',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 2,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }

  Widget _getChartWidget() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
      child: Container(
        key: ValueKey<int>(_selectedIndex),
        child: _buildSelectedChart(),
      ),
    );
  }

  Widget _buildSelectedChart() {
    switch (_selectedIndex) {
      case 0:
        return LineChartWidget();
      case 1:
        return const BarChartWidget();
      case 2:
        return const AreaChartWidget();
      case 3:
        return const PieChartWidget();
      case 4:
        return const MultiLineChartWidget();
      case 5:
        return const StackedBarChartWidget();
      case 6:
        return const CandlestickChartWidget();
      case 7:
        return const SemicircleChartWidget();
      case 8:
        return const GanttChartWidget();
      default:
        return const Center(child: Text('Chart not implemented yet'));
    }
  }
}

class ChartType {
  final String name;
  final IconData icon;
  final String description;
  final Color color;

  ChartType(this.name, this.icon, this.description, this.color);
}
