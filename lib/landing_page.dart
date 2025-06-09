import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'charts/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class LandingPage extends StatefulWidget {
  final VoidCallback onExploreCharts;

  const LandingPage({super.key, required this.onExploreCharts});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _featuresController;
  late AnimationController _chartGridController;
  late Animation<double> _heroAnimation;
  late Animation<double> _featuresAnimation;
  late Animation<double> _chartGridAnimation;

  final PageController _chartCarouselController = PageController();
  int _currentChartIndex = 0;

  final List<ChartShowcase> _chartShowcases = [
    ChartShowcase(
      name: 'Interactive Line Charts',
      description: 'Trend analysis with smooth animations',
      icon: Icons.trending_up,
      color: Colors.blue,
      features: ['Real-time updates', 'Zoom & Pan', 'Crosshair tooltips'],
    ),
    ChartShowcase(
      name: 'Dynamic Pie Charts',
      description: 'Perfect for data distribution',
      icon: Icons.pie_chart,
      color: Colors.orange,
      features: ['Hover effects', 'Custom legends', 'Doughnut mode'],
    ),
    ChartShowcase(
      name: 'Multi-Line Analysis',
      description: 'Compare multiple data series',
      icon: Icons.show_chart,
      color: Colors.red,
      features: ['Series comparison', 'Custom styling', 'Live legends'],
    ),
    ChartShowcase(
      name: 'Bar Chart Variations',
      description: 'Category comparisons made simple',
      icon: Icons.bar_chart,
      color: Colors.green,
      features: ['Stacked bars', 'Grouped bars', 'Horizontal mode'],
    ),
    ChartShowcase(
      name: 'Financial Candlesticks',
      description: 'Professional trading charts',
      icon: Icons.candlestick_chart,
      color: Colors.teal,
      features: ['OHLC data', 'Volume bars', 'Technical indicators'],
    ),
    ChartShowcase(
      name: 'Project Gantt Charts',
      description: 'Timeline visualization',
      icon: Icons.timeline,
      color: Colors.cyan,
      features: ['Task dependencies', 'Progress tracking', 'Milestone markers'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimationSequence();
    _startChartCarousel();
  }

  void _setupAnimations() {
    _heroController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _featuresController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _chartGridController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _heroAnimation = CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeOutCubic,
    );
    _featuresAnimation = CurvedAnimation(
      parent: _featuresController,
      curve: Curves.easeOutCubic,
    );
    _chartGridAnimation = CurvedAnimation(
      parent: _chartGridController,
      curve: Curves.easeOutCubic,
    );
  }

  void _startAnimationSequence() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _heroController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _featuresController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _chartGridController.forward();
  }

  void _startChartCarousel() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        _nextChart();
      }
    });
  }

  void _nextChart() {
    if (!mounted) return;
    setState(() {
      _currentChartIndex = (_currentChartIndex + 1) % _chartShowcases.length;
    });
    _chartCarouselController.animateToPage(
      _currentChartIndex,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
    Future.delayed(const Duration(seconds: 4), _nextChart);
  }

  @override
  void dispose() {
    _heroController.dispose();
    _featuresController.dispose();
    _chartGridController.dispose();
    _chartCarouselController.dispose();
    super.dispose();
  }

  // Responsive helper methods
  bool _isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool _isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;
  bool _isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  double _getResponsivePadding(BuildContext context) {
    if (_isMobile(context)) return 20;
    if (_isTablet(context)) return 30;
    return 40;
  }

  double _getResponsiveFontSize(
    BuildContext context,
    double mobile,
    double tablet,
    double desktop,
  ) {
    if (_isMobile(context)) return mobile;
    if (_isTablet(context)) return tablet;
    return desktop;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeroSection(),
              _buildFeaturesSection(),
              _buildChartShowcaseSection(),
              _buildCallToActionSection(),
              _buildFooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = _isMobile(context);
    final isTablet = _isTablet(context);

    return SizedBox(
      height: isMobile ? screenSize.height * 0.9 : screenSize.height,
      child: Stack(
        children: [
          // Background particles effect - fewer on mobile for performance
          ...List.generate(
            isMobile ? 8 : (isTablet ? 12 : 15),
            (index) => _buildFloatingParticle(index),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _getResponsivePadding(context),
              ),
              child: Column(
                children: [
                  SizedBox(height: isMobile ? 30 : 60),

                  // Logo/Brand section
                  AnimatedBuilder(
                    animation: _heroAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 50 * (1 - _heroAnimation.value)),
                        child: Opacity(
                          opacity: _heroAnimation.value,
                          child: Row(
                            mainAxisAlignment:
                                isMobile
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(isMobile ? 12 : 16),
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(
                                    isMobile ? 16 : 20,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary.withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.auto_graph,
                                  color: Colors.white,
                                  size: isMobile ? 24 : 32,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Material Charts',
                                style: TextStyle(
                                  fontSize: _getResponsiveFontSize(
                                    context,
                                    20,
                                    22,
                                    24,
                                  ),
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  // Main hero content
                  AnimatedBuilder(
                    animation: _heroAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 100 * (1 - _heroAnimation.value)),
                        child: Opacity(
                          opacity: _heroAnimation.value,
                          child: Column(
                            children: [
                              // Main headline
                              ShaderMask(
                                shaderCallback:
                                    (bounds) => AppColors.primaryGradient
                                        .createShader(bounds),
                                child: Text(
                                  'Build Charts\nInteractively',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: _getResponsiveFontSize(
                                      context,
                                      48,
                                      60,
                                      72,
                                    ),
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: isMobile ? -1 : -2,
                                    height: 0.9,
                                  ),
                                ),
                              ),

                              SizedBox(height: isMobile ? 16 : 24),

                              // Subtitle
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 16 : 24,
                                  vertical: isMobile ? 8 : 12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: AppColors.primary.withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  'Effort Zero • Productivity 100%',
                                  style: TextStyle(
                                    fontSize: _getResponsiveFontSize(
                                      context,
                                      14,
                                      16,
                                      18,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),

                              SizedBox(height: isMobile ? 20 : 32),

                              // Description
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 0 : 40,
                                ),
                                child: Text(
                                  'Design stunning data visualizations with zero coding effort.\nCustomize, preview, and integrate seamlessly into your Flutter apps.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: _getResponsiveFontSize(
                                      context,
                                      16,
                                      18,
                                      20,
                                    ),
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                                ),
                              ),

                              SizedBox(height: isMobile ? 32 : 48),

                              // CTA Buttons
                              isMobile
                                  ? Column(
                                    children: [
                                      _buildPrimaryButton(
                                        'Explore Charts',
                                        Icons.rocket_launch,
                                        widget.onExploreCharts,
                                        isFullWidth: true,
                                      ),
                                      const SizedBox(height: 16),
                                      _buildSecondaryButton(
                                        'Support ❤️',
                                        Icons.attach_money_rounded,
                                        () => _showDocumentation(),
                                        isFullWidth: true,
                                      ),
                                    ],
                                  )
                                  : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildPrimaryButton(
                                        'Explore Charts',
                                        Icons.rocket_launch,
                                        widget.onExploreCharts,
                                      ),
                                      const SizedBox(width: 20),
                                      _buildSecondaryButton(
                                        'Support ❤️',
                                        Icons.attach_money_rounded,
                                        () => _showDocumentation(),
                                      ),
                                    ],
                                  ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  // Scroll indicator - hidden on mobile to save space
                  if (!isMobile)
                    AnimatedBuilder(
                      animation: _heroAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _heroAnimation.value,
                          child: Column(
                            children: [
                              const Text(
                                'Discover Features',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textLight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TweenAnimationBuilder(
                                duration: const Duration(seconds: 2),
                                tween: Tween<double>(begin: 0, end: 1),
                                builder: (context, value, child) {
                                  return Transform.translate(
                                    offset: Offset(0, 10 * value),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.primary.withOpacity(
                                        value,
                                      ),
                                      size: 24,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                  SizedBox(height: isMobile ? 20 : 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    final isMobile = _isMobile(context);
    final padding = _getResponsivePadding(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _featuresAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 50 * (1 - _featuresAnimation.value)),
                child: Opacity(
                  opacity: _featuresAnimation.value,
                  child: Column(
                    children: [
                      Text(
                        'Developer-First Experience',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _getResponsiveFontSize(context, 32, 40, 48),
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 0 : 40,
                        ),
                        child: Text(
                          'Built for modern developers who value efficiency and beautiful code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: _getResponsiveFontSize(
                              context,
                              16,
                              17,
                              18,
                            ),
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          SizedBox(height: isMobile ? 40 : 80),

          // Features grid - stacked on mobile
          AnimatedBuilder(
            animation: _featuresAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 100 * (1 - _featuresAnimation.value)),
                child: Opacity(
                  opacity: _featuresAnimation.value,
                  child:
                      isMobile
                          ? Column(
                            children: [
                              _buildFeatureCard(
                                'Interactive Design',
                                'Customize every aspect with live preview. See changes instantly without writing code.',
                                Icons.design_services,
                                AppColors.primary,
                                0,
                              ),
                              const SizedBox(height: 20),
                              _buildFeatureCard(
                                'Code Generation',
                                'Get production-ready Flutter code automatically. Copy, paste, and integrate.',
                                Icons.code,
                                AppColors.accent,
                                200,
                              ),
                              const SizedBox(height: 20),
                              _buildFeatureCard(
                                'Zero Learning Curve',
                                'Intuitive interface that feels natural. Start creating beautiful charts immediately.',
                                Icons.bolt,
                                AppColors.primaryLight,
                                400,
                              ),
                            ],
                          )
                          : Row(
                            children: [
                              Expanded(
                                child: _buildFeatureCard(
                                  'Interactive Design',
                                  'Customize every aspect with live preview. See changes instantly without writing code.',
                                  Icons.design_services,
                                  AppColors.primary,
                                  0,
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: _buildFeatureCard(
                                  'Code Generation',
                                  'Get production-ready Flutter code automatically. Copy, paste, and integrate.',
                                  Icons.code,
                                  AppColors.accent,
                                  200,
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: _buildFeatureCard(
                                  'Zero Learning Curve',
                                  'Intuitive interface that feels natural. Start creating beautiful charts immediately.',
                                  Icons.bolt,
                                  AppColors.primaryLight,
                                  400,
                                ),
                              ),
                            ],
                          ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChartShowcaseSection() {
    final isMobile = _isMobile(context);
    final padding = _getResponsivePadding(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _chartGridAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 50 * (1 - _chartGridAnimation.value)),
                child: Opacity(
                  opacity: _chartGridAnimation.value,
                  child: Column(
                    children: [
                      Text(
                        'Every Chart You Need',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _getResponsiveFontSize(context, 32, 40, 48),
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      Text(
                        'From basic visualizations to complex financial charts',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _getResponsiveFontSize(context, 16, 17, 18),
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          SizedBox(height: isMobile ? 40 : 80),

          // Chart carousel
          AnimatedBuilder(
            animation: _chartGridAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 100 * (1 - _chartGridAnimation.value)),
                child: Opacity(
                  opacity: _chartGridAnimation.value,
                  child: SizedBox(
                    height: isMobile ? 300 : 400,
                    child: PageView.builder(
                      controller: _chartCarouselController,
                      itemCount: _chartShowcases.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentChartIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return _buildChartShowcaseCard(_chartShowcases[index]);
                      },
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 30),

          // Carousel indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                _chartShowcases.asMap().entries.map((entry) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentChartIndex == entry.key ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:
                          _currentChartIndex == entry.key
                              ? AppColors.primary
                              : AppColors.border,
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCallToActionSection() {
    final isMobile = _isMobile(context);
    final padding = _getResponsivePadding(context);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 60 : 100,
      ),
      padding: EdgeInsets.all(isMobile ? 40 : 60),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(isMobile ? 24 : 32),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Ready to Build Amazing Charts?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: _getResponsiveFontSize(context, 28, 36, 40),
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            'Join thousands of developers creating beautiful data visualizations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: _getResponsiveFontSize(context, 16, 17, 18),
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 40),
          _buildPrimaryButton(
            'Start Building Now',
            Icons.arrow_forward,
            widget.onExploreCharts,
            isLight: true,
            isFullWidth: isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection() {
    final isMobile = _isMobile(context);
    final padding = _getResponsivePadding(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
      ),
      child:
          isMobile
              ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.auto_graph,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Material Charts',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Interactive Flutter Chart Library',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '© 2024 Material Charts. Built for developers.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.auto_graph,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Material Charts',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Interactive Flutter Chart Library',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    '© 2024 Material Charts. Built for developers.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
    );
  }

  Widget _buildFeatureCard(
    String title,
    String description,
    IconData icon,
    Color color,
    int delay,
  ) {
    final isMobile = _isMobile(context);

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800 + delay),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              padding: EdgeInsets.all(isMobile ? 24 : 32),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(isMobile ? 20 : 24),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color, color.withOpacity(0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: isMobile ? 28 : 32,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context, 20, 22, 24),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: isMobile ? 8 : 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context, 14, 15, 16),
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildChartShowcaseCard(ChartShowcase showcase) {
    final isMobile = _isMobile(context);
    final isTablet = _isTablet(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20),
      padding: EdgeInsets.all(isMobile ? 20 : (isTablet ? 30 : 40)),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(isMobile ? 20 : 24),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: showcase.color.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child:
          isMobile
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          showcase.color,
                          showcase.color.withOpacity(0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(showcase.icon, color: Colors.white, size: 32),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    showcase.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    showcase.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...showcase.features.map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: showcase.color,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            feature,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
              : Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                showcase.color,
                                showcase.color.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            showcase.icon,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          showcase.name,
                          style: TextStyle(
                            fontSize: isTablet ? 28 : 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          showcase.description,
                          style: TextStyle(
                            fontSize: isTablet ? 16 : 18,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ...showcase.features.map(
                          (feature) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: showcase.color,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  feature,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile) ...[
                    const SizedBox(width: 40),
                    Expanded(
                      child: Container(
                        height: isTablet ? 250 : 300,
                        decoration: BoxDecoration(
                          color: showcase.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: showcase.color.withOpacity(0.2),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            showcase.icon,
                            size: isTablet ? 60 : 80,
                            color: showcase.color.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
    );
  }

  Widget _buildPrimaryButton(
    String text,
    IconData icon,
    VoidCallback onPressed, {
    bool isLight = false,
    bool isFullWidth = false,
  }) {
    final isMobile = _isMobile(context);

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 32,
              vertical: isMobile ? 12 : 16,
            ),
            decoration: BoxDecoration(
              gradient:
                  isLight
                      ? LinearGradient(
                        colors: [Colors.white, Colors.white.withOpacity(0.9)],
                      )
                      : AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: (isLight ? Colors.black : AppColors.primary)
                      .withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isLight ? AppColors.primary : Colors.white,
                  size: isMobile ? 18 : 20,
                ),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: isLight ? AppColors.primary : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(
    String text,
    IconData icon,
    VoidCallback onPressed, {
    bool isFullWidth = false,
  }) {
    final isMobile = _isMobile(context);

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 32,
              vertical: isMobile ? 12 : 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: AppColors.textSecondary,
                  size: isMobile ? 18 : 20,
                ),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingParticle(int index) {
    final random = (index * 37) % 100;
    final size = 4.0 + (random % 8);
    final left = (random % 90) + 5.0;
    final top = ((random * 17) % 80) + 10.0;
    final duration = 3000 + (random % 2000);

    return Positioned(
      left: MediaQuery.of(context).size.width * left / 100,
      top: MediaQuery.of(context).size.height * top / 100,
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: duration),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, -20 * value),
            child: Opacity(
              opacity: (0.5 - (value * 0.5)).clamp(0.0, 1.0),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDocumentation() {
    html.window.open('https://buymeacoffee.com/vishnudas', '_blank');
  }
}

class ChartShowcase {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> features;

  ChartShowcase({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.features,
  });
}
